package com.ruoyi.smart.mapper;

import com.ruoyi.common.core.domain.entity.SmtOwner;

import java.util.List;


/**
 * 业主Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-26
 */
public interface SmtOwnerMapper 
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
     * 删除业主
     * 
     * @param ownerId 业主主键
     * @return 结果
     */
    public int deleteSmtOwnerByOwnerId(Long ownerId);

    /**
     * 批量删除业主
     * 
     * @param ownerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtOwnerByOwnerIds(Long[] ownerIds);
}
