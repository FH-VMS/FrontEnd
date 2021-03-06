import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_PRODUCTBYMACHINE = 'FETCH_PRODUCTBYMACHINE'
const FETCH_WECHATAUTH = 'FETCH_WECHATAUTH'

// ================================
// Action Creator
// ================================
const fetchProductByMachine = (queryBody) => dispatch =>
  apis
    .Machine
    .GetProductByMachine(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTBYMACHINE,
         payload: msgs
      })

      return msgs
  })


  const fetchWechatAuth = (queryBody) => dispatch =>
  apis
    .Wechat
    .GetUrl(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_WECHATAUTH,
         payload: msgs
      })

      return msgs
  })


/* default 导出所有 Action Creators */
export default {
  fetchProductByMachine, fetchWechatAuth
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PRODUCTBYMACHINE]: (result, { payload }) => {
       result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [FETCH_WECHATAUTH]: (result, { payload }) => ({payload})
}



