package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.smart.domain.SmtFeeRecord;

/**
 * 收费记录Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtFeeRecordService 
{
    /**
     * 查询收费记录
     * 
     * @param feeRecordId 收费记录主键
     * @return 收费记录
     */
    public SmtFeeRecord selectSmtFeeRecordByFeeRecordId(Long feeRecordId);

    /**
     * 查询收费记录列表
     * 
     * @param smtFeeRecord 收费记录
     * @return 收费记录集合
     */
    public List<SmtFeeRecord> selectSmtFeeRecordList(SmtFeeRecord smtFeeRecord);

    /**
     * 新增收费记录
     * 
     * @param smtFeeRecord 收费记录
     * @return 结果
     */
    public int insertSmtFeeRecord(SmtFeeRecord smtFeeRecord);

    /**
     * 修改收费记录
     * 
     * @param smtFeeRecord 收费记录
     * @return 结果
     */
    public int updateSmtFeeRecord(SmtFeeRecord smtFeeRecord);

    /**
     * 批量删除收费记录
     * 
     * @param feeRecordIds 需要删除的收费记录主键集合
     * @return 结果
     */
    public int deleteSmtFeeRecordByFeeRecordIds(Long[] feeRecordIds);

    /**
     * 删除收费记录信息
     * 
     * @param feeRecordId 收费记录主键
     * @return 结果
     */
    public int deleteSmtFeeRecordByFeeRecordId(Long feeRecordId);

    /**
     * 状态修改
     * @param smtFeeRecord
     * @return
     */
    int updateStatus(SmtFeeRecord smtFeeRecord);

    int insertCommonFee(SmtFeeRecord smtFeeRecord);
}
