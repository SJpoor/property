package com.ruoyi.smart.mapper;

import java.util.List;
import com.ruoyi.smart.domain.SmtOwnerParkingSpace;

/**
 * 业主车位信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface SmtOwnerParkingSpaceMapper 
{
    /**
     * 查询业主车位信息
     * 
     * @param ownerParkingSpaceId 业主车位信息主键
     * @return 业主车位信息
     */
    public SmtOwnerParkingSpace selectSmtOwnerParkingSpaceByOwnerParkingId(Long ownerParkingSpaceId);

    /**
     * 查询业主车位信息列表
     * 
     * @param smtOwnerParkingSpace 业主车位信息
     * @return 业主车位信息集合
     */
    public List<SmtOwnerParkingSpace> selectSmtOwnerParkingSpaceList(SmtOwnerParkingSpace smtOwnerParkingSpace);

    /**
     * 新增业主车位信息
     * 
     * @param smtOwnerParkingSpace 业主车位信息
     * @return 结果
     */
    public int insertSmtOwnerParkingSpace(SmtOwnerParkingSpace smtOwnerParkingSpace);

    /**
     * 修改业主车位信息
     * 
     * @param smtOwnerParkingSpace 业主车位信息
     * @return 结果
     */
    public int updateSmtOwnerParkingSpace(SmtOwnerParkingSpace smtOwnerParkingSpace);

    /**
     * 删除业主车位信息
     * 
     * @param ownerParkingSpaceId 业主车位信息主键
     * @return 结果
     */
    public int deleteSmtOwnerParkingSpaceByOwnerParkingId(Long ownerParkingSpaceId);

    /**
     * 批量删除业主车位信息
     * 
     * @param ownerParkingSpaceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSmtOwnerParkingSpaceByOwnerParkingIds(Long[] ownerParkingSpaceIds);

    int deleteOwnerParkingSpace(SmtOwnerParkingSpace smtOwnerParkingSpace);

    int deleteByParkingSpaceIds(Long[] parkingSpaceIds);

    void deleteOwnerParkingSpaceByOwnerId(Long ownerId);

    void batchOwnerParkingSpace(List<SmtOwnerParkingSpace> list);
}
