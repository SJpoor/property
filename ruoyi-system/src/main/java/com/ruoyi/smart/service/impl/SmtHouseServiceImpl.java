package com.ruoyi.smart.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.SmtOwner;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.smart.domain.SmtOwnerHouse;
import com.ruoyi.smart.mapper.SmtOwnerHouseMapper;
import com.ruoyi.system.domain.SysUserRole;
import com.ruoyi.system.mapper.SysUserMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtHouseMapper;
import com.ruoyi.common.core.domain.entity.SmtHouse;
import com.ruoyi.smart.service.ISmtHouseService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 房屋信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtHouseServiceImpl implements ISmtHouseService 
{
    @Autowired
    private SmtHouseMapper smtHouseMapper;

    @Autowired
    private SmtOwnerHouseMapper smtOwnerHouseMapper;

    @Autowired
    private SysUserMapper sysUserMapper;


    /**
     * 查询房屋信息
     * 
     * @param houseId 房屋信息主键
     * @return 房屋信息
     */
    @Override
    public SmtHouse selectSmtHouseByHouseId(Long houseId)
    {
        return smtHouseMapper.selectSmtHouseByHouseId(houseId);
    }

    /**
     * 查询房屋信息列表
     * 
     * @param smtHouse 房屋信息
     * @return 房屋信息
     */
    @Override
    public List<SmtHouse> selectSmtHouseList(SmtHouse smtHouse)
    {
        return smtHouseMapper.selectSmtHouseList(smtHouse);
    }

    /**
     * 新增房屋信息
     * 
     * @param smtHouse 房屋信息
     * @return 结果
     */
    @Override
    public int insertSmtHouse(SmtHouse smtHouse)
    {
        smtHouse.setCreateTime(DateUtils.getNowDate());
        return smtHouseMapper.insertSmtHouse(smtHouse);
    }

    /**
     * 修改房屋信息
     * 
     * @param smtHouse 房屋信息
     * @return 结果
     */
    @Override
    public int updateSmtHouse(SmtHouse smtHouse)
    {
        smtHouse.setUpdateTime(DateUtils.getNowDate());
        return smtHouseMapper.updateSmtHouse(smtHouse);
    }

    /**
     * 批量删除房屋信息
     * 
     * @param houseIds 需要删除的房屋信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtHouseByHouseIds(Long[] houseIds)
    {
        return smtHouseMapper.deleteSmtHouseByHouseIds(houseIds);
    }

    /**
     * 删除房屋信息信息
     * 
     * @param houseId 房屋信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtHouseByHouseId(Long houseId)
    {
        return smtHouseMapper.deleteSmtHouseByHouseId(houseId);
    }

    @Override
    public int updateStatus(SmtHouse smtHouse) {
        return smtHouseMapper.updateSmtHouse(smtHouse);
    }

    @Override
    public List<SmtHouse> selectHouseByOwnerId(Long ownerId) {
        List<SmtHouse> ownerHouses = smtHouseMapper.selectHouseByOwnerId(ownerId);
        SmtHouse smtHouse = new SmtHouse();
        smtHouse.setAssignStatus("1");
        smtHouse.setUserId(ownerId);
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(!user.isAdmin()){
            smtHouse.setOwnerId(ownerId);
        }
        List<SmtHouse> houses = smtHouseMapper.selectSmtHouseList(smtHouse);
        for (SmtHouse house : houses)
        {
            for (SmtHouse ownerHouse : ownerHouses)
            {
                if (house.getHouseId().longValue() == ownerHouse.getHouseId().longValue())
                {
                    house.setFlag(true);
                    break;
                }
            }
        }
        return houses;
    }

    @Override
    @Transactional
    public void insertOwnerHouse(Long ownerId, Long[] houseIds) {
        List<SmtHouse> houses = smtHouseMapper.selectHouseByOwnerId(ownerId);
        for (SmtHouse house : houses) {
            house.setUseStatus("0");
            smtHouseMapper.updateSmtHouse(house);
        }
        smtOwnerHouseMapper.deleteOwnerHouseByOwnerId(ownerId);
        if (StringUtils.isNotEmpty(houseIds)){
            //SysUser owner = sysUserMapper.selectUserById(ownerId);
            SmtOwnerHouse smtOwnerHouse = new SmtOwnerHouse();
            smtOwnerHouse.setHouseIds(Arrays.asList(houseIds));
            List<SmtOwnerHouse> list = smtOwnerHouseMapper.selectSmtOwnerHouseList(smtOwnerHouse);
            List<String> msg = new ArrayList<>();
            if(CollectionUtils.isNotEmpty(list)){
                for (SmtOwnerHouse ownerHouse : list) {
                    if(!ownerId.equals(ownerHouse.getOwnerId())){
                        SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(ownerHouse.getHouseId());
                        msg.add(smtHouse.getHouseNo());
                    }
                }
            }
            if(CollectionUtils.isNotEmpty(msg)){
                throw new ServiceException(msg.stream().collect(Collectors.joining(","))+"已分配给其他业主，请勿重复分配！");
            }
            insertOwnerHouseAuth(ownerId, houseIds);
        }
    }

    /**
     * 新增业主房屋信息
     *
     * @param ownerId 业主ID
     * @param houseIds 房屋组
     */
    public void insertOwnerHouseAuth(Long ownerId, Long[] houseIds)
    {
        // 新增业主与房屋管理
        List<SmtOwnerHouse> list = new ArrayList<SmtOwnerHouse>(houseIds.length);
        for (Long houseId : houseIds)
        {
            SmtOwnerHouse ur = new SmtOwnerHouse();
            ur.setOwnerId(ownerId);
            ur.setHouseId(houseId);
            list.add(ur);
        }
        smtOwnerHouseMapper.batchOwnerHouse(list);

        for (Long houseId : houseIds) {
            SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(houseId);
            smtHouse.setUseStatus("1");
            smtHouseMapper.updateSmtHouse(smtHouse);
        }

    }
}
