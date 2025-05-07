package com.ruoyi.smart.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.SmtHouse;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.core.domain.entity.SmtParkingLot;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.smart.domain.SmtOwnerHouse;
import com.ruoyi.smart.domain.SmtOwnerParkingSpace;
import com.ruoyi.smart.mapper.SmtOwnerParkingSpaceMapper;
import com.ruoyi.smart.mapper.SmtParkingLotMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtParkingSpaceMapper;
import com.ruoyi.common.core.domain.entity.SmtParkingSpace;
import com.ruoyi.smart.service.ISmtParkingSpaceService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 车位信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtParkingSpaceServiceImpl implements ISmtParkingSpaceService 
{
    @Autowired
    private SmtParkingSpaceMapper smtParkingSpaceMapper;

    @Autowired
    private SmtParkingLotMapper smtParkingLotMapper;

    @Autowired
    private SmtOwnerParkingSpaceMapper smtOwnerParkingSpaceMapper;

    /**
     * 查询车位信息
     * 
     * @param parkingSpaceId 车位信息主键
     * @return 车位信息
     */
    @Override
    public SmtParkingSpace selectSmtParkingSpaceByParkingSpaceId(Long parkingSpaceId)
    {
        return smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(parkingSpaceId);
    }

    /**
     * 查询车位信息列表
     * 
     * @param smtParkingSpace 车位信息
     * @return 车位信息
     */
    @Override
    public List<SmtParkingSpace> selectSmtParkingSpaceList(SmtParkingSpace smtParkingSpace)
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(!user.isAdmin()){
            smtParkingSpace.setOwnerId(user.getUserId());
            smtParkingSpace.setShowTemp("1");
        }
        List<SmtParkingSpace> list = smtParkingSpaceMapper.selectSmtParkingSpaceList(smtParkingSpace);
        return list;
    }

    /**
     * 新增车位信息
     * 
     * @param smtParkingSpace 车位信息
     * @return 结果
     */
    @Override
    public int insertSmtParkingSpace(SmtParkingSpace smtParkingSpace)
    {
        smtParkingSpace.setCreateTime(DateUtils.getNowDate());
        return smtParkingSpaceMapper.insertSmtParkingSpace(smtParkingSpace);
    }

    /**
     * 修改车位信息
     * 
     * @param smtParkingSpace 车位信息
     * @return 结果
     */
    @Override
    public int updateSmtParkingSpace(SmtParkingSpace smtParkingSpace)
    {
        smtParkingSpace.setUpdateTime(DateUtils.getNowDate());
        return smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);
    }

    /**
     * 批量删除车位信息
     * 
     * @param parkingSpaceIds 需要删除的车位信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingSpaceByParkingSpaceIds(Long[] parkingSpaceIds)
    {
        return smtParkingSpaceMapper.deleteSmtParkingSpaceByParkingSpaceIds(parkingSpaceIds);
    }

    /**
     * 删除车位信息信息
     * 
     * @param parkingSpaceId 车位信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingSpaceByParkingSpaceId(Long parkingSpaceId)
    {
        return smtParkingSpaceMapper.deleteSmtParkingSpaceByParkingSpaceId(parkingSpaceId);
    }

    @Override
    public int updateStatus(SmtParkingSpace smtParkingSpace) {
        return smtParkingSpaceMapper.updateSmtParkingSpace(smtParkingSpace);
    }

    @Override
    public List<SmtParkingSpace> selectParkingSpaceByOwnerId(Long ownerId) {
        List<SmtParkingSpace> ownerParkingSpaces = smtParkingSpaceMapper.selectParkingSpaceByOwnerId(ownerId);
        SmtParkingSpace smtParkingSpace = new SmtParkingSpace();
        smtParkingSpace.setParkingSpaceType("1");
        smtParkingSpace.setAssignStatus("1");
        smtParkingSpace.setUserId(ownerId);
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(!user.isAdmin()){
            smtParkingSpace.setOwnerId(ownerId);
        }
        List<SmtParkingSpace> parkingSpaces = smtParkingSpaceMapper.selectSmtParkingSpaceList(smtParkingSpace);
        for (SmtParkingSpace parkingSpace : parkingSpaces)
        {
            for (SmtParkingSpace ownerParkingSpace : ownerParkingSpaces)
            {
                if (parkingSpace.getParkingSpaceId().longValue() == ownerParkingSpace.getParkingSpaceId().longValue())
                {
                    parkingSpace.setFlag(true);
                    break;
                }
            }
        }
        return parkingSpaces;
    }

    @Override
    @Transactional
    public void insertAuthOwnerParkingSpace(Long ownerId, Long[] parkingSpaceIds) {
       /* List<SmtParkingSpace> parkingSpaces = smtParkingSpaceMapper.selectParkingSpaceByOwnerId(ownerId);
        for (SmtParkingSpace parkingSpace : parkingSpaces) {
            parkingSpace.setParkingSpaceStatus("0");
            smtParkingSpaceMapper.updateSmtParkingSpace(parkingSpace);
        }*/
        smtOwnerParkingSpaceMapper.deleteOwnerParkingSpaceByOwnerId(ownerId);
        if(StringUtils.isNotEmpty(parkingSpaceIds)){
            SmtOwnerParkingSpace smtOwnerParkingSpace = new SmtOwnerParkingSpace();
            smtOwnerParkingSpace.setParkingSpaceIds(Arrays.asList(parkingSpaceIds));
            List<SmtOwnerParkingSpace> list = smtOwnerParkingSpaceMapper.selectSmtOwnerParkingSpaceList(smtOwnerParkingSpace);
            List<String> msg = new ArrayList<>();
            if(CollectionUtils.isNotEmpty(list)){
                for (SmtOwnerParkingSpace ownerParkingSpace : list) {
                    if(!ownerId.equals(ownerParkingSpace.getOwnerId())){
                        SmtParkingSpace smtParkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(ownerParkingSpace.getParkingSpaceId());
                        msg.add(smtParkingSpace.getParkingSpaceNo());
                    }
                }
            }
            if(CollectionUtils.isNotEmpty(msg)){
                throw new ServiceException(msg.stream().collect(Collectors.joining(","))+"已分配给其他业主，请勿重复分配！");
            }

            insertOwnerParkingSpace(ownerId, parkingSpaceIds);
        }
    }

    private void insertOwnerParkingSpace(Long ownerId, Long[] parkingSpaceIds) {
        // 新增业主与房屋管理
        List<SmtOwnerParkingSpace> list = new ArrayList<SmtOwnerParkingSpace>(parkingSpaceIds.length);
        for (Long parkingSpaceId : parkingSpaceIds)
        {
            SmtOwnerParkingSpace ur = new SmtOwnerParkingSpace();
            ur.setOwnerId(ownerId);
            ur.setParkingSpaceId(parkingSpaceId);
            list.add(ur);
        }
        smtOwnerParkingSpaceMapper.batchOwnerParkingSpace(list);
        /*for (Long parkingSpaceId : parkingSpaceIds) {
            SmtParkingSpace parkingSpace = smtParkingSpaceMapper.selectSmtParkingSpaceByParkingSpaceId(parkingSpaceId);
            parkingSpace.setParkingSpaceStatus("1");
            smtParkingSpaceMapper.updateSmtParkingSpace(parkingSpace);
        }*/
    }
}
