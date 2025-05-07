package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.List;

/**
 * 房屋信息对象 smt_house
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtHouse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 房屋id */
    private Long houseId;

    /** 楼栋id */
    @Excel(name = "楼栋id")
    private Long buildId;

    /** 单元id */
    @Excel(name = "单元id")
    private Long unitId;

    /** 房屋编号 */
    @Excel(name = "房屋编号")
    private String houseNo;

    /** 房屋面积 */
    @Excel(name = "房屋面积")
    private BigDecimal houseArea;

    /** 户型(数据字典:house_type) */
    @Excel(name = "户型(数据字典:house_type)")
    private String houseType;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 使用状态(数据字典:house_use_status) */
    @Excel(name = "使用状态(数据字典:house_use_status)")
    private String useStatus;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SmtBuild build;

    private SmtUnit unit;

    private boolean flag = false;

    private String assignStatus;

    private Long userId;

    private List<Long> houseIds;

    private Long ownerId;

    public void setHouseId(Long houseId) 
    {
        this.houseId = houseId;
    }

    public Long getHouseId() 
    {
        return houseId;
    }
    public void setBuildId(Long buildId) 
    {
        this.buildId = buildId;
    }

    public Long getBuildId() 
    {
        return buildId;
    }
    public void setUnitId(Long unitId) 
    {
        this.unitId = unitId;
    }

    public Long getUnitId() 
    {
        return unitId;
    }
    public void setHouseNo(String houseNo) 
    {
        this.houseNo = houseNo;
    }

    public String getHouseNo() 
    {
        return houseNo;
    }
    public void setHouseArea(BigDecimal houseArea) 
    {
        this.houseArea = houseArea;
    }

    public BigDecimal getHouseArea() 
    {
        return houseArea;
    }
    public void setHouseType(String houseType) 
    {
        this.houseType = houseType;
    }

    public String getHouseType() 
    {
        return houseType;
    }
    public void setOrderNum(Long orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum() 
    {
        return orderNum;
    }
    public void setUseStatus(String useStatus) 
    {
        this.useStatus = useStatus;
    }

    public String getUseStatus() 
    {
        return useStatus;
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

    public SmtBuild getBuild() {
        return build;
    }

    public void setBuild(SmtBuild build) {
        this.build = build;
    }

    public SmtUnit getUnit() {
        return unit;
    }

    public void setUnit(SmtUnit unit) {
        this.unit = unit;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
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

    public List<Long> getHouseIds() {
        return houseIds;
    }

    public void setHouseIds(List<Long> houseIds) {
        this.houseIds = houseIds;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("houseId", getHouseId())
            .append("buildId", getBuildId())
            .append("unitId", getUnitId())
            .append("houseNo", getHouseNo())
            .append("houseArea", getHouseArea())
            .append("houseType", getHouseType())
            .append("orderNum", getOrderNum())
            .append("useStatus", getUseStatus())
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
