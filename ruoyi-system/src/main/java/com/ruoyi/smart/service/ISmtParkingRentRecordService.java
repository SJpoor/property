package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.smart.domain.SmtParkingRentRecord;

/**
 * 车位租赁记录Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtParkingRentRecordService 
{
    /**
     * 查询车位租赁记录
     * 
     * @param parkingRentRecordId 车位租赁记录主键
     * @return 车位租赁记录
     */
    public SmtParkingRentRecord selectSmtParkingRentRecordByParkingRentRecordId(Long parkingRentRecordId);

    /**
     * 查询车位租赁记录列表
     * 
     * @param smtParkingRentRecord 车位租赁记录
     * @return 车位租赁记录集合
     */
    public List<SmtParkingRentRecord> selectSmtParkingRentRecordList(SmtParkingRentRecord smtParkingRentRecord);

    /**
     * 新增车位租赁记录
     * 
     * @param smtParkingRentRecord 车位租赁记录
     * @return 结果
     */
    public int insertSmtParkingRentRecord(SmtParkingRentRecord smtParkingRentRecord);

    /**
     * 修改车位租赁记录
     * 
     * @param smtParkingRentRecord 车位租赁记录
     * @return 结果
     */
    public int updateSmtParkingRentRecord(SmtParkingRentRecord smtParkingRentRecord);

    /**
     * 批量删除车位租赁记录
     * 
     * @param parkingRentRecordIds 需要删除的车位租赁记录主键集合
     * @return 结果
     */
    public int deleteSmtParkingRentRecordByParkingRentRecordIds(Long[] parkingRentRecordIds);

    /**
     * 删除车位租赁记录信息
     * 
     * @param parkingRentRecordId 车位租赁记录主键
     * @return 结果
     */
    public int deleteSmtParkingRentRecordByParkingRentRecordId(Long parkingRentRecordId);

    /**
     * 状态修改
     * @param smtParkingRentRecord
     * @return
     */
    int updateStatus(SmtParkingRentRecord smtParkingRentRecord);
}
