import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_TOTALMONEY = 'FETCH_TOTALMONEY' // 总额
const FETCH_TOTALMACHINECOUNT = 'FETCH_TOTALMACHINECOUNT' // 机器在线情况
const FETCH_AMOUNTBYMACHINE = 'FETCH_AMOUNTBYMACHINE' // 每台机器销售额

// ================================
// Action Creator
// ================================
const fetchTotalMoney = () => dispatch =>
  
  apis
    .TotalMoney
    .GetData()
    .then(msgs => {
      dispatch({
         type: FETCH_TOTALMONEY,
         payload: msgs
      })
  })

  const fetchTotalMachineCount = () => dispatch =>
  
  apis
    .Home
    .GetTotalMachineCount()
    .then(msgs => {
      dispatch({
         type: FETCH_TOTALMACHINECOUNT,
         payload: msgs
      })

  })

   const fetchAmountByMachine = () => dispatch =>
  
  apis
    .Home
    .GetSalesAmountByMachine()
    .then(msgs => {
      dispatch({
         type: FETCH_AMOUNTBYMACHINE,
         payload: msgs
      })

  })

/* default 导出所有 Action Creators */
export default {
  fetchTotalMoney, fetchTotalMachineCount, fetchAmountByMachine
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_TOTALMONEY]: (totalMoney, { payload }) => {
      totalMoney.data = payload
      return totalMoney
  },
  [FETCH_TOTALMACHINECOUNT]: (totalMoney, { payload }) => {
      totalMoney.totalMachine = payload
      return totalMoney
  },
  [FETCH_AMOUNTBYMACHINE]: (totalMoney, { payload }) => {
      totalMoney.amountByMachine = payload
      return totalMoney
  }
}



