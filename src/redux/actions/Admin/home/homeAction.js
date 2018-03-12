import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_TOTALMONEY = 'FETCH_TOTALMONEY' // 总额
const FETCH_TOTALMACHINECOUNT = 'FETCH_TOTALMACHINECOUNT' // 机器在线情况
const FETCH_AMOUNTBYMACHINE = 'FETCH_AMOUNTBYMACHINE' // 每台机器销售额
const FETCH_PAYNUMBERS = 'FETCH_PAYNUMBERS' // 支付笔数
const FETCH_PAYNUMBERSBYDATE = 'FETCH_PAYNUMBERSBYDATE' // 根据时间取支付笔数
const FETCH_GROUPMONEY = 'FETCH_GROUPMONEY' // 根据时间分类销售额
const FETCH_GROUPPRODUCT = 'FETCH_GROUPPRODUCT' // 根据时间统计商品
const FETCH_GROUPMONEYBYMACHINE = 'FETCH_GROUPMONEYBYMACHINE' // 根据机器统计销售额

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

   const fetchAmountByMachine = (body) => dispatch =>
  
  apis
    .Home
    .GetSalesAmountByMachine(body)
    .then(msgs => {
      dispatch({
         type: FETCH_AMOUNTBYMACHINE,
         payload: msgs
      })

  })

const fetchPayNumbers = (body) => dispatch =>
  apis
  .Home
  .GetPayNumbers()
  .then(msgs => {
    dispatch({
       type: FETCH_PAYNUMBERS,
       payload: msgs
    })

})

const fetchPayNumbersByDate = (body) => dispatch =>
apis
.Home
.GetPayNumbersByDate(body)
.then(msgs => {
  dispatch({
     type: FETCH_PAYNUMBERSBYDATE,
     payload: msgs
  })

})

const fetchGroupMoney = (body) => dispatch =>
apis
.Home
.GetGroupSalesMoney(body)
.then(msgs => {
  dispatch({
     type: FETCH_GROUPMONEY,
     payload: msgs
  })
  return msgs
})

const fetchGroupProduct = (body) => dispatch =>
apis
.Home
.GetGroupProduct(body)
.then(msgs => {
  dispatch({
     type: FETCH_GROUPPRODUCT,
     payload: msgs
  })

})

const fetchGroupMoneyByMachine = (body) => dispatch =>
apis
.Home
.GetGroupMoneyByMachine(body)
.then(msgs => {
  dispatch({
     type: FETCH_GROUPMONEYBYMACHINE,
     payload: msgs
  })

})

/* default 导出所有 Action Creators */
export default {
  fetchTotalMoney, fetchTotalMachineCount, fetchAmountByMachine, fetchPayNumbers, fetchGroupMoney, fetchGroupProduct, fetchPayNumbersByDate, fetchGroupMoneyByMachine
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
  },
  [FETCH_PAYNUMBERS]: (totalMoney, { payload }) => {
      totalMoney.payNumbers = payload
      return totalMoney
  },
  [FETCH_PAYNUMBERSBYDATE]: (totalMoney, { payload }) => {
      totalMoney.payNumbersByDate = payload
      return totalMoney
  },
  [FETCH_GROUPMONEY]: (totalMoney, { payload }) => {
      totalMoney.groupMoney = payload
      return totalMoney
  },
  [FETCH_GROUPPRODUCT]: (totalMoney, { payload }) => {
      totalMoney.groupProduct = payload
      return totalMoney
  },
  [FETCH_GROUPMONEYBYMACHINE]: (totalMoney, { payload }) => {
      totalMoney.groupMoneyByMachine = payload
      return totalMoney
  }
}



