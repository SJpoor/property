package com.ruoyi.smart.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SmtBuild;

/**
 * 楼栋信息Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ISmtBuildService 
{
    /**
     * 查询楼栋信息
     * 
     * @param buildId 楼栋信息主键
     * @return 楼栋信息
     */
    public SmtBuild selectSmtBuildByBuildId(Long buildId);

    /**
     * 查询楼栋信息列表
     * 
     * @param smtBuild 楼栋信息
     * @return 楼栋信息集合
     */
    public List<SmtBuild> selectSmtBuildList(SmtBuild smtBuild);

    /**
     * 新增楼栋信息
     * 
     * @param smtBuild 楼栋信息
     * @return 结果
     */
    public int insertSmtBuild(SmtBuild smtBuild);

    /**
     * 修改楼栋信息
     * 
     * @param smtBuild 楼栋信息
     * @return 结果
     */
    public int updateSmtBuild(SmtBuild smtBuild);

    /**
     * 批量删除楼栋信息
     * 
     * @param buildIds 需要删除的楼栋信息主键集合
     * @return 结果
     */
    public int deleteSmtBuildByBuildIds(Long[] buildIds);

    /**
     * 删除楼栋信息信息
     * 
     * @param buildId 楼栋信息主键
     * @return 结果
     */
    public int deleteSmtBuildByBuildId(Long buildId);

    /**
     * 修改状态
     * @param smtBuild
     * @return
     */
    int updateStatus(SmtBuild smtBuild);
}
