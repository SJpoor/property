package com.ruoyi.smart.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;

/**
 * 收费信息对象 smt_fee
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtFee extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 收费id */
    private Long feeId;

    /** 收费名称 */
    private String feeName;


    /** 租赁类型(数据字典:fee_type) */
    @Excel(name = "租赁类型(数据字典:fee_type)")
    private String feeType;

    /** 单位(数据字典:fee_unit) */
    @Excel(name = "单位(数据字典:fee_unit)")
    private String unit;

    /** 数量 */
    @Excel(name = "数量")
    private Long num;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal price;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setFeeId(Long feeId) 
    {
        this.feeId = feeId;
    }

    public Long getFeeId() 
    {
        return feeId;
    }
    public void setFeeType(String feeType) 
    {
        this.feeType = feeType;
    }

    public String getFeeName() {
        return feeName;
    }

    public void setFeeName(String feeName) {
        this.feeName = feeName;
    }

    public String getFeeType()
    {
        return feeType;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setNum(Long num) 
    {
        this.num = num;
    }

    public Long getNum() 
    {
        return num;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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
            .append("feeId", getFeeId())
            .append("feeType", getFeeType())
            .append("unit", getUnit())
            .append("num", getNum())
            .append("price", getPrice())
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
