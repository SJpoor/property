package com.ruoyi.smart.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.core.domain.entity.SmtHouse;
import com.ruoyi.smart.mapper.SmtHouseMapper;
import com.ruoyi.system.mapper.SysUserMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtOwnerHouseMapper;
import com.ruoyi.smart.domain.SmtOwnerHouse;
import com.ruoyi.smart.service.ISmtOwnerHouseService;

/**
 * 业主房屋信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtOwnerHouseServiceImpl implements ISmtOwnerHouseService 
{
    @Autowired
    private SmtOwnerHouseMapper smtOwnerHouseMapper;
    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SmtHouseMapper smtHouseMapper;

    /**
     * 查询业主房屋信息
     * 
     * @param ownerHouseId 业主房屋信息主键
     * @return 业主房屋信息
     */
    @Override
    public SmtOwnerHouse selectSmtOwnerHouseByOwnerHouseId(Long ownerHouseId)
    {
        return smtOwnerHouseMapper.selectSmtOwnerHouseByOwnerHouseId(ownerHouseId);
    }

    /**
     * 查询业主房屋信息列表
     * 
     * @param smtOwnerHouse 业主房屋信息
     * @return 业主房屋信息
     */
    @Override
    public List<SmtOwnerHouse> selectSmtOwnerHouseList(SmtOwnerHouse smtOwnerHouse)
    {
        List<SmtOwnerHouse> list = smtOwnerHouseMapper.selectSmtOwnerHouseList(smtOwnerHouse);
        if(CollectionUtils.isNotEmpty(list)){
            for (SmtOwnerHouse ownerHouse : list) {
                SysUser sysUser = sysUserMapper.selectUserById(ownerHouse.getOwnerId());
                ownerHouse.setOwner(null != sysUser ? sysUser : new SysUser());

                SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(ownerHouse.getHouseId());
                ownerHouse.setHouse(null != smtHouse ? smtHouse : new SmtHouse());
            }
        }
        return list;
    }

    /**
     * 新增业主房屋信息
     * 
     * @param smtOwnerHouse 业主房屋信息
     * @return 结果
     */
    @Override
    public int insertSmtOwnerHouse(SmtOwnerHouse smtOwnerHouse)
    {
        Date nowDate = DateUtils.getNowDate();
        List<Long> houseIds = smtOwnerHouse.getHouseIds();
        int rows = 0 ;
        if(CollectionUtils.isNotEmpty(houseIds)){
            for (Long houseId : houseIds) {
                SmtOwnerHouse newOwnerHouse = new SmtOwnerHouse();
                BeanUtils.copyProperties(smtOwnerHouse,newOwnerHouse);
                newOwnerHouse.setHouseId(houseId);
                newOwnerHouse.setCreateTime(nowDate);
                SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(houseId);
                smtHouse.setUseStatus("1");
                smtHouseMapper.updateSmtHouse(smtHouse);
                rows = smtOwnerHouseMapper.insertSmtOwnerHouse(newOwnerHouse);
            }
        }else{
            SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(smtOwnerHouse.getHouseId());
            smtHouse.setUseStatus("1");
            smtHouseMapper.updateSmtHouse(smtHouse);
            smtOwnerHouse.setCreateTime(nowDate);
            rows =  smtOwnerHouseMapper.insertSmtOwnerHouse(smtOwnerHouse);
        }
        return rows;
    }

    /**
     * 修改业主房屋信息
     * 
     * @param smtOwnerHouse 业主房屋信息
     * @return 结果
     */
    @Override
    public int updateSmtOwnerHouse(SmtOwnerHouse smtOwnerHouse)
    {
        smtOwnerHouse.setUpdateTime(DateUtils.getNowDate());
        return smtOwnerHouseMapper.updateSmtOwnerHouse(smtOwnerHouse);
    }

    /**
     * 批量删除业主房屋信息
     * 
     * @param ownerHouseIds 需要删除的业主房屋信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtOwnerHouseByOwnerHouseIds(Long[] ownerHouseIds)
    {
        for (Long ownerHouseId : ownerHouseIds) {
            SmtOwnerHouse smtOwnerHouse = smtOwnerHouseMapper.selectSmtOwnerHouseByOwnerHouseId(ownerHouseId);
            SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(smtOwnerHouse.getHouseId());
            smtHouse.setUseStatus("1");
            smtHouseMapper.updateSmtHouse(smtHouse);
        }
        return smtOwnerHouseMapper.deleteSmtOwnerHouseByOwnerHouseIds(ownerHouseIds);
    }

    /**
     * 删除业主房屋信息信息
     * 
     * @param ownerHouseId 业主房屋信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtOwnerHouseByOwnerHouseId(Long ownerHouseId)
    {
        SmtOwnerHouse smtOwnerHouse = smtOwnerHouseMapper.selectSmtOwnerHouseByOwnerHouseId(ownerHouseId);
        SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(smtOwnerHouse.getHouseId());
        smtHouse.setUseStatus("1");
        smtHouseMapper.updateSmtHouse(smtHouse);
        return smtOwnerHouseMapper.deleteSmtOwnerHouseByOwnerHouseId(ownerHouseId);
    }

    @Override
    public int updateStatus(SmtOwnerHouse smtOwnerHouse) {
        return smtOwnerHouseMapper.updateSmtOwnerHouse(smtOwnerHouse);
    }

    @Override
    public int deleteOwnerHouse(SmtOwnerHouse smtOwnerHouse) {
        SmtHouse smtHouse = smtHouseMapper.selectSmtHouseByHouseId(smtOwnerHouse.getHouseId());
        smtHouse.setUseStatus("1");
        smtHouseMapper.updateSmtHouse(smtHouse);
        return smtOwnerHouseMapper.deleteOwnerHouse(smtOwnerHouse);
    }
}
