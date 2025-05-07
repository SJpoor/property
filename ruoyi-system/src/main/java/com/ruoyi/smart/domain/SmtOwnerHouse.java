package com.ruoyi.smart.domain;

import com.ruoyi.common.core.domain.entity.SmtBuild;
import com.ruoyi.common.core.domain.entity.SmtHouse;
import com.ruoyi.common.core.domain.entity.SmtUnit;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 业主房屋信息对象 smt_owner_house
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public class SmtOwnerHouse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 业主房屋id */
    private Long ownerHouseId;

    /** 业主id */
    @Excel(name = "业主id")
    private Long ownerId;

    /** 房屋id */
    @Excel(name = "房屋id")
    private Long houseId;

    private List<Long> houseIds;

    /** 显示顺序 */
    @Excel(name = "显示顺序")
    private Long orderNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SysUser owner;

    private SmtHouse house;

    private SmtBuild build;

    private SmtUnit unit;

    public void setOwnerHouseId(Long ownerHouseId) 
    {
        this.ownerHouseId = ownerHouseId;
    }

    public Long getOwnerHouseId() 
    {
        return ownerHouseId;
    }
    public void setOwnerId(Long ownerId) 
    {
        this.ownerId = ownerId;
    }

    public Long getOwnerId() 
    {
        return ownerId;
    }
    public void setHouseId(Long houseId) 
    {
        this.houseId = houseId;
    }

    public Long getHouseId() 
    {
        return houseId;
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

    public SysUser getOwner() {
        return owner;
    }

    public void setOwner(SysUser owner) {
        this.owner = owner;
    }

    public SmtHouse getHouse() {
        return house;
    }

    public void setHouse(SmtHouse house) {
        this.house = house;
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

    public List<Long> getHouseIds() {
        return houseIds;
    }

    public void setHouseIds(List<Long> houseIds) {
        this.houseIds = houseIds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ownerHouseId", getOwnerHouseId())
            .append("ownerId", getOwnerId())
            .append("houseId", getHouseId())
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
