package com.ruoyi.smart.mapper;

import java.util.List;
import com.ruoyi.common.core.domain.entity.SmtBuild;

/**
 * 楼栋信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface SmtBuildMapper 
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
     * 删除楼栋信息
     * 
     * @param buildId 楼栋信息主键
     * @return 结果
     */
    public int deleteSmtBuildByBuildId(Long buildId);

    /**
     * 批量删除楼栋信息
     * 
     * @param buildIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtBuildByBuildIds(Long[] buildIds);
}
