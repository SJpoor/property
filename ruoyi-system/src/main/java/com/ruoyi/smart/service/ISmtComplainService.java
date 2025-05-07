package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.smart.domain.SmtComplain;

/**
 * 投诉信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtComplainService 
{
    /**
     * 查询投诉信息
     * 
     * @param complainId 投诉信息主键
     * @return 投诉信息
     */
    public SmtComplain selectSmtComplainByComplainId(Long complainId);

    /**
     * 查询投诉信息列表
     * 
     * @param smtComplain 投诉信息
     * @return 投诉信息集合
     */
    public List<SmtComplain> selectSmtComplainList(SmtComplain smtComplain);

    /**
     * 新增投诉信息
     * 
     * @param smtComplain 投诉信息
     * @return 结果
     */
    public int insertSmtComplain(SmtComplain smtComplain);

    /**
     * 修改投诉信息
     * 
     * @param smtComplain 投诉信息
     * @return 结果
     */
    public int updateSmtComplain(SmtComplain smtComplain);

    /**
     * 批量删除投诉信息
     * 
     * @param complainIds 需要删除的投诉信息主键集合
     * @return 结果
     */
    public int deleteSmtComplainByComplainIds(Long[] complainIds);

    /**
     * 删除投诉信息信息
     * 
     * @param complainId 投诉信息主键
     * @return 结果
     */
    public int deleteSmtComplainByComplainId(Long complainId);

    /**
     * 状态修改
     * @param smtComplain
     * @return
     */
    int updateStatus(SmtComplain smtComplain);
}
