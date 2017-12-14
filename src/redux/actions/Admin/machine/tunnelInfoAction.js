import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_TUNNELINFO = 'FETCH_TUNNELINFO'
const FETCH_MACHINEDIC = 'FETCH_MACHINEDIC'
const FETCH_FULLFILTUNNEL = 'FETCH_FULLFILTUNNEL'
const UPDATE_TUNNELINFO = 'UPDATE_TUNNELINFO'
const FETCH_CABINETBYMACHINE = 'FETCH_CABINETBYMACHINE'
const BATCH_UPDATETUNNELINFO = 'BATCH_UPDATETUNNELINFO'
const EXPORT_DATA = 'EXPORT_DATA'
const FETCH_PRODUCTDIC = 'FETCH_PRODUCTDIC'
const FULLFIL_ONEKEY = 'FULLFIL_ONEKEY'
// ================================
// Action Creator
// ================================
const fetchTunnelInfo = (queryBody) => dispatch =>
  apis
    .TunnelInfo
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_TUNNELINFO,
         payload: msgs
      })
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

    // 根据机器ID取对应货柜
  const fetchCabinetByMachine = (qrys) => dispatch =>
  apis
    .CabinetConfig
    .GetCabinetByMachineId(qrys)
    .then(msgs => {
      dispatch({
         type: FETCH_CABINETBYMACHINE,
         payload: msgs
      })
  })


  const fetchFullfilTunnel = (queryBody) => dispatch =>
  apis
    .TunnelInfo
    .GetFullfilData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_FULLFILTUNNEL,
         payload: msgs
      })
  })


  const updateTunnelInfo = (updBody) => dispatch =>
  apis
    .TunnelInfo
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_TUNNELINFO,
         payload: msgs
      })
     return msgs
  })


   const batchUpdateTunnelInfo = (updBody) => dispatch =>
  apis
    .TunnelInfo
    .UpdateStockWithMobile(updBody)
    .then(msgs => {
      dispatch({
         type: BATCH_UPDATETUNNELINFO,
         payload: msgs
      })
     return msgs
  })

  // 导出补货单
  const exportData = (updBody) => dispatch =>
  apis
    .TunnelInfo
    .GetExportFullfilData(updBody)
    .then(msgs => {
      dispatch({
         type: EXPORT_DATA,
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

  // 一键补货
  const fullfilOneyKey = (updBody) => dispatch =>
  apis
    .TunnelInfo
    .PostFullFilByOneKey(updBody)
    .then(msgs => {
      dispatch({
         type: FULLFIL_ONEKEY,
         payload: msgs
      })
      return msgs
  })
  
  

/* default 导出所有 Action Creators */
export default {
  fetchTunnelInfo, fetchMachineDic, fetchFullfilTunnel, updateTunnelInfo, fetchCabinetByMachine, batchUpdateTunnelInfo, exportData, fetchProductDic, fullfilOneyKey
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_TUNNELINFO]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [FETCH_MACHINEDIC]: (result, { payload }) => {
      result.machineDic = payload
      return result
  },
  [FETCH_CABINETBYMACHINE]: (result, { payload }) => {
      result.cabinetInfo = payload
      return result
  },
  [FETCH_FULLFILTUNNEL]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [UPDATE_TUNNELINFO]: (result, { payload }) => ({payload}),
  [BATCH_UPDATETUNNELINFO]: (result, { payload }) => ({payload}),
  [EXPORT_DATA]: (result, { payload }) => ({payload}),
  [FETCH_PRODUCTDIC]: (result, { payload }) => {
      result.productDic = payload
      return result
  },
  [FULLFIL_ONEKEY]: (result, { payload }) => ({payload})
}



