package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 附件对象 sys_attr
 * 
 * @author ruoyi
 * @date 2025-02-27
 */
public class SysAttr extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 附件ID */
    private Long attrId;

    /** 业务id */
    @Excel(name = "业务id")
    private Long bizId;

    /** 附件原名称 */
    @Excel(name = "附件原名称")
    private String attrName;

    /** 附件新名称 */
    @Excel(name = "附件新名称")
    private String attrNewName;

    /** 附件地址 */
    @Excel(name = "附件地址")
    private String attrUrl;

    /** 附件地址 */
    @Excel(name = "附件文本")
    private String attrText;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "帐号状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private String imgText;

    public void setAttrId(Long attrId) 
    {
        this.attrId = attrId;
    }

    public Long getAttrId() 
    {
        return attrId;
    }
    public void setBizId(Long bizId) 
    {
        this.bizId = bizId;
    }

    public Long getBizId() 
    {
        return bizId;
    }
    public void setAttrName(String attrName) 
    {
        this.attrName = attrName;
    }

    public String getAttrName() 
    {
        return attrName;
    }
    public void setAttrNewName(String attrNewName) 
    {
        this.attrNewName = attrNewName;
    }

    public String getAttrNewName() 
    {
        return attrNewName;
    }
    public void setAttrUrl(String attrUrl) 
    {
        this.attrUrl = attrUrl;
    }

    public String getAttrUrl() 
    {
        return attrUrl;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    public String getImgText() {
        return imgText;
    }

    public void setImgText(String imgText) {
        this.imgText = imgText;
    }

    public String getAttrText() {
        return attrText;
    }

    public void setAttrText(String attrText) {
        this.attrText = attrText;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("attrId", getAttrId())
            .append("bizId", getBizId())
            .append("attrName", getAttrName())
            .append("attrNewName", getAttrNewName())
            .append("attrUrl", getAttrUrl())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
