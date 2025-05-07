package com.ruoyi.smart.mapper;

import java.util.List;
import com.ruoyi.smart.domain.SmtParkingRent;

/**
 * 车位租赁信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface SmtParkingRentMapper 
{
    /**
     * 查询车位租赁信息
     * 
     * @param parkingRentId 车位租赁信息主键
     * @return 车位租赁信息
     */
    public SmtParkingRent selectSmtParkingRentByParkingRentId(Long parkingRentId);

    /**
     * 查询车位租赁信息列表
     * 
     * @param smtParkingRent 车位租赁信息
     * @return 车位租赁信息集合
     */
    public List<SmtParkingRent> selectSmtParkingRentList(SmtParkingRent smtParkingRent);

    /**
     * 新增车位租赁信息
     * 
     * @param smtParkingRent 车位租赁信息
     * @return 结果
     */
    public int insertSmtParkingRent(SmtParkingRent smtParkingRent);

    /**
     * 修改车位租赁信息
     * 
     * @param smtParkingRent 车位租赁信息
     * @return 结果
     */
    public int updateSmtParkingRent(SmtParkingRent smtParkingRent);

    /**
     * 删除车位租赁信息
     * 
     * @param parkingRentId 车位租赁信息主键
     * @return 结果
     */
    public int deleteSmtParkingRentByParkingRentId(Long parkingRentId);

    /**
     * 批量删除车位租赁信息
     * 
     * @param parkingRentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtParkingRentByParkingRentIds(Long[] parkingRentIds);
}
