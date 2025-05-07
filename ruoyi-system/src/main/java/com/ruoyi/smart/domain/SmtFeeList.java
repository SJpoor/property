package com.ruoyi.smart.domain;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;

/**
 * 费用清单对象 smt_fee_list
 * 
 * @author ruoyi
 * @date 2025-03-09
 */
public class SmtFeeList extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 收费记录id */
    private Long feeListId;

    /** 收费id */
    @Excel(name = "收费id")
    private Long feeId;

    /** 业主id */
    @Excel(name = "业主id")
    private Long ownerId;

    /** 费用标题 */
    @Excel(name = "费用标题")
    private String title;

    /** 费用 */
    @Excel(name = "费用")
    private BigDecimal amount;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0未缴费 1已缴费） */
    @Excel(name = "状态", readConverterExp = "0=未缴费,1=已缴费")
    private String payStatus;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SysUser owner;

    private SmtFee fee;

    public void setFeeListId(Long feeListId) 
    {
        this.feeListId = feeListId;
    }

    public Long getFeeListId() 
    {
        return feeListId;
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
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
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
    public void setPayStatus(String payStatus) 
    {
        this.payStatus = payStatus;
    }

    public String getPayStatus() 
    {
        return payStatus;
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

    public SmtFee getFee() {
        return fee;
    }

    public void setFee(SmtFee fee) {
        this.fee = fee;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("feeListId", getFeeListId())
            .append("feeId", getFeeId())
            .append("ownerId", getOwnerId())
            .append("title", getTitle())
            .append("amount", getAmount())
            .append("orderNum", getOrderNum())
            .append("payStatus", getPayStatus())
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
