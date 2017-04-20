import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_TUNNELINFO = 'FETCH_TUNNELINFO'
const FETCH_MACHINEDIC = 'FETCH_MACHINEDIC'

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
  

/* default 导出所有 Action Creators */
export default {
  fetchTunnelInfo, fetchMachineDic
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
  }
}



