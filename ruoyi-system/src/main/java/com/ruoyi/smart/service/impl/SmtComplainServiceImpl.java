package com.ruoyi.smart.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.mapper.SysUserMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtComplainMapper;
import com.ruoyi.smart.domain.SmtComplain;
import com.ruoyi.smart.service.ISmtComplainService;

/**
 * 投诉信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtComplainServiceImpl implements ISmtComplainService 
{
    @Autowired
    private SmtComplainMapper smtComplainMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 查询投诉信息
     * 
     * @param complainId 投诉信息主键
     * @return 投诉信息
     */
    @Override
    public SmtComplain selectSmtComplainByComplainId(Long complainId)
    {
        return smtComplainMapper.selectSmtComplainByComplainId(complainId);
    }

    /**
     * 查询投诉信息列表
     * 
     * @param smtComplain 投诉信息
     * @return 投诉信息
     */
    @Override
    public List<SmtComplain> selectSmtComplainList(SmtComplain smtComplain)
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        boolean admin = loginUser.getUser().isAdmin();
        if(!admin){
            smtComplain.setOwnerId(loginUser.getUserId());
        }
        List<SmtComplain> list = smtComplainMapper.selectSmtComplainList(smtComplain);
        return list;
    }

    /**
     * 新增投诉信息
     * 
     * @param smtComplain 投诉信息
     * @return 结果
     */
    @Override
    public int insertSmtComplain(SmtComplain smtComplain)
    {
        smtComplain.setCreateTime(DateUtils.getNowDate());
        return smtComplainMapper.insertSmtComplain(smtComplain);
    }

    /**
     * 修改投诉信息
     * 
     * @param smtComplain 投诉信息
     * @return 结果
     */
    @Override
    public int updateSmtComplain(SmtComplain smtComplain)
    {
        smtComplain.setUpdateTime(DateUtils.getNowDate());
        return smtComplainMapper.updateSmtComplain(smtComplain);
    }

    /**
     * 批量删除投诉信息
     * 
     * @param complainIds 需要删除的投诉信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtComplainByComplainIds(Long[] complainIds)
    {
        return smtComplainMapper.deleteSmtComplainByComplainIds(complainIds);
    }

    /**
     * 删除投诉信息信息
     * 
     * @param complainId 投诉信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtComplainByComplainId(Long complainId)
    {
        return smtComplainMapper.deleteSmtComplainByComplainId(complainId);
    }

    @Override
    public int updateStatus(SmtComplain smtComplain) {
        return smtComplainMapper.updateSmtComplain(smtComplain);
    }
}
