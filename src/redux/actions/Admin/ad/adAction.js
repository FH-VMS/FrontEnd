import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'

// ================================
// Action Type
// ================================
const FETCH_AD = 'FETCH_AD'
const ADD_AD = 'ADD_AD'
const UPDATE_AD = 'UPDATE_AD'
const DELETE_AD = 'DELETE_AD'
const FETCH_RESOURCE = 'FETCH_RESOURCE'
const FETCH_ADBYID = 'FETCH_ADBYID'


// ================================
// Action Creator
// ================================
const fetchAd = () => dispatch =>
  apis
    .Ad
    .GetData()
    .then(msgs => {
      dispatch({
         type: FETCH_AD,
         payload: msgs
      })
  })



const addAd = (queryBody) => dispatch =>
  apis
    .Ad
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_AD,
         payload: msgs
      })
      return msgs
  })

const updateAd = (updBody) => dispatch =>
  apis
    .Ad
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_AD,
         payload: msgs
      })
     return msgs
  })

  const deleteAd = (deleteBody) => dispatch =>
  apis
    .Ad
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_AD,
         payload: msgs
      })
     return msgs
  })


  const fetchResource = (queryBody) => dispatch =>
  apis
    .Resource
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_RESOURCE,
         payload: msgs
      })
      return msgs
  })

  const fetchAdById = (queryBody) => dispatch =>
  apis
    .Ad
    .GetRelationByIdAndType(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_ADBYID,
         payload: msgs
      })
      return msgs
  })


/* default 导出所有 Action Creators */
export default {
    fetchAd, addAd, updateAd, deleteAd, ...common, fetchResource, fetchAdById
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_AD]: (result, { payload }) => {
      result.data = payload
      return result
  },
  [ADD_AD]: (result, { payload }) => ({payload}),
  [UPDATE_AD]: (result, { payload }) => ({payload}),
  [DELETE_AD]: (result, { payload }) => ({payload}),
  [FETCH_ADBYID]: (result, { payload }) => ({payload}),
  [FETCH_RESOURCE]: (result, { payload }) => {
    result.resourceData = payload.data
    result.resourcePager = payload.pager
      return {...result, ...payload}
  }
}



