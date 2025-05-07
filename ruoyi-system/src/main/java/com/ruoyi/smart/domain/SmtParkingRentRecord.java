package com.ruoyi.smart.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车位租赁记录对象 smt_parking_rent_record
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtParkingRentRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 车位租赁记录id */
    private Long parkingRentRecordId;

    /** 车位租赁id */
    @Excel(name = "车位租赁id")
    private Long parkingRentId;

    /** 业主id */
    @Excel(name = "业主id")
    private Long ownerId;

    /** 租赁天数 */
    @Excel(name = "租赁天数")
    private Long rentDays;

    /** 租赁单价 */
    @Excel(name = "租赁单价")
    private BigDecimal rentPrice;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setParkingRentRecordId(Long parkingRentRecordId) 
    {
        this.parkingRentRecordId = parkingRentRecordId;
    }

    public Long getParkingRentRecordId() 
    {
        return parkingRentRecordId;
    }
    public void setParkingRentId(Long parkingRentId) 
    {
        this.parkingRentId = parkingRentId;
    }

    public Long getParkingRentId() 
    {
        return parkingRentId;
    }
    public void setOwnerId(Long ownerId) 
    {
        this.ownerId = ownerId;
    }

    public Long getOwnerId() 
    {
        return ownerId;
    }
    public void setRentDays(Long rentDays) 
    {
        this.rentDays = rentDays;
    }

    public Long getRentDays() 
    {
        return rentDays;
    }
    public void setRentPrice(BigDecimal rentPrice) 
    {
        this.rentPrice = rentPrice;
    }

    public BigDecimal getRentPrice() 
    {
        return rentPrice;
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
            .append("parkingRentRecordId", getParkingRentRecordId())
            .append("parkingRentId", getParkingRentId())
            .append("ownerId", getOwnerId())
            .append("rentDays", getRentDays())
            .append("rentPrice", getRentPrice())
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
