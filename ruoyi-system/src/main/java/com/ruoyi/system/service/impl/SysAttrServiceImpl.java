package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAttrMapper;
import com.ruoyi.system.domain.SysAttr;
import com.ruoyi.system.service.ISysAttrService;

/**
 * 附件Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-27
 */
@Service
public class SysAttrServiceImpl implements ISysAttrService 
{
    @Autowired
    private SysAttrMapper sysAttrMapper;

    /**
     * 查询附件
     * 
     * @param attrId 附件主键
     * @return 附件
     */
    @Override
    public SysAttr selectSysAttrByAttrId(Long attrId)
    {
        return sysAttrMapper.selectSysAttrByAttrId(attrId);
    }

    /**
     * 查询附件列表
     * 
     * @param sysAttr 附件
     * @return 附件
     */
    @Override
    public List<SysAttr> selectSysAttrList(SysAttr sysAttr)
    {
        return sysAttrMapper.selectSysAttrList(sysAttr);
    }

    /**
     * 新增附件
     * 
     * @param sysAttr 附件
     * @return 结果
     */
    @Override
    public int insertSysAttr(SysAttr sysAttr)
    {
        sysAttr.setCreateTime(DateUtils.getNowDate());
        return sysAttrMapper.insertSysAttr(sysAttr);
    }

    /**
     * 修改附件
     * 
     * @param sysAttr 附件
     * @return 结果
     */
    @Override
    public int updateSysAttr(SysAttr sysAttr)
    {
        sysAttr.setUpdateTime(DateUtils.getNowDate());
        return sysAttrMapper.updateSysAttr(sysAttr);
    }

    /**
     * 批量删除附件
     * 
     * @param attrIds 需要删除的附件主键
     * @return 结果
     */
    @Override
    public int deleteSysAttrByAttrIds(Long[] attrIds)
    {
        return sysAttrMapper.deleteSysAttrByAttrIds(attrIds);
    }

    /**
     * 删除附件信息
     * 
     * @param attrId 附件主键
     * @return 结果
     */
    @Override
    public int deleteSysAttrByAttrId(Long attrId)
    {
        return sysAttrMapper.deleteSysAttrByAttrId(attrId);
    }
}
