package com.ruoyi.smart.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtFeeMapper;
import com.ruoyi.smart.domain.SmtFee;
import com.ruoyi.smart.service.ISmtFeeService;

/**
 * 收费信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtFeeServiceImpl implements ISmtFeeService 
{
    @Autowired
    private SmtFeeMapper smtFeeMapper;

    /**
     * 查询收费信息
     * 
     * @param feeId 收费信息主键
     * @return 收费信息
     */
    @Override
    public SmtFee selectSmtFeeByFeeId(Long feeId)
    {
        return smtFeeMapper.selectSmtFeeByFeeId(feeId);
    }

    /**
     * 查询收费信息列表
     * 
     * @param smtFee 收费信息
     * @return 收费信息
     */
    @Override
    public List<SmtFee> selectSmtFeeList(SmtFee smtFee)
    {
        return smtFeeMapper.selectSmtFeeList(smtFee);
    }

    /**
     * 新增收费信息
     * 
     * @param smtFee 收费信息
     * @return 结果
     */
    @Override
    public int insertSmtFee(SmtFee smtFee)
    {
        smtFee.setCreateTime(DateUtils.getNowDate());
        return smtFeeMapper.insertSmtFee(smtFee);
    }

    /**
     * 修改收费信息
     * 
     * @param smtFee 收费信息
     * @return 结果
     */
    @Override
    public int updateSmtFee(SmtFee smtFee)
    {
        smtFee.setUpdateTime(DateUtils.getNowDate());
        return smtFeeMapper.updateSmtFee(smtFee);
    }

    /**
     * 批量删除收费信息
     * 
     * @param feeIds 需要删除的收费信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtFeeByFeeIds(Long[] feeIds)
    {
        return smtFeeMapper.deleteSmtFeeByFeeIds(feeIds);
    }

    /**
     * 删除收费信息信息
     * 
     * @param feeId 收费信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtFeeByFeeId(Long feeId)
    {
        return smtFeeMapper.deleteSmtFeeByFeeId(feeId);
    }

    @Override
    public int updateStatus(SmtFee smtFee) {
        return smtFeeMapper.updateSmtFee(smtFee);
    }
}
