import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const LOG_IN = 'LOG_IN'

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

/* default 导出所有 Action Creators */
export default {
  login
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
  }
}



