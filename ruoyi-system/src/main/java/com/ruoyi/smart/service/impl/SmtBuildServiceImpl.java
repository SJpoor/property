package com.ruoyi.smart.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.smart.mapper.SmtBuildMapper;
import com.ruoyi.common.core.domain.entity.SmtBuild;
import com.ruoyi.smart.service.ISmtBuildService;

/**
 * 楼栋信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class SmtBuildServiceImpl implements ISmtBuildService 
{
    @Autowired
    private SmtBuildMapper smtBuildMapper;

    /**
     * 查询楼栋信息
     * 
     * @param buildId 楼栋信息主键
     * @return 楼栋信息
     */
    @Override
    public SmtBuild selectSmtBuildByBuildId(Long buildId)
    {
        return smtBuildMapper.selectSmtBuildByBuildId(buildId);
    }

    /**
     * 查询楼栋信息列表
     * 
     * @param smtBuild 楼栋信息
     * @return 楼栋信息
     */
    @Override
    public List<SmtBuild> selectSmtBuildList(SmtBuild smtBuild)
    {
        return smtBuildMapper.selectSmtBuildList(smtBuild);
    }

    /**
     * 新增楼栋信息
     * 
     * @param smtBuild 楼栋信息
     * @return 结果
     */
    @Override
    public int insertSmtBuild(SmtBuild smtBuild)
    {
        smtBuild.setCreateTime(DateUtils.getNowDate());
        return smtBuildMapper.insertSmtBuild(smtBuild);
    }

    /**
     * 修改楼栋信息
     * 
     * @param smtBuild 楼栋信息
     * @return 结果
     */
    @Override
    public int updateSmtBuild(SmtBuild smtBuild)
    {
        smtBuild.setUpdateTime(DateUtils.getNowDate());
        return smtBuildMapper.updateSmtBuild(smtBuild);
    }

    /**
     * 批量删除楼栋信息
     * 
     * @param buildIds 需要删除的楼栋信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtBuildByBuildIds(Long[] buildIds)
    {
        return smtBuildMapper.deleteSmtBuildByBuildIds(buildIds);
    }

    /**
     * 删除楼栋信息信息
     * 
     * @param buildId 楼栋信息主键
     * @return 结果
     */
    @Override
    public int deleteSmtBuildByBuildId(Long buildId)
    {
        return smtBuildMapper.deleteSmtBuildByBuildId(buildId);
    }

    @Override
    public int updateStatus(SmtBuild smtBuild) {
        return smtBuildMapper.updateSmtBuild(smtBuild);
    }
}
