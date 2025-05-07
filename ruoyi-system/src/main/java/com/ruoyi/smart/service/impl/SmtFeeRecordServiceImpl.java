package com.ruoyi.smart.service.impl;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.smart.domain.SmtFee;
import com.ruoyi.smart.domain.SmtFeeList;
import com.ruoyi.smart.domain.SmtFeeRecord;
import com.ruoyi.smart.mapper.SmtFeeListMapper;
import com.ruoyi.smart.mapper.SmtFeeMapper;
import com.ruoyi.smart.mapper.SmtFeeRecordMapper;
import com.ruoyi.smart.service.ISmtFeeRecordService;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 收费记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtFeeRecordServiceImpl implements ISmtFeeRecordService 
{
    @Autowired
    private SmtFeeRecordMapper smtFeeRecordMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SmtFeeMapper smtFeeMapper;

    @Autowired
    private SmtFeeListMapper smtFeeListMapper;

    /**
     * 查询收费记录
     * 
     * @param feeRecordId 收费记录主键
     * @return 收费记录
     */
    @Override
    public SmtFeeRecord selectSmtFeeRecordByFeeRecordId(Long feeRecordId)
    {
        return smtFeeRecordMapper.selectSmtFeeRecordByFeeRecordId(feeRecordId);
    }

    /**
     * 查询收费记录列表
     * 
     * @param smtFeeRecord 收费记录
     * @return 收费记录
     */
    @Override
    public List<SmtFeeRecord> selectSmtFeeRecordList(SmtFeeRecord smtFeeRecord)
    {
        List<SmtFeeRecord> list = smtFeeRecordMapper.selectSmtFeeRecordList(smtFeeRecord);
        return list;
    }

    /**
     * 新增收费记录
     * 
     * @param smtFeeRecord 收费记录
     * @return 结果
     */
    @Override
    public int insertSmtFeeRecord(SmtFeeRecord smtFeeRecord)
    {
        smtFeeRecord.setCreateTime(DateUtils.getNowDate());
        return smtFeeRecordMapper.insertSmtFeeRecord(smtFeeRecord);
    }

    /**
     * 修改收费记录
     * 
     * @param smtFeeRecord 收费记录
     * @return 结果
     */
    @Override
    public int updateSmtFeeRecord(SmtFeeRecord smtFeeRecord)
    {
        smtFeeRecord.setUpdateTime(DateUtils.getNowDate());
        return smtFeeRecordMapper.updateSmtFeeRecord(smtFeeRecord);
    }

    /**
     * 批量删除收费记录
     * 
     * @param feeRecordIds 需要删除的收费记录主键
     * @return 结果
     */
    @Override
    public int deleteSmtFeeRecordByFeeRecordIds(Long[] feeRecordIds)
    {
        return smtFeeRecordMapper.deleteSmtFeeRecordByFeeRecordIds(feeRecordIds);
    }

    /**
     * 删除收费记录信息
     * 
     * @param feeRecordId 收费记录主键
     * @return 结果
     */
    @Override
    public int deleteSmtFeeRecordByFeeRecordId(Long feeRecordId)
    {
        return smtFeeRecordMapper.deleteSmtFeeRecordByFeeRecordId(feeRecordId);
    }

    @Override
    public int updateStatus(SmtFeeRecord smtFeeRecord) {
        return smtFeeRecordMapper.updateSmtFeeRecord(smtFeeRecord);
    }

    @Override
    public int insertCommonFee(SmtFeeRecord smtFeeRecord) {
        SmtFee smtFee = smtFeeMapper.selectSmtFeeByFeeId(smtFeeRecord.getFeeId());
        SysUser owner = sysUserMapper.selectUserById(smtFeeRecord.getOwnerId());
        SmtFeeList feeList = new SmtFeeList();
        feeList.setFeeId(smtFeeRecord.getFeeId());
        String month = smtFeeRecord.getMonth();
        String title = "【"+month+"月的"+smtFee.getFeeName()+"】";
        feeList.setTitle(title);
        feeList.setAmount(smtFeeRecord.getAmount());
        feeList.setOwnerId(smtFeeRecord.getOwnerId());
        feeList.setCreateTime(DateUtils.getNowDate());
        feeList.setCreateBy(smtFeeRecord.getCreateBy());
        smtFeeListMapper.insertSmtFeeList(feeList);

        SmtFeeRecord original = smtFeeRecordMapper.selectSmtFeeRecordByFeeRecordId(smtFeeRecord.getFeeRecordId());
        original.setFeeStatus("1");
        return smtFeeRecordMapper.updateSmtFeeRecord(original);
    }
}
