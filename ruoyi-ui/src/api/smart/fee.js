import request from '@/utils/request'

// 查询收费信息列表
export function listFee(query) {
  return request({
    url: '/smart/fee/list',
    method: 'get',
    params: query
  })
}

// 查询收费信息详细
export function getFee(feeId) {
  return request({
    url: '/smart/fee/' + feeId,
    method: 'get'
  })
}

// 新增收费信息
export function addFee(data) {
  return request({
    url: '/smart/fee',
    method: 'post',
    data: data
  })
}

// 修改收费信息
export function updateFee(data) {
  return request({
    url: '/smart/fee',
    method: 'put',
    data: data
  })
}

// 删除收费信息
export function delFee(feeId) {
  return request({
    url: '/smart/fee/' + feeId,
    method: 'delete'
  })
}

// 收费状态修改
export function changeStatus(data) {
  /* const data = {
    feeId,
    status
  } */
  return request({
    url: '/smart/fee/changeStatus',
    method: 'put',
    data: data
  })
}
