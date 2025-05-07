import request from '@/utils/request'

// 查询收费记录列表
export function listRecord(query) {
  return request({
    url: '/smart/fee/record/list',
    method: 'get',
    params: query
  })
}

// 查询收费记录详细
export function getRecord(feeRecordId) {
  return request({
    url: '/smart/fee/record/' + feeRecordId,
    method: 'get'
  })
}

// 新增收费记录
export function addRecord(data) {
  return request({
    url: '/smart/fee/record',
    method: 'post',
    data: data
  })
}

// 修改收费记录
export function updateRecord(data) {
  return request({
    url: '/smart/fee/record',
    method: 'put',
    data: data
  })
}

// 删除收费记录
export function delRecord(feeRecordId) {
  return request({
    url: '/smart/fee/record/' + feeRecordId,
    method: 'delete'
  })
}

// 收费状态修改
export function changeStatus(data) {
  /* const data = {
    feeRecordId,
    status
  } */
  return request({
    url: '/smart/fee/record/changeStatus',
    method: 'put',
    data: data
  })
}

// 新增收费记录
export function addCommonFee(data) {
  return request({
    url: '/smart/fee/record/addCommonFee',
    method: 'post',
    data: data
  })
}
