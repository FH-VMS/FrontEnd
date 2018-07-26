import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_MACHINES = 'FETCH_MACHINES'
const FULLFIL_ONEKEY = 'FULLFIL_ONEKEY'
const PUSH_PRODUCT = 'PUSH_PRODUCT'

// ================================
// Action Creator
// ================================
const fetchMachines = (queryBody) => dispatch =>
  apis
    .MachineOperation
    .GetMachines(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_MACHINES,
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


    // 商品更新下推
    const pushProduct = (updBody) => dispatch =>
    apis
      .MachineOperation
      .ProductPush(updBody)
      .then(msgs => {
        dispatch({
           type: PUSH_PRODUCT,
           payload: msgs
        })
        return msgs
    })
 


/* default 导出所有 Action Creators */
export default {
    fetchMachines, fullfilOneyKey, pushProduct
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_MACHINES]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [FULLFIL_ONEKEY]: (result, { payload }) => ({payload}),
  [PUSH_PRODUCT]: (result, { payload }) => ({payload})
}



