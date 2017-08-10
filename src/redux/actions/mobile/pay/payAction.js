import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_PAYINFO = 'FETCH_PAYINFO'
const FETCH_PAYINFOA = 'FETCH_PAYINFOA'

// ================================
// Action Creator
// ================================
const fetchPayInfo = (queryBody) => dispatch =>
  apis
    .Pay
    .GetDataW(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PAYINFO,
         payload: msgs
      })
  })


  const fetchPayInfoA = (queryBody) => dispatch =>
  apis
    .Pay
    .GetDataA(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PAYINFOA,
         payload: msgs
      })
  })



/* default 导出所有 Action Creators */
export default {
  fetchPayInfo, fetchPayInfoA
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PAYINFO]: (result, { payload }) => {
      result.data = payload
      return result
  },
  [FETCH_PAYINFOA]: (result, { payload }) => {
      result.data = payload
      return result
  }
}



