package com.ruoyi.smart.domain;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投诉信息对象 smt_complain
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtComplain extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 投诉id */
    private Long complainId;

    /** 业主id */
    private Long ownerId;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 状态（0未处理 1已处理） */
    @Excel(name = "状态", readConverterExp = "0=未处理,1=已处理")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SysUser owner;

    public void setComplainId(Long complainId) 
    {
        this.complainId = complainId;
    }

    public Long getComplainId() 
    {
        return complainId;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
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

    public SysUser getOwner() {
        return owner;
    }

    public void setOwner(SysUser owner) {
        this.owner = owner;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("complainId", getComplainId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("remark", getRemark())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
