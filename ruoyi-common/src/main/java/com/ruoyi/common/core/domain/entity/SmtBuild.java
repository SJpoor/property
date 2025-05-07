package com.ruoyi.common.core.domain.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 楼栋信息对象 smt_build
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtBuild extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 楼栋id */
    private Long buildId;

    /** 楼栋名称 */
    @Excel(name = "楼栋名称")
    private String buildName;

    /** 楼栋类型(数据字典:build_type 1:电梯房 2:普通房) */
    @Excel(name = "楼栋类型(数据字典:build_type 1:电梯房 2:普通房)")
    private String buildType;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setBuildId(Long buildId) 
    {
        this.buildId = buildId;
    }

    public Long getBuildId() 
    {
        return buildId;
    }
    public void setBuildName(String buildName) 
    {
        this.buildName = buildName;
    }

    public String getBuildName() 
    {
        return buildName;
    }
    public void setBuildType(String buildType) 
    {
        this.buildType = buildType;
    }

    public String getBuildType() 
    {
        return buildType;
    }
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
    {
        return orderNum;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("buildId", getBuildId())
            .append("buildName", getBuildName())
            .append("buildType", getBuildType())
            .append("orderNum", getOrderNum())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
