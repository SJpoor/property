package com.ruoyi.smart.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtParkingLotMapper;
import com.ruoyi.common.core.domain.entity.SmtParkingLot;
import com.ruoyi.smart.service.ISmtParkingLotService;

/**
 * 停车场信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtParkingLotServiceImpl implements ISmtParkingLotService 
{
    @Autowired
    private SmtParkingLotMapper smtParkingLotMapper;

    /**
     * 查询停车场信息
     * 
     * @param parkingLotId 停车场信息主键
     * @return 停车场信息
     */
    @Override
    public SmtParkingLot selectSmtParkingLotByParkingLotId(Long parkingLotId)
    {
        return smtParkingLotMapper.selectSmtParkingLotByParkingLotId(parkingLotId);
    }

    /**
     * 查询停车场信息列表
     * 
     * @param smtParkingLot 停车场信息
     * @return 停车场信息
     */
    @Override
    public List<SmtParkingLot> selectSmtParkingLotList(SmtParkingLot smtParkingLot)
    {
        List<SmtParkingLot> list = smtParkingLotMapper.selectSmtParkingLotList(smtParkingLot);
        return list;
    }

    /**
     * 新增停车场信息
     * 
     * @param smtParkingLot 停车场信息
     * @return 结果
     */
    @Override
    public int insertSmtParkingLot(SmtParkingLot smtParkingLot)
    {
        smtParkingLot.setCreateTime(DateUtils.getNowDate());
        return smtParkingLotMapper.insertSmtParkingLot(smtParkingLot);
    }

    /**
     * 修改停车场信息
     * 
     * @param smtParkingLot 停车场信息
     * @return 结果
     */
    @Override
    public int updateSmtParkingLot(SmtParkingLot smtParkingLot)
    {
        smtParkingLot.setUpdateTime(DateUtils.getNowDate());
        return smtParkingLotMapper.updateSmtParkingLot(smtParkingLot);
    }

    /**
     * 批量删除停车场信息
     * 
     * @param parkingLotIds 需要删除的停车场信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingLotByParkingLotIds(Long[] parkingLotIds)
    {
        return smtParkingLotMapper.deleteSmtParkingLotByParkingLotIds(parkingLotIds);
    }

    /**
     * 删除停车场信息信息
     * 
     * @param parkingLotId 停车场信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtParkingLotByParkingLotId(Long parkingLotId)
    {
        return smtParkingLotMapper.deleteSmtParkingLotByParkingLotId(parkingLotId);
    }

    @Override
    public int updateStatus(SmtParkingLot smtParkingLot) {
        return smtParkingLotMapper.updateSmtParkingLot(smtParkingLot);
    }
}
