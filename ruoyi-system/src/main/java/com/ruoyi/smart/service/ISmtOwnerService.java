package com.ruoyi.smart.service;

import com.ruoyi.common.core.domain.entity.SmtOwner;

import java.util.List;


/**
 * 业主Service接口
 * 
 * @author ruoyi
 * @date 2025-02-26
 */
public interface ISmtOwnerService 
{
    /**
     * 查询业主
     * 
     * @param ownerId 业主主键
     * @return 业主
     */
    public SmtOwner selectSmtOwnerByOwnerId(Long ownerId);

    /**
     * 查询业主列表
     * 
     * @param smtOwner 业主
     * @return 业主集合
     */
    public List<SmtOwner> selectSmtOwnerList(SmtOwner smtOwner);

    /**
     * 新增业主
     * 
     * @param smtOwner 业主
     * @return 结果
     */
    public int insertSmtOwner(SmtOwner smtOwner);

    /**
     * 修改业主
     * 
     * @param smtOwner 业主
     * @return 结果
     */
    public int updateSmtOwner(SmtOwner smtOwner);

    /**
     * 批量删除业主
     * 
     * @param ownerIds 需要删除的业主主键集合
     * @return 结果
     */
    public int deleteSmtOwnerByOwnerIds(Long[] ownerIds);

    /**
     * 删除业主信息
     * 
     * @param ownerId 业主主键
     * @return 结果
     */
    public int deleteSmtOwnerByOwnerId(Long ownerId);

    /**
     * 状态修改
     * @param smtOwner
     * @return
     */
    int updateStatus(SmtOwner smtOwner);
}
