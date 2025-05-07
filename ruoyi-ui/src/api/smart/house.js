import request from '@/utils/request'

// 查询房屋信息列表
export function listHouse(query) {
  return request({
    url: '/smart/house/list',
    method: 'get',
    params: query
  })
}

// 查询房屋信息详细
export function getHouse(houseId) {
  return request({
    url: '/smart/house/' + houseId,
    method: 'get'
  })
}

// 新增房屋信息
export function addHouse(data) {
  return request({
    url: '/smart/house',
    method: 'post',
    data: data
  })
}

// 修改房屋信息
export function updateHouse(data) {
  return request({
    url: '/smart/house',
    method: 'put',
    data: data
  })
}

// 删除房屋信息
export function delHouse(houseId) {
  return request({
    url: '/smart/house/' + houseId,
    method: 'delete'
  })
}

// 收费状态修改
export function changeStatus(data) {
  /* const data = {
    houseId,
    status
  } */
  return request({
    url: '/smart/house/changeStatus',
    method: 'put',
    data: data
  })
}
