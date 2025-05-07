package com.ruoyi.common.core.domain.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车位信息对象 smt_parking_space
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtParkingSpace extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 车位id */
    private Long parkingSpaceId;

    /** 停车场id*/
    private Long parkingLotId;

    /** 车位编号 */
    @Excel(name = "车位编号")
    private String parkingSpaceNo;

    /** 车位状态 */
    @Excel(name = "车位状态")
    private String parkingSpaceStatus;

    private String parkingSpaceType;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SmtParkingLot parkingLot;

    private boolean flag = false;

    private int useCount;

    private Long ownerId;

    private String showTemp;

    private String assignStatus;

    private Long userId;

    public void setParkingSpaceId(Long parkingSpaceId) 
    {
        this.parkingSpaceId = parkingSpaceId;
    }

    public Long getParkingSpaceId() 
    {
        return parkingSpaceId;
    }
    public void setParkingSpaceNo(String parkingSpaceNo) 
    {
        this.parkingSpaceNo = parkingSpaceNo;
    }

    public String getParkingSpaceNo() 
    {
        return parkingSpaceNo;
    }
    public void setParkingSpaceStatus(String parkingSpaceStatus) 
    {
        this.parkingSpaceStatus = parkingSpaceStatus;
    }

    public String getParkingSpaceStatus() 
    {
        return parkingSpaceStatus;
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

    public Long getParkingLotId() {
        return parkingLotId;
    }

    public void setParkingLotId(Long parkingLotId) {
        this.parkingLotId = parkingLotId;
    }

    public SmtParkingLot getParkingLot() {
        return parkingLot;
    }

    public void setParkingLot(SmtParkingLot parkingLot) {
        this.parkingLot = parkingLot;
    }

    public int getUseCount() {
        return useCount;
    }

    public void setUseCount(int useCount) {
        this.useCount = useCount;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getParkingSpaceType() {
        return parkingSpaceType;
    }

    public void setParkingSpaceType(String parkingSpaceType) {
        this.parkingSpaceType = parkingSpaceType;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public String getShowTemp() {
        return showTemp;
    }

    public void setShowTemp(String showTemp) {
        this.showTemp = showTemp;
    }

    public String getAssignStatus() {
        return assignStatus;
    }

    public void setAssignStatus(String assignStatus) {
        this.assignStatus = assignStatus;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("parkingSpaceId", getParkingSpaceId())
            .append("parkingSpaceNo", getParkingSpaceNo())
            .append("parkingSpaceStatus", getParkingSpaceStatus())
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
