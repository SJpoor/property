package com.ruoyi.smart.mapper;

import java.util.List;
import com.ruoyi.smart.domain.SmtRepair;

/**
 * 维修信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface SmtRepairMapper 
{
    /**
     * 查询维修信息
     * 
     * @param repairId 维修信息主键
     * @return 维修信息
     */
    public SmtRepair selectSmtRepairByRepairId(Long repairId);

    /**
     * 查询维修信息列表
     * 
     * @param smtRepair 维修信息
     * @return 维修信息集合
     */
    public List<SmtRepair> selectSmtRepairList(SmtRepair smtRepair);

    /**
     * 新增维修信息
     * 
     * @param smtRepair 维修信息
     * @return 结果
     */
    public int insertSmtRepair(SmtRepair smtRepair);

    /**
     * 修改维修信息
     * 
     * @param smtRepair 维修信息
     * @return 结果
     */
    public int updateSmtRepair(SmtRepair smtRepair);

    /**
     * 删除维修信息
     * 
     * @param repairId 维修信息主键
     * @return 结果
     */
    public int deleteSmtRepairByRepairId(Long repairId);

    /**
     * 批量删除维修信息
     * 
     * @param repairIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtRepairByRepairIds(Long[] repairIds);
}
