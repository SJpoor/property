package com.ruoyi.smart.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtUnitMapper;
import com.ruoyi.common.core.domain.entity.SmtUnit;
import com.ruoyi.smart.service.ISmtUnitService;

/**
 * 单元信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtUnitServiceImpl implements ISmtUnitService 
{
    @Autowired
    private SmtUnitMapper smtUnitMapper;

    /**
     * 查询单元信息
     * 
     * @param unitId 单元信息主键
     * @return 单元信息
     */
    @Override
    public SmtUnit selectSmtUnitByUnitId(Long unitId)
    {
        return smtUnitMapper.selectSmtUnitByUnitId(unitId);
    }

    /**
     * 查询单元信息列表
     * 
     * @param smtUnit 单元信息
     * @return 单元信息
     */
    @Override
    public List<SmtUnit> selectSmtUnitList(SmtUnit smtUnit)
    {
        return smtUnitMapper.selectSmtUnitList(smtUnit);
    }

    /**
     * 新增单元信息
     * 
     * @param smtUnit 单元信息
     * @return 结果
     */
    @Override
    public int insertSmtUnit(SmtUnit smtUnit)
    {
        smtUnit.setCreateTime(DateUtils.getNowDate());
        return smtUnitMapper.insertSmtUnit(smtUnit);
    }

    /**
     * 修改单元信息
     * 
     * @param smtUnit 单元信息
     * @return 结果
     */
    @Override
    public int updateSmtUnit(SmtUnit smtUnit)
    {
        smtUnit.setUpdateTime(DateUtils.getNowDate());
        return smtUnitMapper.updateSmtUnit(smtUnit);
    }

    /**
     * 批量删除单元信息
     * 
     * @param unitIds 需要删除的单元信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtUnitByUnitIds(Long[] unitIds)
    {
        return smtUnitMapper.deleteSmtUnitByUnitIds(unitIds);
    }

    /**
     * 删除单元信息信息
     * 
     * @param unitId 单元信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtUnitByUnitId(Long unitId)
    {
        return smtUnitMapper.deleteSmtUnitByUnitId(unitId);
    }

    @Override
    public int updateStatus(SmtUnit smtUnit) {
        return smtUnitMapper.updateSmtUnit(smtUnit);
    }
}
