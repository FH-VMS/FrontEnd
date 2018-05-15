import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_WECHATAUTH = 'FETCH_WECHATAUTH'
const FETCH_PRODUCTTYPE = 'FETCH_PRODUCTTYPE'
const FETCH_PRODUCT = 'FETCH_PRODUCT'
const POST_WECHATPAY = 'POST_WECHATPAY'
const FETCH_HISTORYSALESLIST = 'FETCH_HISTORYSALESLIST'
const FETCH_WAITINGSALESLIST = 'FETCH_WAITINGSALESLIST'

// ================================
// Action Creator
// ================================


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

  const fetchProductType = (queryBody) => dispatch =>
  apis
    .Wechat
    .GetProdcutTypeByClientId(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTTYPE,
         payload: msgs
      })
  })

  const fetchProduct = (queryBody) => dispatch =>
  apis
    .Wechat
    .GetProdcutByTypeAndClient(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCT,
         payload: msgs
      })
  })

  const postWechatPay = (queryBody) => dispatch =>
  apis
    .Wechat
    .PostDataW(queryBody)
    .then(msgs => {
      dispatch({
         type: POST_WECHATPAY,
         payload: msgs
      })
      return msgs
  })

  const fetchHistorySalesList = (queryBody) => dispatch =>
  apis
    .Wechat
    .GetHistorySalesList(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_HISTORYSALESLIST,
         payload: msgs
      })
  })

  const fetchWaitingSalesList = (queryBody) => dispatch =>
  apis
    .Wechat
    .GetHistorySalesList(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_WAITINGSALESLIST,
         payload: msgs
      })
      return msgs
  })

/* default 导出所有 Action Creators */
export default {
fetchWechatAuth, fetchProductType, fetchProduct, postWechatPay, fetchHistorySalesList, fetchWaitingSalesList
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_WECHATAUTH]: (result, { payload }) => ({payload}),
  [FETCH_PRODUCTTYPE]: (result, { payload }) => {
      result.productTypeData = payload
      return result
  },
  [FETCH_PRODUCT]: (result, { payload }) => {
    result.productData = payload
    return result
  },
  [FETCH_HISTORYSALESLIST]: (result, { payload }) => {
    result.historyList = payload
    return result
  },
  [FETCH_WAITINGSALESLIST]: (result, { payload }) => {
    result.waitingList = payload
    return result
  },
  [POST_WECHATPAY]: (result, { payload }) => ({payload})
}



