package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SmtUnit;

/**
 * 单元信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtUnitService 
{
    /**
     * 查询单元信息
     * 
     * @param unitId 单元信息主键
     * @return 单元信息
     */
    public SmtUnit selectSmtUnitByUnitId(Long unitId);

    /**
     * 查询单元信息列表
     * 
     * @param smtUnit 单元信息
     * @return 单元信息集合
     */
    public List<SmtUnit> selectSmtUnitList(SmtUnit smtUnit);

    /**
     * 新增单元信息
     * 
     * @param smtUnit 单元信息
     * @return 结果
     */
    public int insertSmtUnit(SmtUnit smtUnit);

    /**
     * 修改单元信息
     * 
     * @param smtUnit 单元信息
     * @return 结果
     */
    public int updateSmtUnit(SmtUnit smtUnit);

    /**
     * 批量删除单元信息
     * 
     * @param unitIds 需要删除的单元信息主键集合
     * @return 结果
     */
    public int deleteSmtUnitByUnitIds(Long[] unitIds);

    /**
     * 删除单元信息信息
     * 
     * @param unitId 单元信息主键
     * @return 结果
     */
    public int deleteSmtUnitByUnitId(Long unitId);

    /**
     * 状态修改
     * @param smtUnit
     * @return
     */
    int updateStatus(SmtUnit smtUnit);
}
