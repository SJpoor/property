package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.smart.domain.SmtFee;

/**
 * 收费信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtFeeService 
{
    /**
     * 查询收费信息
     * 
     * @param feeId 收费信息主键
     * @return 收费信息
     */
    public SmtFee selectSmtFeeByFeeId(Long feeId);

    /**
     * 查询收费信息列表
     * 
     * @param smtFee 收费信息
     * @return 收费信息集合
     */
    public List<SmtFee> selectSmtFeeList(SmtFee smtFee);

    /**
     * 新增收费信息
     * 
     * @param smtFee 收费信息
     * @return 结果
     */
    public int insertSmtFee(SmtFee smtFee);

    /**
     * 修改收费信息
     * 
     * @param smtFee 收费信息
     * @return 结果
     */
    public int updateSmtFee(SmtFee smtFee);

    /**
     * 批量删除收费信息
     * 
     * @param feeIds 需要删除的收费信息主键集合
     * @return 结果
     */
    public int deleteSmtFeeByFeeIds(Long[] feeIds);

    /**
     * 删除收费信息信息
     * 
     * @param feeId 收费信息主键
     * @return 结果
     */
    public int deleteSmtFeeByFeeId(Long feeId);

    /**
     * 状态修改
     * @param smtFee
     * @return
     */
    int updateStatus(SmtFee smtFee);
}
