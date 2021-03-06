import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_CASHLESSLIST = 'FETCH_CASHLESSLIST'
const ADD_CASHLESSLIST = 'ADD_CASHLESSLIST'
const UPDATE_CASHLESSLIST = 'UPDATE_CASHLESSLIST'
const DELETE_CASHLESSLIST = 'DELETE_CASHLESSLIST'
const FETCH_SALESMONEY = 'FETCH_SALESMONEY'

const FETCH_REFUNDDETAIL = 'FETCH_REFUNDDETAIL' // 退款详情
const POST_REFUND = 'POST_REFUND' // 手动退款

// ================================
// Action Creator
// ================================
const fetchCashlessList = (queryBody) => dispatch =>
  apis
    .SaleCashless
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_CASHLESSLIST,
         payload: msgs
      })
  })


const addCashlessList = (queryBody) => dispatch =>
  apis
    .SaleCashless
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_CASHLESSLIST,
         payload: msgs
      })
      return msgs
  })

const updateCashlessList = (updBody) => dispatch =>
  apis
    .SaleCashless
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_CASHLESSLIST,
         payload: msgs
      })
     return msgs
  })

  const deleteCashlessList = (deleteBody) => dispatch =>
  apis
    .SaleCashless
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_CASHLESSLIST,
         payload: msgs
      })
     return msgs
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
  fetchCashlessList, addCashlessList, updateCashlessList, deleteCashlessList, fetchRefundDetail, postRefund, fetchSalesMoney
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_CASHLESSLIST]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_CASHLESSLIST]: (result, { payload }) => ({payload}),
  [UPDATE_CASHLESSLIST]: (result, { payload }) => ({payload}),
  [DELETE_CASHLESSLIST]: (result, { payload }) => ({payload}),
  [FETCH_REFUNDDETAIL]: (result, { payload }) => {
      result.refundDetail = payload
      return result
  },
  [POST_REFUND]: (result, { payload }) => ({payload}),
  [FETCH_SALESMONEY]: (result, { payload }) => ({payload})
}



