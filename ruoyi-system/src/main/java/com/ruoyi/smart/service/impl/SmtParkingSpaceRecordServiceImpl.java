package com.ruoyi.smart.service.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

import com.ruoyi.common.core.domain.entity.SmtParkingSpace;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.smart.domain.*;
import com.ruoyi.smart.mapper.*;
import com.ruoyi.system.domain.SysAttr;
import com.ruoyi.system.mapper.SysAttrMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.service.ISmtParkingSpaceRecordService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 车位使用信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-03-02
 */
@Service
public class SmtParkingSpaceRecordServiceImpl implements ISmtParkingSpaceRecordService 
{
    @Autowired
    private SmtParkingSpaceRecordMapper smtParkingSpaceRecordMapper;

    @Autowired
    private SysAttrMapper sysAttrMapper;

    @Autowired
    private SmtParkingSpaceMapper smtParkingSpaceMapper;

    @Autowired
    private SmtOwnerParkingSpaceMapper smtOwnerParkingSpaceMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SmtFeeMapper smtFeeMapper;

    @Autowired
    private SmtFeeListMapper smtFeeListMapper;

    /**
     * 查询车位使用信息
     * 
     * @param parkingRecordId 车位使用信息主键
     * @return 车位使用信息
     */
    @Override
    public SmtParkingSpaceRecord selectSmtParkingSpaceRecordByParkingRecordId(Long parkingRecordId)
    {
        return smtParkingSpaceRecordMapper.selectSmtParkingSpaceRecordByParkingRecordId(parkingRecordId);
    }

    /**
     * 查询车位使用信息列表
     * 
     * @param smtParkingSpaceRecord 车位使用信息
     * @return 车位使用信息
     */
    @Override
    public List<SmtParkingSpaceRecord> selectSmtParkingSpaceRecordList(SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(!user.isAdmin()){
            smtParkingSpaceRecord.setOwnerId(user.getUserId());
        }
        return smtParkingSpaceRecordMapper.selectSmtParkingSpaceRecordList(smtParkingSpaceRecord);
    }

    /**
     * 新增车位使用信息
     * 
     * @param smtParkingSpaceRecord 车位使用信息
     * @return 结果
     */
    @Override
    @Transactional
    public int insertSmtParkingSpaceRecord(SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
        SysUser owner = SecurityUtils.getLoginUser().getUser();
        SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtParkingSpaceRecord.getParkingSpaceId());
        if("1".equals(smtParkingSpace.getParkingSpaceType()) && !owner.isAdmin() ){
            SmtOwnerParkingSpace smtOwnerParkingSpace = new SmtOwnerParkingSpace();
            smtOwnerParkingSpace.setOwnerId(smtParkingSpaceRecord.getOwnerId());
            smtOwnerParkingSpace.setParkingSpaceId(smtParkingSpaceRecord.getParkingSpaceId());
            List<SmtOwnerParkingSpace> list = smtOwnerParkingSpaceMapper.selectSmtOwnerParkingSpaceList(smtOwnerParkingSpace);
            if(CollectionUtils.isEmpty(list)){
                SmtParkingSpace parkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtParkingSpaceRecord.getParkingRecordId());
                throw new ServiceException("业主："+owner.getNickName()+",没有车位:"+parkingSpace.getParkingSpaceNo()+"的权限");
            }
        }
        if(!owner.isAdmin()){
            smtParkingSpaceRecord.setOwnerId(owner.getUserId());
        }
        smtParkingSpaceRecord.setCreateTime(DateUtils.getNowDate());
        // 驶入时间
        smtParkingSpaceRecord.setDriveInTime(DateUtils.getNowDate());

        int rows = smtParkingSpaceRecordMapper.insertSmtParkingSpaceRecord(smtParkingSpaceRecord);
        // 更新附件
        if(null != smtParkingSpaceRecord.getAttr()){
            save(smtParkingSpaceRecord);
        }
        return rows;
    }

    /**
     * 修改车位使用信息
     * 
     * @param smtParkingSpaceRecord 车位使用信息
     * @return 结果
     */
    @Override
    public int updateSmtParkingSpaceRecord(SmtParkingSpaceRecord smtParkingSpaceRecord)
    {
       /* smtParkingSpaceRecord.setUpdateTime(DateUtils.getNowDate());
        if(StringUtils.isNotBlank(smtParkingSpaceRecord.getPlateNo()) && null != smtParkingSpaceRecord.getParkingSpaceId()){
            // 修改车位状态为空闲
            SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtParkingSpaceRecord.getParkingSpaceId());
            // 查询对应的车位使用记录

            //逻辑错误：前端传的数据时特定车牌和车位，导致返回了这个的全部记录，导致失败：重复使用
            List<SmtParkingSpaceRecord> list = smtParkingSpaceRecordMapper.selectSmtParkingSpaceRecordList(smtParkingSpaceRecord);
            if(CollectionUtils.isNotEmpty(list)){
                if(list.size() > 1){
                    throw new ServiceException("请勿重复使用车位！");
                }
            }else{
                throw new ServiceException("车牌:"+smtParkingSpaceRecord.getPlateNo()+"查无该车位："+smtParkingSpace.getParkingSpaceNo()+"的使用记录！");
            }
            smtParkingSpace.setParkingSpaceStatus("0");
            smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);

            smtParkingSpaceRecord = list.get(0);
            smtParkingSpaceRecord.setDriveOutTime(DateUtils.getNowDate());
        }
        if("0".equals(smtParkingSpaceRecord.getDriveStatus())){
            smtParkingSpaceRecord.setDriveOutTime(DateUtils.getNowDate());
        }
        return smtParkingSpaceRecordMapper.updateSmtParkingSpaceRecord(smtParkingSpaceRecord);*/

        //不适用组合查询，直接通过记录id进行修改驶出信息
        smtParkingSpaceRecord.setUpdateTime(DateUtils.getNowDate());
        // 优先通过记录ID直接操作
        if (smtParkingSpaceRecord.getParkingRecordId() != null) {
            // 通过ID获取记录
            SmtParkingSpaceRecord existingRecord = smtParkingSpaceRecordMapper.selectSmtParkingSpaceRecordByParkingRecordId(smtParkingSpaceRecord.getParkingRecordId());
            if (existingRecord != null) {
                // 修改车位状态为空闲
                if (StringUtils.isNotBlank(smtParkingSpaceRecord.getPlateNo()) &&
                        !smtParkingSpaceRecord.getPlateNo().equals(existingRecord.getPlateNo())) {
                    throw new ServiceException("车牌不匹配，无法操作该车位记录！");
                }
                if (existingRecord.getParkingSpaceId() != null) {
                    SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(existingRecord.getParkingSpaceId());
                    if (smtParkingSpace != null) {
                        smtParkingSpace.setParkingSpaceStatus("0");
                        smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);
                    }
                }

                // 设置驶出时间
                if ("0".equals(smtParkingSpaceRecord.getDriveStatus())) {
                    existingRecord.setDriveOutTime(DateUtils.getNowDate());
                    return smtParkingSpaceRecordMapper.updateSmtParkingSpaceRecord(existingRecord);
                }
            }
        }

        // 如果没有记录ID或者通过ID找不到记录，才回退到组合条件查询方式.避免组合查询导致的多记录问题。
        if(StringUtils.isNotBlank(smtParkingSpaceRecord.getPlateNo()) && null != smtParkingSpaceRecord.getParkingSpaceId()){
            // 修改车位状态为空闲
            SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtParkingSpaceRecord.getParkingSpaceId());

            // 增加查询条件：只查询未驶出的记录
            if (smtParkingSpaceRecord.getDriveOutTime() == null) {
                SmtParkingSpaceRecord queryRecord = new SmtParkingSpaceRecord();
                queryRecord.setParkingSpaceId(smtParkingSpaceRecord.getParkingSpaceId());
                queryRecord.setPlateNo(smtParkingSpaceRecord.getPlateNo());
                queryRecord.setDriveOutTime(null); // 明确只查询未驶出的记录

                // 查询对应的车位使用记录
                //缺少驶出时间为努力了，导致返回所有记录，导致提示请勿重复使用车位
                List<SmtParkingSpaceRecord> list = smtParkingSpaceRecordMapper.selectSmtParkingSpaceRecordList(queryRecord);
                if(CollectionUtils.isNotEmpty(list)){
                    if(list.size() > 1){
                        // 如果仍然有多条记录，选择最新的一条更新
                        list.sort((a, b) -> b.getDriveInTime().compareTo(a.getDriveInTime()));
                        // 更新车位状态
                        smtParkingSpace.setParkingSpaceStatus("0");
                        smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);

                        SmtParkingSpaceRecord latestRecord = list.get(0);
                        latestRecord.setDriveOutTime(DateUtils.getNowDate());
                        return smtParkingSpaceRecordMapper.updateSmtParkingSpaceRecord(latestRecord);
                    } else {
                        smtParkingSpace.setParkingSpaceStatus("0");
                        smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);

                        SmtParkingSpaceRecord record = list.get(0);
                        record.setDriveOutTime(DateUtils.getNowDate());
                        return smtParkingSpaceRecordMapper.updateSmtParkingSpaceRecord(record);
                    }
                } else {
                    throw new ServiceException("车牌:"+smtParkingSpaceRecord.getPlateNo()+"查无该车位："+smtParkingSpace.getParkingSpaceNo()+"的使用记录！");
                }
            }
        }

        // 处理其他情况
        if("0".equals(smtParkingSpaceRecord.getDriveStatus())){
            smtParkingSpaceRecord.setDriveOutTime(DateUtils.getNowDate());
        }
        return smtParkingSpaceRecordMapper.updateSmtParkingSpaceRecord(smtParkingSpaceRecord);

    }

    private void save(SmtParkingSpaceRecord smtParkingSpaceRecord) {
        SysAttr attr = smtParkingSpaceRecord.getAttr();
        SysAttr originAttr = sysAttrMapper.selectSysAttrByAttrId(attr.getAttrId());
        originAttr.setBizId(smtParkingSpaceRecord.getParkingRecordId());
        sysAttrMapper.updateSysAttr(originAttr);
        // 修改停车位状态
        SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtParkingSpaceRecord.getParkingSpaceId());
        // 占用
        smtParkingSpace.setParkingSpaceStatus("1");
        smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);
    }

    /**
     * 批量删除车位使用信息
     * 
     * @param parkingRecordIds 需要删除的车位使用信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingSpaceRecordByParkingRecordIds(Long[] parkingRecordIds)
    {
        return smtParkingSpaceRecordMapper.deleteSmtParkingSpaceRecordByParkingRecordIds(parkingRecordIds);
    }

    /**
     * 删除车位使用信息信息
     * 
     * @param parkingRecordId 车位使用信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingSpaceRecordByParkingRecordId(Long parkingRecordId)
    {
        return smtParkingSpaceRecordMapper.deleteSmtParkingSpaceRecordByParkingRecordId(parkingRecordId);
    }

    @Override
    public int insertParkingSpaceFee(SmtParkingSpaceRecord smtParkingSpaceRecord) {
        List<SmtFee> smtFees = smtFeeMapper.selectSmtFeeList(new SmtFee());
        AtomicReference<SmtFee> fee = new AtomicReference<>(new SmtFee());
        smtFees.stream().filter(item->item.getFeeType().equals("3")).findFirst().ifPresent(e->{
            fee.set(e);
        });
        SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtParkingSpaceRecord.getParkingSpaceId());
        SmtFeeList feeList = new SmtFeeList();
        feeList.setFeeId(fee.get().getFeeId());
        String title = "【车位："+smtParkingSpace.getParkingSpaceNo()+"的停车费】";
        feeList.setTitle(title);
        Date driveInTime = smtParkingSpaceRecord.getDriveInTime();
        Date driveOutTime = smtParkingSpaceRecord.getDriveOutTime();
        feeList.setAmount(fee.get().getPrice().multiply(getBettweenHours(driveInTime,driveOutTime)));
        feeList.setOwnerId(smtParkingSpaceRecord.getOwnerId());
        feeList.setCreateTime(DateUtils.getNowDate());
        feeList.setCreateBy(smtParkingSpaceRecord.getCreateBy());
        smtFeeListMapper.insertSmtFeeList(feeList);

        SmtParkingSpaceRecord original = smtParkingSpaceRecordMapper.selectSmtParkingSpaceRecordByParkingRecordId(smtParkingSpaceRecord.getParkingRecordId());
        original.setFeeStatus("1");
        return smtParkingSpaceRecordMapper.updateSmtParkingSpaceRecord(original);
    }

    private static BigDecimal getBettweenHours(Date startTime,Date endTime){
        ZonedDateTime zonedStartDateTime = startTime.toInstant()
                .atZone(ZoneId.systemDefault()); // 指定时区
        ZonedDateTime zonedEndDateTime = endTime.toInstant()
                .atZone(ZoneId.systemDefault()); // 指定时区

        // 定义两个日期时间
        LocalDateTime date1 = zonedStartDateTime.toLocalDateTime();
        LocalDateTime date2 = zonedEndDateTime.toLocalDateTime();

        // 计算两个日期时间的差值
        Duration duration = Duration.between(date1, date2);

        // 获取总小时数
        //long hoursDifference = duration.toHours(); // 总小时数
        double preciseHoursDifference = duration.toMinutes() / 60.0; // 精确到小数的小时数
        return new BigDecimal(preciseHoursDifference).setScale(2, RoundingMode.HALF_UP);
    }

}
