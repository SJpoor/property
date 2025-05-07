package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.smart.domain.SmtOwnerHouse;

/**
 * 业主房屋信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtOwnerHouseService 
{
    /**
     * 查询业主房屋信息
     * 
     * @param ownerHouseId 业主房屋信息主键
     * @return 业主房屋信息
     */
    public SmtOwnerHouse selectSmtOwnerHouseByOwnerHouseId(Long ownerHouseId);

    /**
     * 查询业主房屋信息列表
     * 
     * @param smtOwnerHouse 业主房屋信息
     * @return 业主房屋信息集合
     */
    public List<SmtOwnerHouse> selectSmtOwnerHouseList(SmtOwnerHouse smtOwnerHouse);

    /**
     * 新增业主房屋信息
     * 
     * @param smtOwnerHouse 业主房屋信息
     * @return 结果
     */
    public int insertSmtOwnerHouse(SmtOwnerHouse smtOwnerHouse);

    /**
     * 修改业主房屋信息
     * 
     * @param smtOwnerHouse 业主房屋信息
     * @return 结果
     */
    public int updateSmtOwnerHouse(SmtOwnerHouse smtOwnerHouse);

    /**
     * 批量删除业主房屋信息
     * 
     * @param ownerHouseIds 需要删除的业主房屋信息主键集合
     * @return 结果
     */
    public int deleteSmtOwnerHouseByOwnerHouseIds(Long[] ownerHouseIds);

    /**
     * 删除业主房屋信息信息
     * 
     * @param ownerHouseId 业主房屋信息主键
     * @return 结果
     */
    public int deleteSmtOwnerHouseByOwnerHouseId(Long ownerHouseId);

    /**
     * 状态修改
     * @param smtOwnerHouse
     * @return
     */
    int updateStatus(SmtOwnerHouse smtOwnerHouse);

    int deleteOwnerHouse(SmtOwnerHouse smtOwnerHouse);
}
