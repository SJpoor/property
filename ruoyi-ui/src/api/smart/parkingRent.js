import request from '@/utils/request'

// 查询车位租赁信息列表
export function listRent(query) {
  return request({
    url: '/smart/park/rent/list',
    method: 'get',
    params: query
  })
}

// 查询车位租赁信息详细
export function getRent(parkingRentId) {
  return request({
    url: '/smart/park/rent/' + parkingRentId,
    method: 'get'
  })
}

// 新增车位租赁信息
export function addRent(data) {
  return request({
    url: '/smart/park/rent',
    method: 'post',
    data: data
  })
}

// 修改车位租赁信息
export function updateRent(data) {
  return request({
    url: '/smart/park/rent',
    method: 'put',
    data: data
  })
}

// 删除车位租赁信息
export function delRent(parkingRentId) {
  return request({
    url: '/smart/park/rent/' + parkingRentId,
    method: 'delete'
  })
}

// 车位租赁状态修改
export function changeStatus(data) {
  /* const data = {
    parkingRentId,
    status
  } */
  return request({
    url: '/smart/park/rent/changeStatus',
    method: 'put',
    data: data
  })
}

// 生成租赁费用
export function addRentFee(data) {
  return request({
    url: '/smart/park/rent/addFee',
    method: 'post',
    data: data
  })
}
