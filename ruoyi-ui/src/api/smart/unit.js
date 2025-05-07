import request from '@/utils/request'

// 查询单元信息列表
export function listUnit(query) {
  return request({
    url: '/smart/unit/list',
    method: 'get',
    params: query
  })
}

// 查询单元信息详细
export function getUnit(unitId) {
  return request({
    url: '/smart/unit/' + unitId,
    method: 'get'
  })
}

// 新增单元信息
export function addUnit(data) {
  return request({
    url: '/smart/unit',
    method: 'post',
    data: data
  })
}

// 修改单元信息
export function updateUnit(data) {
  return request({
    url: '/smart/unit',
    method: 'put',
    data: data
  })
}

// 删除单元信息
export function delUnit(unitId) {
  return request({
    url: '/smart/unit/' + unitId,
    method: 'delete'
  })
}

// 单元状态修改
export function changeStatus(data) {
  /* const data = {
    unitId,
    status
  } */
  return request({
    url: '/smart/unit/changeStatus',
    method: 'put',
    data: data
  })
}
