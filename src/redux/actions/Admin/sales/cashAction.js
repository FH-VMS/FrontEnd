import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_CASHLIST = 'FETCH_CASHLIST'

// ================================
// Action Creator
// ================================
const fetchCashList = (queryBody) => dispatch =>
  apis
    .SaleCash
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_CASHLIST,
         payload: msgs
      })
  })


/* default 导出所有 Action Creators */
export default {
    fetchCashList
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_CASHLIST]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  }
}



