package com.ruoyi.smart.mapper;

import java.util.List;
import com.ruoyi.smart.domain.SmtParkingSpaceRecord;

/**
 * 车位使用信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-03-02
 */
public interface SmtParkingSpaceRecordMapper 
{
    /**
     * 查询车位使用信息
     * 
     * @param parkingRecordId 车位使用信息主键
     * @return 车位使用信息
     */
    public SmtParkingSpaceRecord selectSmtParkingSpaceRecordByParkingRecordId(Long parkingRecordId);

    /**
     * 查询车位使用信息列表
     * 
     * @param smtParkingSpaceRecord 车位使用信息
     * @return 车位使用信息集合
     */
    public List<SmtParkingSpaceRecord> selectSmtParkingSpaceRecordList(SmtParkingSpaceRecord smtParkingSpaceRecord);

    /**
     * 新增车位使用信息
     * 
     * @param smtParkingSpaceRecord 车位使用信息
     * @return 结果
     */
    public int insertSmtParkingSpaceRecord(SmtParkingSpaceRecord smtParkingSpaceRecord);

    /**
     * 修改车位使用信息
     * 
     * @param smtParkingSpaceRecord 车位使用信息
     * @return 结果
     */
    public int updateSmtParkingSpaceRecord(SmtParkingSpaceRecord smtParkingSpaceRecord);

    /**
     * 删除车位使用信息
     * 
     * @param parkingRecordId 车位使用信息主键
     * @return 结果
     */
    public int deleteSmtParkingSpaceRecordByParkingRecordId(Long parkingRecordId);

    /**
     * 批量删除车位使用信息
     * 
     * @param parkingRecordIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtParkingSpaceRecordByParkingRecordIds(Long[] parkingRecordIds);
}
