import request from '@/utils/request'

// 查询投诉信息列表
export function listComplain(query) {
  return request({
    url: '/smart/complain/list',
    method: 'get',
    params: query
  })
}

// 查询投诉信息详细
export function getComplain(complainId) {
  return request({
    url: '/smart/complain/' + complainId,
    method: 'get'
  })
}

// 新增投诉信息
export function addComplain(data) {
  return request({
    url: '/smart/complain',
    method: 'post',
    data: data
  })
}

// 修改投诉信息
export function updateComplain(data) {
  return request({
    url: '/smart/complain',
    method: 'put',
    data: data
  })
}

// 删除投诉信息
export function delComplain(complainId) {
  return request({
    url: '/smart/complain/' + complainId,
    method: 'delete'
  })
}

// 楼栋状态修改
export function changeStatus(data) {
 /* const data = {
    complainId,
    status
  } */
  return request({
    url: '/smart/complain/changeStatus',
    method: 'put',
    data: data
  })
}
