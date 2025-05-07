import request from '@/utils/request'

// 查询楼栋信息列表
export function listBuild(query) {
  return request({
    url: '/smart/build/list',
    method: 'get',
    params: query
  })
}

// 查询楼栋信息详细
export function getBuild(buildId) {
  return request({
    url: '/smart/build/' + buildId,
    method: 'get'
  })
}

// 新增楼栋信息
export function addBuild(data) {
  return request({
    url: '/smart/build',
    method: 'post',
    data: data
  })
}

// 修改楼栋信息
export function updateBuild(data) {
  return request({
    url: '/smart/build',
    method: 'put',
    data: data
  })
}

// 删除楼栋信息
export function delBuild(buildId) {
  return request({
    url: '/smart/build/' + buildId,
    method: 'delete'
  })
}

// 楼栋状态修改
export function changeStatus(data) {
  /* const data = {
    buildId,
    status
  } */
  return request({
    url: '/smart/build/changeStatus',
    method: 'put',
    data: data
  })
}
