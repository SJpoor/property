package com.ruoyi.common.core.domain.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 业主对象 smt_owner
 * 
 * @author ruoyi
 * @date 2025-02-26
 */
public class SmtOwner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 业主ID */
    private Long ownerId;

    /** 业主姓名 */
    @Excel(name = "业主姓名")
    private String ownerName;

    /** 业主邮箱 */
    @Excel(name = "业主邮箱")
    private String email;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phonenumber;

    /** 业主性别（0男 1女 2未知） */
    @Excel(name = "业主性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 头像地址 */
    @Excel(name = "头像地址")
    private String avatar;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private SmtBuild build;

    private SmtUnit unit;

    private SmtHouse house;

    private SmtParkingSpace parkingSpace;

    public void setOwnerId(Long ownerId) 
    {
        this.ownerId = ownerId;
    }

    public Long getOwnerId() 
    {
        return ownerId;
    }
    public void setOwnerName(String ownerName) 
    {
        this.ownerName = ownerName;
    }

    public String getOwnerName() 
    {
        return ownerName;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setPhonenumber(String phonenumber) 
    {
        this.phonenumber = phonenumber;
    }

    public String getPhonenumber() 
    {
        return phonenumber;
    }
    public void setSex(String sex) 
    {
        this.sex = sex;
    }

    public String getSex() 
    {
        return sex;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
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

    public SmtHouse getHouse() {
        return house;
    }

    public void setHouse(SmtHouse house) {
        this.house = house;
    }

    public SmtParkingSpace getParkingSpace() {
        return parkingSpace;
    }

    public void setParkingSpace(SmtParkingSpace parkingSpace) {
        this.parkingSpace = parkingSpace;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ownerId", getOwnerId())
            .append("ownerName", getOwnerName())
            .append("email", getEmail())
            .append("phonenumber", getPhonenumber())
            .append("sex", getSex())
            .append("avatar", getAvatar())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
