import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_TUNNELCONFIG = 'FETCH_TUNNELCONFIG'
const ADD_TUNNELCONFIG = 'ADD_MACHINECONFIG'
const FETCH_MACHINEDIC = 'FETCH_MACHINEDIC'
const FETCH_PRODUCTDIC = 'FETCH_PRODUCTDIC'

// ================================
// Action Creator
// ================================
const fetchTunnelConfig = (queryBody) => dispatch =>
  apis
    .TunnelConfig
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_TUNNELCONFIG,
         payload: msgs
      })
  })


const addTunnelConfig = (queryBody) => dispatch =>
  apis
    .TunnelConfig
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_TUNNELCONFIG,
         payload: msgs
      })
      return msgs
  })

  // 取机器字典
  const fetchMachineDic = () => dispatch =>
  apis
    .Common
    .GetMachineDic()
    .then(msgs => {
      dispatch({
         type: FETCH_MACHINEDIC,
         payload: msgs
      })
  })
  
  // 取商品字典
  const fetchProductDic = () => dispatch =>
  apis
    .Common
    .GetProductDic()
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTDIC,
         payload: msgs
      })
  })


/* default 导出所有 Action Creators */
export default {
  fetchTunnelConfig, addTunnelConfig, fetchMachineDic, fetchProductDic
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_TUNNELCONFIG]: (result, { payload }) => {
      result.data = payload
      return result
  },
  [ADD_TUNNELCONFIG]: (result, { payload }) => ({payload}),
  [FETCH_MACHINEDIC]: (result, { payload }) => {
      result.machineDic = payload
      return result
  },
  [FETCH_PRODUCTDIC]: (result, { payload }) => {
      result.productDic = payload
      return result
  }
}



