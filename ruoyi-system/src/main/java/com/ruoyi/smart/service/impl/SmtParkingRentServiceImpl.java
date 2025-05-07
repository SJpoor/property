package com.ruoyi.smart.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.smart.domain.SmtFeeList;
import com.ruoyi.smart.domain.SmtFeeRecord;
import com.ruoyi.smart.mapper.*;
import com.ruoyi.system.mapper.SysUserMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.domain.SmtParkingRent;
import com.ruoyi.smart.service.ISmtParkingRentService;

/**
 * 车位租赁信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtParkingRentServiceImpl implements ISmtParkingRentService 
{
    @Autowired
    private SmtParkingRentMapper smtParkingRentMapper;
    @Autowired
    private SmtParkingSpaceMapper smtParkingSpaceMapper;
    @Autowired
    private SmtFeeMapper smtFeeMapper;

    @Autowired
    private SmtFeeRecordMapper smtFeeRecordMapper;

    @Autowired
    private SmtOwnerParkingSpaceMapper smtOwnerParkingSpaceMapper;

    @Autowired
    private SmtFeeListMapper smtFeeListMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 查询车位租赁信息
     * 
     * @param parkingRentId 车位租赁信息主键
     * @return 车位租赁信息
     */
    @Override
    public SmtParkingRent selectSmtParkingRentByParkingRentId(Long parkingRentId)
    {
        return smtParkingRentMapper.selectSmtParkingRentByParkingRentId(parkingRentId);
    }

    /**
     * 查询车位租赁信息列表
     * 
     * @param smtParkingRent 车位租赁信息
     * @return 车位租赁信息
     */
    @Override
    public List<SmtParkingRent> selectSmtParkingRentList(SmtParkingRent smtParkingRent)
    {
        List<SmtParkingRent> list = smtParkingRentMapper.selectSmtParkingRentList(smtParkingRent);
        return list;
    }

    /**
     * 新增车位租赁信息
     * 
     * @param smtParkingRent 车位租赁信息
     * @return 结果
     */
    @Override
    public int insertSmtParkingRent(SmtParkingRent smtParkingRent)
    {
        // 根据开始结束时间业主车位查询租赁信息进行删除
        SmtParkingRent condition = new SmtParkingRent();
        condition.setOwnerId(smtParkingRent.getOwnerId());
        condition.setParkingSpaceId(smtParkingRent.getParkingSpaceId());
        condition.setStartTimeStr(DateUtils.parseDateToStr("yyyy-MM-dd",smtParkingRent.getStartTime()));
        condition.setEndTimeStr(DateUtils.parseDateToStr("yyyy-MM-dd",smtParkingRent.getEndTime()));
        List<SmtParkingRent> list = smtParkingRentMapper.selectSmtParkingRentList(condition);
        if(CollectionUtils.isNotEmpty(list)){
            List<Long> collect = list.stream().map(SmtParkingRent::getParkingRentId).distinct().collect(Collectors.toList());
            smtParkingRentMapper.deleteSmtParkingRentByParkingRentIds(collect.toArray(new Long[0]));
        }
        smtParkingRent.setCreateTime(DateUtils.getNowDate());
        int i = smtParkingRentMapper.insertSmtParkingRent(smtParkingRent);
        //insertFeeRecord(smtParkingRent);
        return i;
    }


    /**
     * 修改车位租赁信息
     * 
     * @param smtParkingRent 车位租赁信息
     * @return 结果
     */
    @Override
    public int updateSmtParkingRent(SmtParkingRent smtParkingRent)
    {
        smtParkingRent.setUpdateTime(DateUtils.getNowDate());
        insertFee(smtParkingRent);
        return smtParkingRentMapper.updateSmtParkingRent(smtParkingRent);
    }

    /**
     * 批量删除车位租赁信息
     * 
     * @param parkingRentIds 需要删除的车位租赁信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingRentByParkingRentIds(Long[] parkingRentIds)
    {
        return smtParkingRentMapper.deleteSmtParkingRentByParkingRentIds(parkingRentIds);
    }

    /**
     * 删除车位租赁信息信息
     * 
     * @param parkingRentId 车位租赁信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingRentByParkingRentId(Long parkingRentId)
    {
        return smtParkingRentMapper.deleteSmtParkingRentByParkingRentId(parkingRentId);
    }

    @Override
    public int updateStatus(SmtParkingRent smtParkingRent) {
        return smtParkingRentMapper.updateSmtParkingRent(smtParkingRent);
    }

    @Override
    public int insertSmtParkingRentFee(SmtParkingRent smtParkingRent) {
        return insertFee(smtParkingRent);
    }

    private int insertFee(SmtParkingRent smtParkingRent) {
        SysUser owner = sysUserMapper.selectUserById(smtParkingRent.getOwnerId());
        SmtFeeList feeList = new SmtFeeList();
        feeList.setFeeId(smtParkingRent.getFeeId());
        String startTime = DateUtils.parseDateToStr("yyyy-MM-dd",smtParkingRent.getStartTime());
        String endTime = DateUtils.parseDateToStr("yyyy-MM-dd",smtParkingRent.getEndTime());
        String title = "【"+startTime+" ~ "+endTime+"的车位租赁费】";
        feeList.setTitle(title);
        feeList.setAmount(smtParkingRent.getRentAmount());
        feeList.setOwnerId(smtParkingRent.getOwnerId());
        feeList.setCreateTime(DateUtils.getNowDate());
        feeList.setCreateBy(smtParkingRent.getCreateBy());
        smtFeeListMapper.insertSmtFeeList(feeList);

        SmtParkingRent original = smtParkingRentMapper.selectSmtParkingRentByParkingRentId(smtParkingRent.getParkingRentId());
        original.setFeeStatus("1");
        return smtParkingRentMapper.updateSmtParkingRent(original);
    }
}
