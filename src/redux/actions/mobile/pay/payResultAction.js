import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const POST_PAYRESULT = 'POST_PAYRESULT'

// ================================
// Action Creator
// ================================

  const postPayResult = (queryBody) => dispatch =>
  apis
    .Machine
    .PostPayResult(queryBody)
    .then(msgs => {
      dispatch({
         type: POST_PAYRESULT,
         payload: msgs
      })
  })



/* default 导出所有 Action Creators */
export default {
  postPayResult
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [POST_PAYRESULT]: (result, { payload }) => {
      result = payload
      return result
  }
}



