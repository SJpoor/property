package com.ruoyi.smart.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtParkingRentRecordMapper;
import com.ruoyi.smart.domain.SmtParkingRentRecord;
import com.ruoyi.smart.service.ISmtParkingRentRecordService;

/**
 * 车位租赁记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtParkingRentRecordServiceImpl implements ISmtParkingRentRecordService 
{
    @Autowired
    private SmtParkingRentRecordMapper smtParkingRentRecordMapper;

    /**
     * 查询车位租赁记录
     * 
     * @param parkingRentRecordId 车位租赁记录主键
     * @return 车位租赁记录
     */
    @Override
    public SmtParkingRentRecord selectSmtParkingRentRecordByParkingRentRecordId(Long parkingRentRecordId)
    {
        return smtParkingRentRecordMapper.selectSmtParkingRentRecordByParkingRentRecordId(parkingRentRecordId);
    }

    /**
     * 查询车位租赁记录列表
     * 
     * @param smtParkingRentRecord 车位租赁记录
     * @return 车位租赁记录
     */
    @Override
    public List<SmtParkingRentRecord> selectSmtParkingRentRecordList(SmtParkingRentRecord smtParkingRentRecord)
    {
        return smtParkingRentRecordMapper.selectSmtParkingRentRecordList(smtParkingRentRecord);
    }

    /**
     * 新增车位租赁记录
     * 
     * @param smtParkingRentRecord 车位租赁记录
     * @return 结果
     */
    @Override
    public int insertSmtParkingRentRecord(SmtParkingRentRecord smtParkingRentRecord)
    {
        smtParkingRentRecord.setCreateTime(DateUtils.getNowDate());
        return smtParkingRentRecordMapper.insertSmtParkingRentRecord(smtParkingRentRecord);
    }

    /**
     * 修改车位租赁记录
     * 
     * @param smtParkingRentRecord 车位租赁记录
     * @return 结果
     */
    @Override
    public int updateSmtParkingRentRecord(SmtParkingRentRecord smtParkingRentRecord)
    {
        smtParkingRentRecord.setUpdateTime(DateUtils.getNowDate());
        return smtParkingRentRecordMapper.updateSmtParkingRentRecord(smtParkingRentRecord);
    }

    /**
     * 批量删除车位租赁记录
     * 
     * @param parkingRentRecordIds 需要删除的车位租赁记录主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingRentRecordByParkingRentRecordIds(Long[] parkingRentRecordIds)
    {
        return smtParkingRentRecordMapper.deleteSmtParkingRentRecordByParkingRentRecordIds(parkingRentRecordIds);
    }

    /**
     * 删除车位租赁记录信息
     * 
     * @param parkingRentRecordId 车位租赁记录主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingRentRecordByParkingRentRecordId(Long parkingRentRecordId)
    {
        return smtParkingRentRecordMapper.deleteSmtParkingRentRecordByParkingRentRecordId(parkingRentRecordId);
    }

    @Override
    public int updateStatus(SmtParkingRentRecord smtParkingRentRecord) {
        return smtParkingRentRecordMapper.updateSmtParkingRentRecord(smtParkingRentRecord);
    }
}
