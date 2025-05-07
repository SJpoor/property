package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SmtHouse;

/**
 * 房屋信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtHouseService 
{
    /**
     * 查询房屋信息
     * 
     * @param houseId 房屋信息主键
     * @return 房屋信息
     */
    public SmtHouse selectSmtHouseByHouseId(Long houseId);

    /**
     * 查询房屋信息列表
     * 
     * @param smtHouse 房屋信息
     * @return 房屋信息集合
     */
    public List<SmtHouse> selectSmtHouseList(SmtHouse smtHouse);

    /**
     * 新增房屋信息
     * 
     * @param smtHouse 房屋信息
     * @return 结果
     */
    public int insertSmtHouse(SmtHouse smtHouse);

    /**
     * 修改房屋信息
     * 
     * @param smtHouse 房屋信息
     * @return 结果
     */
    public int updateSmtHouse(SmtHouse smtHouse);

    /**
     * 批量删除房屋信息
     * 
     * @param houseIds 需要删除的房屋信息主键集合
     * @return 结果
     */
    public int deleteSmtHouseByHouseIds(Long[] houseIds);

    /**
     * 删除房屋信息信息
     * 
     * @param houseId 房屋信息主键
     * @return 结果
     */
    public int deleteSmtHouseByHouseId(Long houseId);

    /**
     * 状态修改
     * @param smtHouse
     * @return
     */
    int updateStatus(SmtHouse smtHouse);

    List<SmtHouse> selectHouseByOwnerId(Long ownerId);

    void insertOwnerHouse(Long ownerId, Long[] houseIds);
}
