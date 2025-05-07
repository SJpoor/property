package com.ruoyi.smart.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 收费记录对象 smt_fee_record
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtFeeRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 收费记录id */
    private Long feeRecordId;

    /** 收费id */
    @Excel(name = "收费id")
    private Long feeId;

    /** 业主id */
    @Excel(name = "业主id")
    private Long ownerId;

    private String month;

    private String display;

    /** 费用 */
    @Excel(name = "费用")
    private BigDecimal amount;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    private String feeStatus;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SysUser owner;

    private SmtFee fee;

    private Long relId;

    public void setFeeRecordId(Long feeRecordId) 
    {
        this.feeRecordId = feeRecordId;
    }

    public Long getFeeRecordId() 
    {
        return feeRecordId;
    }
    public void setFeeId(Long feeId) 
    {
        this.feeId = feeId;
    }

    public Long getFeeId() 
    {
        return feeId;
    }
    public void setOwnerId(Long ownerId) 
    {
        this.ownerId = ownerId;
    }

    public Long getOwnerId() 
    {
        return ownerId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
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

    public Long getRelId() {
        return relId;
    }

    public void setRelId(Long relId) {
        this.relId = relId;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public SysUser getOwner() {
        return owner;
    }

    public void setOwner(SysUser owner) {
        this.owner = owner;
    }

    public SmtFee getFee() {
        return fee;
    }

    public void setFee(SmtFee fee) {
        this.fee = fee;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getFeeStatus() {
        return feeStatus;
    }

    public void setFeeStatus(String feeStatus) {
        this.feeStatus = feeStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("feeRecordId", getFeeRecordId())
            .append("feeId", getFeeId())
            .append("ownerId", getOwnerId())
            .append("amount", getAmount())
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
