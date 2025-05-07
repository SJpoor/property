import request from '@/utils/request'

// 查询车位租赁信息列表
export function listRent(query) {
  return request({
    url: '/smart/park/record/rent/list',
    method: 'get',
    params: query
  })
}

// 查询车位租赁信息详细
export function getRent(parkingRentId) {
  return request({
    url: '/smart/park/record/rent/' + parkingRentId,
    method: 'get'
  })
}

// 新增车位租赁信息
export function addRent(data) {
  return request({
    url: '/smart/park/record/rent',
    method: 'post',
    data: data
  })
}

// 修改车位租赁信息
export function updateRent(data) {
  return request({
    url: '/smart/park/record/rent',
    method: 'put',
    data: data
  })
}

// 删除车位租赁信息
export function delRent(parkingRentId) {
  return request({
    url: '/smart/park/record/rent/' + parkingRentId,
    method: 'delete'
  })
}

// 车位租赁信息状态修改
export function changeStatus(parkingRentId, status) {
  const data = {
    parkingRentId,
    status
  }
  return request({
    url: '/smart/park/record/rent/changeStatus',
    method: 'put',
    data: data
  })
}
