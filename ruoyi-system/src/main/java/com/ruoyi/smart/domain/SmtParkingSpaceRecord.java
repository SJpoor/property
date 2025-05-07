package com.ruoyi.smart.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SmtParkingSpace;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.SysAttr;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车位使用信息对象 smt_parking_space_record
 * 
 * @author ruoyi
 * @date 2025-03-02
 */
public class SmtParkingSpaceRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 业主车位id */
    private Long parkingRecordId;

    /** 车位id */
    @Excel(name = "车位id")
    private Long parkingSpaceId;

    /** 业主id */
    @Excel(name = "业主id")
    private Long ownerId;

    /** 车牌号 */
    @Excel(name = "车牌号")
    private String plateNo;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 驶入时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "驶入时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date driveInTime;

    /** 驶出时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "驶出时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date driveOutTime;

    private String driveInStartTime;

    private String driveInEndTime;

    private String driveOutStartTime;

    private String driveOutEndTime;

    private boolean isAdmin;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SysUser owner;

    private SmtParkingRent parkingRent;

    private SysAttr attr;

    private SmtParkingSpace parkingSpace;

    private String feeStatus;

    /*1 入 0出*/
    private String driveStatus;


    public void setParkingRecordId(Long parkingRecordId) 
    {
        this.parkingRecordId = parkingRecordId;
    }

    public Long getParkingRecordId() 
    {
        return parkingRecordId;
    }
    public void setParkingSpaceId(Long parkingSpaceId) 
    {
        this.parkingSpaceId = parkingSpaceId;
    }

    public Long getParkingSpaceId() 
    {
        return parkingSpaceId;
    }
    public void setOwnerId(Long ownerId) 
    {
        this.ownerId = ownerId;
    }

    public Long getOwnerId() 
    {
        return ownerId;
    }
    public void setPlateNo(String plateNo) 
    {
        this.plateNo = plateNo;
    }

    public String getPlateNo() 
    {
        return plateNo;
    }
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
    {
        return orderNum;
    }
    public void setDriveInTime(Date driveInTime) 
    {
        this.driveInTime = driveInTime;
    }

    public Date getDriveInTime() 
    {
        return driveInTime;
    }
    public void setDriveOutTime(Date driveOutTime) 
    {
        this.driveOutTime = driveOutTime;
    }

    public Date getDriveOutTime() 
    {
        return driveOutTime;
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

    public SmtParkingSpace getParkingSpace() {
        return parkingSpace;
    }

    public void setParkingSpace(SmtParkingSpace parkingSpace) {
        this.parkingSpace = parkingSpace;
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

    public String getDriveInStartTime() {
        return driveInStartTime;
    }

    public void setDriveInStartTime(String driveInStartTime) {
        this.driveInStartTime = driveInStartTime;
    }

    public String getDriveInEndTime() {
        return driveInEndTime;
    }

    public void setDriveInEndTime(String driveInEndTime) {
        this.driveInEndTime = driveInEndTime;
    }

    public String getDriveOutStartTime() {
        return driveOutStartTime;
    }

    public void setDriveOutStartTime(String driveOutStartTime) {
        this.driveOutStartTime = driveOutStartTime;
    }

    public String getDriveOutEndTime() {
        return driveOutEndTime;
    }

    public void setDriveOutEndTime(String driveOutEndTime) {
        this.driveOutEndTime = driveOutEndTime;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public String getFeeStatus() {
        return feeStatus;
    }

    public void setFeeStatus(String feeStatus) {
        this.feeStatus = feeStatus;
    }

    public String getDriveStatus() {
        return driveStatus;
    }

    public void setDriveStatus(String driveStatus) {
        this.driveStatus = driveStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("parkingRecordId", getParkingRecordId())
            .append("parkingSpaceId", getParkingSpaceId())
            .append("ownerId", getOwnerId())
            .append("plateNo", getPlateNo())
            .append("orderNum", getOrderNum())
            .append("driveInTime", getDriveInTime())
            .append("driveOutTime", getDriveOutTime())
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
