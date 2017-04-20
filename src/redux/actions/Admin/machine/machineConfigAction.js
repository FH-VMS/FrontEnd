import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_MACHINECONFIG = 'FETCH_MACHINECONFIG'
const ADD_MACHINECONFIG = 'ADD_MACHINECONFIG'
const UPDATE_MACHINECONFIG = 'UPDATE_MACHINECONFIG'
const DELETE_MACHINECONFIG = 'DELETE_MACHINECONFIG'

// ================================
// Action Creator
// ================================
const fetchMachineConfig = (queryBody) => dispatch =>
  apis
    .MachineConfig
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_MACHINECONFIG,
         payload: msgs
      })
  })


const addMachineConfig = (queryBody) => dispatch =>
  apis
    .MachineConfig
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_MACHINECONFIG,
         payload: msgs
      })
      return msgs
  })

const updateMachineConfig = (updBody) => dispatch =>
  apis
    .MachineConfig
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: DELETE_MACHINECONFIG,
         payload: msgs
      })
     return msgs
  })

  const deleteMachineConfig = (deleteBody) => dispatch =>
  apis
    .MachineConfig
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_MACHINECONFIG,
         payload: msgs
      })
     return msgs
  })



/* default 导出所有 Action Creators */
export default {
  fetchMachineConfig, addMachineConfig, updateMachineConfig, deleteMachineConfig
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_MACHINECONFIG]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_MACHINECONFIG]: (result, { payload }) => ({payload}),
  [UPDATE_MACHINECONFIG]: (result, { payload }) => ({payload}),
  [DELETE_MACHINECONFIG]: (result, { payload }) => ({payload})
}



