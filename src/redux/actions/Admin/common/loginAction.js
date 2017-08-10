import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const LOG_IN = 'LOG_IN'
const CHANGE_PWD = 'CHANGE_PWD'

// ================================
// Action Creator
// ================================
const login = (loginbody) => dispatch =>
  apis
    .Common
    .PostLogin(loginbody)
    .then(msgs => {
      dispatch({
         type: LOG_IN,
         payload: msgs
      })
  })

  const changePassword = (body) => dispatch =>
  apis
    .Common
    .PutPassword(body)
    .then(msgs => {
      dispatch({
         type: CHANGE_PWD,
         payload: msgs
      })
      return msgs
  })

/* default 导出所有 Action Creators */
export default {
  login, changePassword
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [LOG_IN]: (loginData, { payload }) => {
      loginData = payload
      return loginData
  },
  [CHANGE_PWD]: (loginData, { payload }) => {
      return {loginData, ...payload}
  }
}



