package com.ruoyi.smart.service.impl;

import com.ruoyi.common.core.domain.entity.SmtParkingSpace;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.smart.domain.SmtOwnerHouse;
import com.ruoyi.smart.domain.SmtOwnerParkingSpace;
import com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper;
import com.ruoyi.smart.mapper.SmtParkingSpaceMapper;
import com.ruoyi.smart.service.ISmtOwnerParkingSpaceService;
import com.ruoyi.system.domain.SysAttr;
import com.ruoyi.system.mapper.SysAttrMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * 业主车位信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtOwnerParkingSpaceServiceImpl implements ISmtOwnerParkingSpaceService 
{
    @Autowired
    private SmtOwnerParkingSpaceMapper smtOwnerParkingSpaceMapper;
    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SmtParkingSpaceMapper smtParkingSpaceMapper;

    @Autowired
    private SysAttrMapper sysAttrMapper;

    /**
     * 查询业主车位信息
     * 
     * @param ownerParkingSpaceId 业主车位信息主键
     * @return 业主车位信息
     */
    @Override
    public SmtOwnerParkingSpace selectSmtOwnerParkingSpaceByOwnerParkingId(Long ownerParkingSpaceId)
    {
        return smtOwnerParkingSpaceMapper.selectSmtOwnerParkingSpaceByOwnerParkingId(ownerParkingSpaceId);
    }

    /**
     * 查询业主车位信息列表
     * 
     * @param smtOwnerParkingSpace 业主车位信息
     * @return 业主车位信息
     */
    @Override
    public List<SmtOwnerParkingSpace> selectSmtOwnerParkingSpaceList(SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        List<SmtOwnerParkingSpace> list = smtOwnerParkingSpaceMapper.selectSmtOwnerParkingSpaceList(smtOwnerParkingSpace);

        return list;
    }

    /**
     * 新增业主车位信息
     * 
     * @param smtOwnerParkingSpace 业主车位信息
     * @return 结果
     */
    @Override
    public int insertSmtOwnerParkingSpace(SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        Date nowDate = DateUtils.getNowDate();

        List<Long> parkingSpaceIds = smtOwnerParkingSpace.getParkingSpaceIds();
        int rows = 0;
        if(CollectionUtils.isNotEmpty(parkingSpaceIds)){
            for (Long parkingSpaceId : parkingSpaceIds) {
                SmtOwnerParkingSpace newParkSpace = new SmtOwnerParkingSpace();
                BeanUtils.copyProperties(smtOwnerParkingSpace,newParkSpace);
                newParkSpace.setCreateTime(nowDate);
                newParkSpace.setParkingSpaceId(parkingSpaceId);
                // 更新附件
                /*if(null != newParkSpace.getAttr()){
                    save(newParkSpace);
                }*/
                rows =  smtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace(newParkSpace);
            }
        }
        if(null != smtOwnerParkingSpace.getOwnerParkingId()){
            smtOwnerParkingSpace.setCreateTime(nowDate);
            // 更新附件
            /*if(null != smtOwnerParkingSpace.getAttr()){
                save(smtOwnerParkingSpace);
            }*/
            rows =  smtOwnerParkingSpaceMapper.insertSmtOwnerParkingSpace(smtOwnerParkingSpace);
        }
        return rows;
    }

    /**
     * 修改业主车位信息
     * 
     * @param smtOwnerParkingSpace 业主车位信息
     * @return 结果
     */
    @Override
    public int updateSmtOwnerParkingSpace(SmtOwnerParkingSpace smtOwnerParkingSpace)
    {
        smtOwnerParkingSpace.setUpdateTime(DateUtils.getNowDate());
        // 更新附件
        if(null != smtOwnerParkingSpace.getAttr()){
            save(smtOwnerParkingSpace);
        }
        return smtOwnerParkingSpaceMapper.updateSmtOwnerParkingSpace(smtOwnerParkingSpace);
    }

    private void save(SmtOwnerParkingSpace smtOwnerParkingSpace) {
        /*SmtOwnerParkingSpace condition = new SmtOwnerParkingSpace();
        condition.setParkingSpaceId(smtOwnerParkingSpace.getParkingSpaceId());
        condition.setOwnerId(smtOwnerParkingSpace.getOwnerId());
        List<SmtOwnerParkingSpace> list = smtOwnerParkingSpaceMapper.selectSmtOwnerParkingSpaceList(condition);
        SysAttr attr = smtOwnerParkingSpace.getAttr();
        SysAttr originAttr = sysAttrMapper.selectSysAttrByAttrId(attr.getAttrId());
        originAttr.setBizId(smtOwnerParkingSpace.getParkingSpaceId());
        sysAttrMapper.updateSysAttr(originAttr);
        // 修改停车位状态
        SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtOwnerParkingSpace.getParkingSpaceId());
        // 占用
        smtParkingSpace.setParkingSpaceStatus("1");
        smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);*/
    }

    /**
     * 批量删除业主车位信息
     * 
     * @param ownerParkingSpaceIds 需要删除的业主车位信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtOwnerParkingSpaceByOwnerParkingIds(Long[] ownerParkingSpaceIds)
    {
        return smtOwnerParkingSpaceMapper.deleteSmtOwnerParkingSpaceByOwnerParkingIds(ownerParkingSpaceIds);
    }

    /**
     * 删除业主车位信息信息
     * 
     * @param ownerParkingSpaceId 业主车位信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtOwnerParkingSpaceByOwnerParkingId(Long ownerParkingSpaceId)
    {
        SmtOwnerParkingSpace smtOwnerParkingSpace = smtOwnerParkingSpaceMapper.selectSmtOwnerParkingSpaceByOwnerParkingId(ownerParkingSpaceId);
        SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtOwnerParkingSpace.getParkingSpaceId());
        smtParkingSpace.setParkingSpaceStatus("0");
        smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);
        return smtOwnerParkingSpaceMapper.deleteSmtOwnerParkingSpaceByOwnerParkingId(ownerParkingSpaceId);
    }

    @Override
    public int updateStatus(SmtOwnerParkingSpace smtOwnerParkingSpace) {
        return smtOwnerParkingSpaceMapper.updateSmtOwnerParkingSpace(smtOwnerParkingSpace);
    }

    @Override
    public int deleteOwnerParkingSpace(SmtOwnerParkingSpace smtOwnerParkingSpace) {
        SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(smtOwnerParkingSpace.getParkingSpaceId());
        smtParkingSpace.setParkingSpaceStatus("0");
        smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);
        return smtOwnerParkingSpaceMapper.deleteOwnerParkingSpace(smtOwnerParkingSpace);
    }

    @Override
    public int deleteByParkingSpaceIds(Long[] parkingSpaceIds) {
        for (Long parkingSpaceId : parkingSpaceIds) {
            SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(parkingSpaceId);
            smtParkingSpace.setParkingSpaceStatus("0");
            smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);
        }
        return smtOwnerParkingSpaceMapper.deleteByParkingSpaceIds(parkingSpaceIds);
    }
}
