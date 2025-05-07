import request from '@/utils/request'

// 查询房屋信息列表
export function listOwnerHouse(query) {
  return request({
    url: '/smart/owner/house/list',
    method: 'get',
    params: query
  })
}

// 查询房屋信息详细
export function getOwnerHouse(ownerHouseId) {
  return request({
    url: '/smart/owner/house/' + ownerHouseId,
    method: 'get'
  })
}

// 新增房屋信息
export function addOwnerHouse(data) {
  return request({
    headers: {
         'Content-Type': 'application/json',
    },
    url: '/smart/owner/house',
    method: 'post',
    data: data
  })
}

// 修改房屋信息
export function updateOwnerHouse(data) {
  return request({
    url: '/smart/owner/house',
    method: 'put',
    data: data
  })
}

// 删除房屋信息
export function delOwnerHouse(ownerHouseIds) {
  return request({
    url: '/smart/owner/house/' + ownerHouseIds,
    method: 'delete'
  })
}

// 删除房屋信息
export function deleteOwnerHouse(data) {
  return request({
    url: '/smart/owner/house/deleteOwnerHouse',
    method: 'delete',
    data: data
  })
}

// 房屋状态修改
export function changeStatus(data) {
  /* const data = {
    ownerHouseId,
    status
  } */
  return request({
    url: '/smart/owner/house/changeStatus',
    method: 'put',
    data: data
  })
}
