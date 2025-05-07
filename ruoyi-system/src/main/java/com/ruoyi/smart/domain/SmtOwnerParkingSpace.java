package com.ruoyi.smart.domain;

import com.ruoyi.common.core.domain.entity.SmtParkingSpace;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.SysAttr;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 业主车位信息对象 smt_owner_parking_space
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtOwnerParkingSpace extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 业主车位id */
    private Long ownerParkingId;

    /** 业主id */
    private Long ownerId;

    /** 车位id */
    @Excel(name = "车位id")
    private Long parkingSpaceId;

    private List<Long> parkingSpaceIds;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;


    private SysUser owner;

    private SmtParkingSpace parkingSpace;

    private SmtParkingRent parkingRent;

    private SysAttr attr;

    public void setParkingSpaceId(Long parkingSpaceId) 
    {
        this.parkingSpaceId = parkingSpaceId;
    }

    public Long getParkingSpaceId() 
    {
        return parkingSpaceId;
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

    public Long getOwnerParkingId() {
        return ownerParkingId;
    }

    public void setOwnerParkingId(Long ownerParkingId) {
        this.ownerParkingId = ownerParkingId;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public SmtParkingSpace getParkingSpace() {
        return parkingSpace;
    }

    public void setParkingSpace(SmtParkingSpace parkingSpace) {
        this.parkingSpace = parkingSpace;
    }

    public SysUser getOwner() {
        return owner;
    }

    public void setOwner(SysUser owner) {
        this.owner = owner;
    }

    public SmtParkingRent getParkingRent() {
        return parkingRent;
    }

    public void setParkingRent(SmtParkingRent parkingRent) {
        this.parkingRent = parkingRent;
    }

    public SysAttr getAttr() {
        return attr;
    }

    public void setAttr(SysAttr attr) {
        this.attr = attr;
    }

    public List<Long> getParkingSpaceIds() {
        return parkingSpaceIds;
    }

    public void setParkingSpaceIds(List<Long> parkingSpaceIds) {
        this.parkingSpaceIds = parkingSpaceIds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ownerParkingId", getOwnerParkingId())
            .append("parkingSpaceId", getParkingSpaceId())
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
