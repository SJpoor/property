package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysAttr;

/**
 * 附件Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-27
 */
public interface SysAttrMapper 
{
    /**
     * 查询附件
     * 
     * @param attrId 附件主键
     * @return 附件
     */
    public SysAttr selectSysAttrByAttrId(Long attrId);

    /**
     * 查询附件列表
     * 
     * @param sysAttr 附件
     * @return 附件集合
     */
    public List<SysAttr> selectSysAttrList(SysAttr sysAttr);

    /**
     * 新增附件
     * 
     * @param sysAttr 附件
     * @return 结果
     */
    public int insertSysAttr(SysAttr sysAttr);

    /**
     * 修改附件
     * 
     * @param sysAttr 附件
     * @return 结果
     */
    public int updateSysAttr(SysAttr sysAttr);

    /**
     * 删除附件
     * 
     * @param attrId 附件主键
     * @return 结果
     */
    public int deleteSysAttrByAttrId(Long attrId);

    /**
     * 批量删除附件
     * 
     * @param attrIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysAttrByAttrIds(Long[] attrIds);
}
