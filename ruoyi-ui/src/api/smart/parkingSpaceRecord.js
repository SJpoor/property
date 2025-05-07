import request from '@/utils/request'

// 查询车位使用信息列表
export function listRecord(query) {
  return request({
    url: '/smart/park/space/record/list',
    method: 'get',
    params: query
  })
}

// 查询车位使用信息详细
export function getRecord(parkingRecordId) {
  return request({
    url: '/smart/park/space/record/' + parkingRecordId,
    method: 'get'
  })
}

// 新增车位使用信息
export function addRecord(data) {
  return request({
    url: '/smart/park/space/record',
    method: 'post',
    data: data
  })
}

// 修改车位使用信息
export function updateRecord(data) {
  return request({
    url: '/smart/park/space/record',
    method: 'put',
    data: data
  })
}

// 获取当前车位活动id记录
export function getActiveRecordByParkingSpace(parkingSpaceId) {
  return request({
    url: '/smart/park/space/record/active',
    method: 'get',
    params: { parkingSpaceId }
  })
}



// 删除车位使用信息
export function delRecord(parkingRecordId) {
  return request({
    url: '/smart/park/space/record/' + parkingRecordId,
    method: 'delete'
  })
}

// 新增车位使用信息
export function addRecordFee(data) {
  return request({
    url: '/smart/park/space/record/addRecordFee',
    method: 'post',
    data: data
  })
}


