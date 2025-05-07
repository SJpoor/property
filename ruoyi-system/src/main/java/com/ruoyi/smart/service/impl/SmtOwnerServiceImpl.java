package com.ruoyi.smart.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SmtOwner;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtOwnerMapper;
import com.ruoyi.smart.service.ISmtOwnerService;

/**
 * 业主Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-26
 */
@Service
public class SmtOwnerServiceImpl implements ISmtOwnerService 
{
    @Autowired
    private SmtOwnerMapper smtOwnerMapper;

    /**
     * 查询业主
     * 
     * @param ownerId 业主主键
     * @return 业主
     */
    @Override
    public SmtOwner selectSmtOwnerByOwnerId(Long ownerId)
    {
        return smtOwnerMapper.selectSmtOwnerByOwnerId(ownerId);
    }

    /**
     * 查询业主列表
     * 
     * @param smtOwner 业主
     * @return 业主
     */
    @Override
    public List<SmtOwner> selectSmtOwnerList(SmtOwner smtOwner)
    {
        return smtOwnerMapper.selectSmtOwnerList(smtOwner);
    }

    /**
     * 新增业主
     * 
     * @param smtOwner 业主
     * @return 结果
     */
    @Override
    public int insertSmtOwner(SmtOwner smtOwner)
    {
        smtOwner.setCreateTime(DateUtils.getNowDate());
        return smtOwnerMapper.insertSmtOwner(smtOwner);
    }

    /**
     * 修改业主
     * 
     * @param smtOwner 业主
     * @return 结果
     */
    @Override
    public int updateSmtOwner(SmtOwner smtOwner)
    {
        smtOwner.setUpdateTime(DateUtils.getNowDate());
        return smtOwnerMapper.updateSmtOwner(smtOwner);
    }

    /**
     * 批量删除业主
     * 
     * @param ownerIds 需要删除的业主主键
     * @return 结果
     */
    @Override
    public int deleteSmtOwnerByOwnerIds(Long[] ownerIds)
    {
        return smtOwnerMapper.deleteSmtOwnerByOwnerIds(ownerIds);
    }

    /**
     * 删除业主信息
     * 
     * @param ownerId 业主主键
     * @return 结果
     */
    @Override
    public int deleteSmtOwnerByOwnerId(Long ownerId)
    {
        return smtOwnerMapper.deleteSmtOwnerByOwnerId(ownerId);
    }

    @Override
    public int updateStatus(SmtOwner smtOwner) {
        return smtOwnerMapper.updateSmtOwner(smtOwner);
    }
}
