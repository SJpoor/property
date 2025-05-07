package com.ruoyi.common.core.domain.entity;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 停车场信息对象 smt_parking_lot
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtParkingLot extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 停车场id */
    private Long parkingLotId;

    /** 停车场名称 */
    @Excel(name = "停车场名称")
    private String parkingLotName;

    /** 停车场名称 */
    @Excel(name = "停车场类型")
    private String parkingLotType;


    /** 车位总数 */
    @Excel(name = "车位总数")
    private Integer totalSpace;

    private Integer occupSpace;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setParkingLotId(Long parkingLotId) 
    {
        this.parkingLotId = parkingLotId;
    }

    public Long getParkingLotId() 
    {
        return parkingLotId;
    }
    public void setParkingLotName(String parkingLotName) 
    {
        this.parkingLotName = parkingLotName;
    }

    public String getParkingLotName() 
    {
        return parkingLotName;
    }
    public void setTotalSpace(Integer totalSpace)
    {
        this.totalSpace = totalSpace;
    }

    public Integer getTotalSpace()
    {
        return totalSpace;
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

    public String getParkingLotType() {
        return parkingLotType;
    }

    public void setParkingLotType(String parkingLotType) {
        this.parkingLotType = parkingLotType;
    }

    public Integer getOccupSpace() {
        return occupSpace;
    }

    public void setOccupSpace(Integer occupSpace) {
        this.occupSpace = occupSpace;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("parkingLotId", getParkingLotId())
            .append("parkingLotName", getParkingLotName())
            .append("totalSpace", getTotalSpace())
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
