import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_USER = 'FETCH_USER'
const ADD_USER = 'ADD_USER'
const UPDATE_USER = 'UPDATE_USER'
const DELETE_USER = 'DELETE_USER'
const FETCH_AUTHDIC = 'FETCH_AUTHDIC'
const FETCH_CLIENTDIC = 'FETCH_CLIENTDIC'
const RESET_USER = 'RESET_USER'

// ================================
// Action Creator
// ================================
const fetchUser = (queryBody) => dispatch =>
  apis
    .User
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_USER,
         payload: msgs
      })
  })

  const fetchAuthDic = () => dispatch =>
  apis
    .User
    .GetAuthDic()
    .then(msgs => {
      dispatch({
         type: FETCH_AUTHDIC,
         payload: msgs
      })
  })

const addUser = (queryBody) => dispatch =>
  apis
    .User
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_USER,
         payload: msgs
      })
      return msgs
  })

const updateUser = (updBody) => dispatch =>
  apis
    .User
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_USER,
         payload: msgs
      })
     return msgs
  })

  const deleteUser = (deleteBody) => dispatch =>
  apis
    .User
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_USER,
         payload: msgs
      })
     return msgs
  })

// 取客户当字典
  const fetchClientDic = () => dispatch =>
  apis
    .User
    .GetClientDic()
    .then(msgs => {
      dispatch({
         type: FETCH_CLIENTDIC,
         payload: msgs
      })
  })

  // 重置密码
  const resetPassword = (bdy) => dispatch =>
  apis
    .User
    .ResetPass(bdy)
    .then(msgs => {
      dispatch({
         type: RESET_USER,
         payload: msgs
      })
      return msgs
  })

/* default 导出所有 Action Creators */
export default {
  fetchUser, addUser, updateUser, deleteUser, fetchAuthDic, fetchClientDic, resetPassword
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_USER]: (user, { payload }) => {
      user.data = payload.data
      user.pager = payload.pager
      return user
  },
  [ADD_USER]: (result, { payload }) => ({payload}),
  [UPDATE_USER]: (result, { payload }) => ({payload}),
  [DELETE_USER]: (result, { payload }) => ({payload}),
  [RESET_USER]: (result, { payload }) => ({payload}),
  [FETCH_AUTHDIC]: (auth, { payload }) => {
      auth.authData = payload
      return auth
  },
  [FETCH_CLIENTDIC]: (user, { payload }) => {
      user.clientDic = payload
      return user
  }
}



