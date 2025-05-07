package com.ruoyi.smart.service.impl;

import java.util.Collection;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.mapper.SysUserMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtRepairMapper;
import com.ruoyi.smart.domain.SmtRepair;
import com.ruoyi.smart.service.ISmtRepairService;

/**
 * 维修信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtRepairServiceImpl implements ISmtRepairService 
{
    @Autowired
    private SmtRepairMapper smtRepairMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 查询维修信息
     * 
     * @param repairId 维修信息主键
     * @return 维修信息
     */
    @Override
    public SmtRepair selectSmtRepairByRepairId(Long repairId)
    {
        return smtRepairMapper.selectSmtRepairByRepairId(repairId);
    }

    /**
     * 查询维修信息列表
     * 
     * @param smtRepair 维修信息
     * @return 维修信息
     */
    @Override
    public List<SmtRepair> selectSmtRepairList(SmtRepair smtRepair)
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        boolean admin = loginUser.getUser().isAdmin();
        if(!admin){
            smtRepair.setOwnerId(loginUser.getUserId());
        }
        List<SmtRepair> list = smtRepairMapper.selectSmtRepairList(smtRepair);
        return list;
    }

    /**
     * 新增维修信息
     * 
     * @param smtRepair 维修信息
     * @return 结果
     */
    @Override
    public int insertSmtRepair(SmtRepair smtRepair)
    {
        smtRepair.setCreateTime(DateUtils.getNowDate());
        return smtRepairMapper.insertSmtRepair(smtRepair);
    }

    /**
     * 修改维修信息
     * 
     * @param smtRepair 维修信息
     * @return 结果
     */
    @Override
    public int updateSmtRepair(SmtRepair smtRepair)
    {
        smtRepair.setUpdateTime(DateUtils.getNowDate());
        return smtRepairMapper.updateSmtRepair(smtRepair);
    }

    /**
     * 批量删除维修信息
     * 
     * @param repairIds 需要删除的维修信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtRepairByRepairIds(Long[] repairIds)
    {
        return smtRepairMapper.deleteSmtRepairByRepairIds(repairIds);
    }

    /**
     * 删除维修信息信息
     * 
     * @param repairId 维修信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtRepairByRepairId(Long repairId)
    {
        return smtRepairMapper.deleteSmtRepairByRepairId(repairId);
    }

    @Override
    public int updateStatus(SmtRepair smtRepair) {
        return smtRepairMapper.updateSmtRepair(smtRepair);
    }
}
