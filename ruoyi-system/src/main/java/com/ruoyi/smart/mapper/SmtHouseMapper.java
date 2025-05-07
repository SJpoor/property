package com.ruoyi.smart.mapper;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SmtHouse;

/**
 * 房屋信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface SmtHouseMapper 
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
     * 删除房屋信息
     * 
     * @param houseId 房屋信息主键
     * @return 结果
     */
    public int deleteSmtHouseByHouseId(Long houseId);

    /**
     * 批量删除房屋信息
     * 
     * @param houseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtHouseByHouseIds(Long[] houseIds);

    List<SmtHouse> selectHouseByOwnerId(Long ownerId);
}
