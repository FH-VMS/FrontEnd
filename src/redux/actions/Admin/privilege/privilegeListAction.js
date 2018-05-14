import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'

// ================================
// Action Type
// ================================
const FETCH_PRIVILEGELIST = 'FETCH_PRIVILEGELIST'
const ADD_PRIVILEGELIST = 'ADD_PRIVILEGELIST'
const UPDATE_PRIVILEGELIST = 'UPDATE_PRIVILEGELIST'
const DELETE_PRIVILEGELIST = 'DELETE_PRIVILEGELIST'

// ================================
// Action Creator
// ================================
const fetchPrivilegeList = (queryBody) => dispatch =>
  apis
    .Privilege
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRIVILEGELIST,
         payload: msgs
      })
  })


const addPrivilegeList = (queryBody) => dispatch =>
  apis
    .Privilege
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_PRIVILEGELIST,
         payload: msgs
      })
      return msgs
  })

const updatePrivilegeList = (updBody) => dispatch =>
  apis
    .Privilege
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_PRIVILEGELIST,
         payload: msgs
      })
     return msgs
  })

  const deletePrivilegeList = (deleteBody) => dispatch =>
  apis
    .Privilege
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_PRIVILEGELIST,
         payload: msgs
      })
     return msgs
  })




/* default 导出所有 Action Creators */
export default {
  fetchPrivilegeList, addPrivilegeList, updatePrivilegeList, deletePrivilegeList, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PRIVILEGELIST]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_PRIVILEGELIST]: (result, { payload }) => ({payload}),
  [UPDATE_PRIVILEGELIST]: (result, { payload }) => ({payload}),
  [DELETE_PRIVILEGELIST]: (result, { payload }) => ({payload})
}



