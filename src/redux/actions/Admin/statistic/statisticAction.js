import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_PAYMOBILESTATISTIC = 'FETCH_PAYMOBILESTATISTIC'
const FETCH_PRODUCTSTATISTIC = 'FETCH_PRODUCTSTATISTIC'
// ================================
// Action Creator
// ================================
const fetchPayMobileStatistic = (queryBody) => dispatch =>
  apis
    .Statistic
    .GetMobilePayStatistic(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PAYMOBILESTATISTIC,
         payload: msgs
      })
      return msgs
  })

  const fetchProductStatistic = (queryBody) => dispatch =>
  apis
    .Statistic
    .GetProductStatistic(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTSTATISTIC,
         payload: msgs
      })
      return msgs
  })



/* default 导出所有 Action Creators */
export default {
    fetchPayMobileStatistic, fetchProductStatistic
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PRODUCTSTATISTIC]: (result, { payload }) => {
    result.data = payload.data
    result.pager = payload.pager
      return result
  },
  [FETCH_PAYMOBILESTATISTIC]: (result, { payload }) => ({payload})
}



