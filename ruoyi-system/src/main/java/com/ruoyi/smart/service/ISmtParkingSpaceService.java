package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SmtParkingSpace;
import com.ruoyi.smart.domain.SmtOwnerParkingSpace;

/**
 * 车位信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtParkingSpaceService 
{
    /**
     * 查询车位信息
     * 
     * @param parkingSpaceId 车位信息主键
     * @return 车位信息
     */
    public SmtParkingSpace selectSmtParkingSpaceByParkingSpaceId(Long parkingSpaceId);

    /**
     * 查询车位信息列表
     * 
     * @param smtParkingSpace 车位信息
     * @return 车位信息集合
     */
    public List<SmtParkingSpace> selectSmtParkingSpaceList(SmtParkingSpace smtParkingSpace);

    /**
     * 新增车位信息
     * 
     * @param smtParkingSpace 车位信息
     * @return 结果
     */
    public int insertSmtParkingSpace(SmtParkingSpace smtParkingSpace);

    /**
     * 修改车位信息
     * 
     * @param smtParkingSpace 车位信息
     * @return 结果
     */
    public int updateSmtParkingSpace(SmtParkingSpace smtParkingSpace);

    /**
     * 批量删除车位信息
     * 
     * @param parkingSpaceIds 需要删除的车位信息主键集合
     * @return 结果
     */
    public int deleteSmtParkingSpaceByParkingSpaceIds(Long[] parkingSpaceIds);

    /**
     * 删除车位信息信息
     * 
     * @param parkingSpaceId 车位信息主键
     * @return 结果
     */
    public int deleteSmtParkingSpaceByParkingSpaceId(Long parkingSpaceId);

    /**
     * 状态修改
     * @param smtParkingSpace
     * @return
     */
    int updateStatus(SmtParkingSpace smtParkingSpace);

    List<SmtParkingSpace> selectParkingSpaceByOwnerId(Long ownerId);

    void insertAuthOwnerParkingSpace(Long ownerId, Long[] parkingSpaceIds);
}
