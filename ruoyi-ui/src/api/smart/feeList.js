import request from '@/utils/request'

// 查询费用清单列表
export function listList(query) {
  return request({
    url: '/smart/fee/list/list',
    method: 'get',
    params: query
  })
}

// 查询费用清单详细
export function getList(feeListId) {
  return request({
    url: '/smart/fee/list/' + feeListId,
    method: 'get'
  })
}

// 新增费用清单
export function addList(data) {
  return request({
    url: '/smart/fee/list',
    method: 'post',
    data: data
  })
}

// 修改费用清单
export function updateList(data) {
  return request({
    url: '/smart/fee/list',
    method: 'put',
    data: data
  })
}

// 删除费用清单
export function delList(feeListId) {
  return request({
    url: '/smart/fee/list/' + feeListId,
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
    url: '/smart/fee/list/changeStatus',
    method: 'put',
    data: data
  })
}
