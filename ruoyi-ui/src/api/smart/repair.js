import request from '@/utils/request'

// 查询维修信息列表
export function listRepair(query) {
  return request({
    url: '/smart/repair/list',
    method: 'get',
    params: query
  })
}

// 查询维修信息详细
export function getRepair(repairId) {
  return request({
    url: '/smart/repair/' + repairId,
    method: 'get'
  })
}

// 新增维修信息
export function addRepair(data) {
  return request({
    url: '/smart/repair',
    method: 'post',
    data: data
  })
}

// 修改维修信息
export function updateRepair(data) {
  return request({
    url: '/smart/repair',
    method: 'put',
    data: data
  })
}

// 删除维修信息
export function delRepair(repairId) {
  return request({
    url: '/smart/repair/' + repairId,
    method: 'delete'
  })
}

// 维修状态修改
export function changeStatus(data) {
  /* const data = {
    repairId,
    status
  } */
  return request({
    url: '/smart/repair/changeStatus',
    method: 'put',
    data: data
  })
}
