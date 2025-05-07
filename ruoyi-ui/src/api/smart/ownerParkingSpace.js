import request from '@/utils/request'

// 查询业主车位信息列表
export function listOwnerParkingSpace(query) {
  return request({
    url: '/smart/owner/park/space/list',
    method: 'get',
    params: query
  })
}

// 查询业主车位信息详细
export function getOwnerParkingSpace(ownerParkingId) {
  return request({
    url: '/smart/owner/park/space/' + ownerParkingId,
    method: 'get'
  })
}

// 新增业主车位信息
export function addOwnerParkingSpace(data) {
  return request({
    headers: {
         'Content-Type': 'application/json',
    },
    url: '/smart/owner/park/space',
    method: 'post',
    data: data
  })
}

// 修改业主车位信息
export function updateOwnerParkingSpace(data) {
  return request({
    url: '/smart/owner/park/space',
    method: 'put',
    data: data
  })
}

// 删除业主车位信息
export function delOwnerParkingSpace(ownerParkingIds) {
  return request({
    url: '/smart/owner/park/space/' + ownerParkingIds,
    method: 'delete'
  })
}

// 删除业主车位信息
export function deleteOwnerParkingSpace(data) {
  return request({
    url: '/smart/owner/park/space/deleteOwnerParkingSpace',
    method: 'delete',
    data: data
  })
}
// 业主车位状态修改
export function changeStatus(data) {
  /* const data = {
    ownerHouseId,
    status
  } */
  return request({
    url: '/smart/owner/park/space/changeStatus',
    method: 'put',
    data: data
  })
}

export function delByParkingSpaceId(data) {
  return request({
    url: '/smart/owner/park/space/delByParkingSpaceId',
    method: 'delete',
    data: data
  })
}
