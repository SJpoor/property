package com.ruoyi.smart.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtFeeListMapper;
import com.ruoyi.smart.domain.SmtFeeList;
import com.ruoyi.smart.service.ISmtFeeListService;

/**
 * 费用清单Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-03-09
 */
@Service
public class SmtFeeListServiceImpl implements ISmtFeeListService 
{
    @Autowired
    private SmtFeeListMapper smtFeeListMapper;

    /**
     * 查询费用清单
     * 
     * @param feeListId 费用清单主键
     * @return 费用清单
     */
    @Override
    public SmtFeeList selectSmtFeeListByFeeListId(Long feeListId)
    {
        return smtFeeListMapper.selectSmtFeeListByFeeListId(feeListId);
    }

    /**
     * 查询费用清单列表
     * 
     * @param smtFeeList 费用清单
     * @return 费用清单
     */
    @Override
    public List<SmtFeeList> selectSmtFeeListList(SmtFeeList smtFeeList)
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if(!user.isAdmin()){
            smtFeeList.setOwnerId(user.getUserId());
        }
        return smtFeeListMapper.selectSmtFeeListList(smtFeeList);
    }

    /**
     * 新增费用清单
     * 
     * @param smtFeeList 费用清单
     * @return 结果
     */
    @Override
    public int insertSmtFeeList(SmtFeeList smtFeeList)
    {
        smtFeeList.setCreateTime(DateUtils.getNowDate());
        return smtFeeListMapper.insertSmtFeeList(smtFeeList);
    }

    /**
     * 修改费用清单
     * 
     * @param smtFeeList 费用清单
     * @return 结果
     */
    @Override
    public int updateSmtFeeList(SmtFeeList smtFeeList)
    {
        smtFeeList.setUpdateTime(DateUtils.getNowDate());
        return smtFeeListMapper.updateSmtFeeList(smtFeeList);
    }

    /**
     * 批量删除费用清单
     * 
     * @param feeListIds 需要删除的费用清单主键
     * @return 结果
     */
    @Override
    public int deleteSmtFeeListByFeeListIds(Long[] feeListIds)
    {
        return smtFeeListMapper.deleteSmtFeeListByFeeListIds(feeListIds);
    }

    /**
     * 删除费用清单信息
     * 
     * @param feeListId 费用清单主键
     * @return 结果
     */
    @Override
    public int deleteSmtFeeListByFeeListId(Long feeListId)
    {
        return smtFeeListMapper.deleteSmtFeeListByFeeListId(feeListId);
    }

    @Override
    public int updateStatus(SmtFeeList smtFeeList) {
        return smtFeeListMapper.updateSmtFeeList(smtFeeList);
    }
}
