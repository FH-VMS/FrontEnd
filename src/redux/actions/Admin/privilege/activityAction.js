import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'
// ================================
// Action Type
// ================================
const FETCH_ACTIVITY = 'FETCH_ACTIVITY'
const ADD_ACTIVITY = 'ADD_ACTIVITY'
const UPDATE_ACTIVITY = 'UPDATE_ACTIVITY'
const DELETE_ACTIVITY = 'DELETE_ACTIVITY'
const FETCH_ACTIVITYRELATIONBYID = 'FETCH_ACTIVITYRELATIONBYID'

// ================================
// Action Creator
// ================================
const fetchActivity = (queryBody) => dispatch =>
  apis
    .Activity
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_ACTIVITY,
         payload: msgs
      })
  })


const addActivity = (queryBody) => dispatch =>
  apis
    .Activity
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_ACTIVITY,
         payload: msgs
      })
      return msgs
  })

const updateActivity = (updBody) => dispatch =>
  apis
    .Activity
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_ACTIVITY,
         payload: msgs
      })
     return msgs
  })

  const deleteActivity = (deleteBody) => dispatch =>
  apis
    .Activity
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_ACTIVITY,
         payload: msgs
      })
     return msgs
  })


  const fetchActivityRelationById = (queryBody) => dispatch =>
  apis
    .Activity
    .GetActivityRelationById(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_ACTIVITYRELATIONBYID,
         payload: msgs
      })
  })



/* default 导出所有 Action Creators */
export default {
    fetchActivity, addActivity, updateActivity, deleteActivity, fetchActivityRelationById, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_ACTIVITY]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_ACTIVITY]: (result, { payload }) => ({payload}),
  [UPDATE_ACTIVITY]: (result, { payload }) => ({payload}),
  [DELETE_ACTIVITY]: (result, { payload }) => ({payload}),
  [FETCH_ACTIVITYRELATIONBYID]: (result, { payload }) => {
    result.relationData = payload
    return result
}
}



