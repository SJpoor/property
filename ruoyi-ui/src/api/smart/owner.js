import request from '@/utils/request'

// 查询业主列表
export function listOwner(query) {
  return request({
    url: '/smart/owner/list',
    method: 'get',
    params: query
  })
}

// 查询业主详细
export function getOwner(userId) {
  return request({
    url: '/smart/owner/' + userId,
    method: 'get'
  })
}

// 新增业主
export function addOwner(data) {
  return request({
    url: '/smart/owner',
    method: 'post',
    data: data
  })
}

// 修改业主
export function updateOwner(data) {
  return request({
    url: '/smart/owner',
    method: 'put',
    data: data
  })
}

// 删除业主
export function delOwner(userId) {
  return request({
    url: '/smart/owner/' + userId,
    method: 'delete'
  })
}

// 业主状态修改
export function changeStatus(data) {
  /* const data = {
    houseId,
    status
  } */
  return request({
    url: '/smart/owner/changeStatus',
    method: 'put',
    data: data
  })
}
