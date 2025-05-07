package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SmtParkingLot;

/**
 * 停车场信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtParkingLotService 
{
    /**
     * 查询停车场信息
     * 
     * @param parkingLotId 停车场信息主键
     * @return 停车场信息
     */
    public SmtParkingLot selectSmtParkingLotByParkingLotId(Long parkingLotId);

    /**
     * 查询停车场信息列表
     * 
     * @param smtParkingLot 停车场信息
     * @return 停车场信息集合
     */
    public List<SmtParkingLot> selectSmtParkingLotList(SmtParkingLot smtParkingLot);

    /**
     * 新增停车场信息
     * 
     * @param smtParkingLot 停车场信息
     * @return 结果
     */
    public int insertSmtParkingLot(SmtParkingLot smtParkingLot);

    /**
     * 修改停车场信息
     * 
     * @param smtParkingLot 停车场信息
     * @return 结果
     */
    public int updateSmtParkingLot(SmtParkingLot smtParkingLot);

    /**
     * 批量删除停车场信息
     * 
     * @param parkingLotIds 需要删除的停车场信息主键集合
     * @return 结果
     */
    public int deleteSmtParkingLotByParkingLotIds(Long[] parkingLotIds);

    /**
     * 删除停车场信息信息
     * 
     * @param parkingLotId 停车场信息主键
     * @return 结果
     */
    public int deleteSmtParkingLotByParkingLotId(Long parkingLotId);

    /**
     * 状态修改
     * @param smtParkingLot
     * @return
     */
    int updateStatus(SmtParkingLot smtParkingLot);
}
