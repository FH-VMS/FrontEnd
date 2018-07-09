import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_PICKSALESLIST = 'FETCH_PICKSALESLIST'
const FETCH_SALESMONEY = 'FETCH_SALESMONEY'

const FETCH_REFUNDDETAIL = 'FETCH_REFUNDDETAIL' // 退款详情
const POST_REFUND = 'POST_REFUND' // 手动退款

// ================================
// Action Creator
// ================================
const fetchPickSalesList = (queryBody) => dispatch =>
  apis
    .PickSales
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PICKSALESLIST,
         payload: msgs
      })
  })


const fetchRefundDetail = (params) => dispatch =>
  apis
    .SaleCashless
    .GetRefundDetail(params)
    .then(msgs => {
      dispatch({
         type: FETCH_REFUNDDETAIL,
         payload: msgs
      })
  })

const postRefund = (params) => dispatch =>
  apis
    .Refund
    .PostRefund(params)
    .then(msgs => {
      dispatch({
         type: POST_REFUND,
         payload: msgs
      })
      return msgs
  })
  
  
  // 统计销售额根据支付方式 
  const fetchSalesMoney = (params) => dispatch =>
  apis
    .SaleCashless
    .GetStatisticSalesMoneyByDate(params)
    .then(msgs => {
      dispatch({
         type: FETCH_SALESMONEY,
         payload: msgs
      })
      return msgs
  })

/* default 导出所有 Action Creators */
export default {
    fetchPickSalesList, fetchRefundDetail, postRefund, fetchSalesMoney
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PICKSALESLIST]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [FETCH_REFUNDDETAIL]: (result, { payload }) => {
      result.refundDetail = payload
      return result
  },
  [POST_REFUND]: (result, { payload }) => ({payload})
}



