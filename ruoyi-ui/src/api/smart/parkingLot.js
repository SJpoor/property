import request from '@/utils/request'

// 查询停车场信息列表
export function listLot(query) {
  return request({
    url: '/smart/park/lot/list',
    method: 'get',
    params: query
  })
}

// 查询停车场信息详细
export function getLot(parkingLotId) {
  return request({
    url: '/smart/park/lot/' + parkingLotId,
    method: 'get'
  })
}

// 新增停车场信息
export function addLot(data) {
  return request({
    url: '/smart/park/lot',
    method: 'post',
    data: data
  })
}

// 修改停车场信息
export function updateLot(data) {
  return request({
    url: '/smart/park/lot',
    method: 'put',
    data: data
  })
}

// 删除停车场信息
export function delLot(parkingLotId) {
  return request({
    url: '/smart/park/lot/' + parkingLotId,
    method: 'delete'
  })
}

// 停车场状态修改
export function changeStatus(data) {
  /* const data = {
    parkingLotId,
    status
  } */
  return request({
    url: '/smart/park/lot/changeStatus',
    method: 'put',
    data: data
  })
}
