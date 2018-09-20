import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'

// ================================
// Action Type
// ================================
const FETCH_ACCOUNTMANAGE = 'FETCH_ACCOUNTMANAGE'
const ADD_ACCOUNTMANAGE = 'ADD_ACCOUNTMANAGE'
const UPDATE_ACCOUNTMANAGE = 'UPDATE_ACCOUNTMANAGE'
const DELETE_ACCOUNTMANAGE = 'DELETE_ACCOUNTMANAGE'

// ================================
// Action Creator
// ================================
const fetchAccountManage = (queryBody) => dispatch =>
  apis
    .AccountManage
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_ACCOUNTMANAGE,
         payload: msgs
      })
  })


const addAccountManage = (queryBody) => dispatch =>
  apis
    .AccountManage
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_ACCOUNTMANAGE,
         payload: msgs
      })
      return msgs
  })

const updateAccountManage = (updBody) => dispatch =>
  apis
    .AccountManage
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_ACCOUNTMANAGE,
         payload: msgs
      })
     return msgs
  })

  const deleteAccountManage = (deleteBody) => dispatch =>
  apis
    .AccountManage
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_ACCOUNTMANAGE,
         payload: msgs
      })
     return msgs
  })



/* default 导出所有 Action Creators */
export default {
    fetchAccountManage, addAccountManage, updateAccountManage, deleteAccountManage, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_ACCOUNTMANAGE]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_ACCOUNTMANAGE]: (result, { payload }) => ({payload}),
  [UPDATE_ACCOUNTMANAGE]: (result, { payload }) => ({payload}),
  [DELETE_ACCOUNTMANAGE]: (result, { payload }) => ({payload})
}



