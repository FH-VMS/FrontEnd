import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'

// ================================
// Action Type
// ================================
const FETCH_PAYCONFIGLIST = 'FETCH_PAYCONFIGLIST'
const ADD_PAYCONFIG = 'ADD_PAYCONFIG'
const UPDATE_PAYCONFIG = 'UPDATE_PAYCONFIG'
const DELETE_PAYCONFIG = 'DELETE_PAYCONFIG'

// ================================
// Action Creator
// ================================
const fetchPayConfigList = (queryBody) => dispatch =>
  apis
    .PayConfig
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PAYCONFIGLIST,
         payload: msgs
      })
  })


const addPayConfig = (queryBody) => dispatch =>
  apis
    .PayConfig
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_PAYCONFIG,
         payload: msgs
      })
      return msgs
  })

const updatePayConfig = (updBody) => dispatch =>
  apis
    .PayConfig
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_PAYCONFIG,
         payload: msgs
      })
     return msgs
  })

  const deletePayConfig = (deleteBody) => dispatch =>
  apis
    .PayConfig
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_PAYCONFIG,
         payload: msgs
      })
     return msgs
  })



/* default 导出所有 Action Creators */
export default {
  fetchPayConfigList, addPayConfig, updatePayConfig, deletePayConfig, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PAYCONFIGLIST]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_PAYCONFIG]: (result, { payload }) => ({payload}),
  [UPDATE_PAYCONFIG]: (result, { payload }) => ({payload}),
  [DELETE_PAYCONFIG]: (result, { payload }) => ({payload})
}



