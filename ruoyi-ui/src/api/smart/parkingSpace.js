import request from '@/utils/request'

// 查询业主车位信息列表
export function listParkingSpace(query) {
  return request({
    url: '/smart/park/space/list',
    method: 'get',
    params: query
  })
}

// 查询业主车位信息详细
export function getParkingSpace(parkingSpaceId) {
  return request({
    url: '/smart/park/space/' + parkingSpaceId,
    method: 'get'
  })
}

// 新增业主车位信息
export function addParkingSpace(data) {
  return request({
    url: '/smart/park/space',
    method: 'post',
    data: data
  })
}

// 修改业主车位信息
export function updateParkingSpace(data) {
  return request({
    url: '/smart/park/space',
    method: 'put',
    data: data
  })
}

// 删除业主车位信息
export function delParkingSpace(parkingSpaceId) {
  return request({
    url: '/smart/park/space/' + parkingSpaceId,
    method: 'delete'
  })
}

// 业主车位状态修改
export function changeStatus(data) {
  /* const data = {
    parkingSpaceId,
    status
  } */
  return request({
    url: '/smart/park/space/changeStatus',
    method: 'put',
    data: data
  })
}
