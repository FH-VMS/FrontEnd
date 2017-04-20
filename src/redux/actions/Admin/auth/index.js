import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'
// ================================
// Action Type
// ================================
const FETCH_AUTH = 'FETCH_AUTH'
const ADD_AUTH = 'ADD_AUTH'
const UPDATE_AUTH = 'UPDATE_AUTH'
const DELETE_AUTH = 'DELETE_AUTH'

// ================================
// Action Creator
// ================================
const fetchAuth = (queryBody) => dispatch =>
  apis
    .Auth
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_AUTH,
         payload: msgs
      })
  })

const addAuth = (queryBody) => dispatch =>
  apis
    .Auth
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_AUTH,
         payload: msgs
      })
      return msgs
  })

const updateAuth = (updBody) => dispatch =>
  apis
    .Auth
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_AUTH,
         payload: msgs
      })
     return msgs
  })

  const deleteAuth = (deleteBody) => dispatch =>
  apis
    .Auth
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_AUTH,
         payload: msgs
      })
     return msgs
  })

/* default 导出所有 Action Creators */
export default {
  fetchAuth, addAuth, updateAuth, deleteAuth, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_AUTH]: (auth, { payload }) => {
      auth.data = payload.data
      auth.pager = payload.pager
      return auth
  },
  [ADD_AUTH]: (auth, { payload }) => ({payload}),
  [UPDATE_AUTH]: (result, { payload }) => ({payload}),
  [DELETE_AUTH]: (result, { payload }) => ({payload})
}



