import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'

// ================================
// Action Type
// ================================
const FETCH_MACHINETYPE = 'FETCH_MACHINETYPE'
const ADD_MACHINETYPE = 'ADD_USER'
const UPDATE_MACHINETYPE = 'UPDATE_USER'
const DELETE_MACHINETYPE = 'DELETE_USER'


// ================================
// Action Creator
// ================================
const fetchMachineType = (queryBody) => dispatch =>
  apis
    .MachineType
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_MACHINETYPE,
         payload: msgs
      })
  })



const addMachineType = (queryBody) => dispatch =>
  apis
    .MachineType
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_MACHINETYPE,
         payload: msgs
      })
      return msgs
  })

const updateMachineType = (updBody) => dispatch =>
  apis
    .MachineType
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_MACHINETYPE,
         payload: msgs
      })
     return msgs
  })

  const deleteMachineType = (deleteBody) => dispatch =>
  apis
    .MachineType
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_MACHINETYPE,
         payload: msgs
      })
     return msgs
  })



/* default 导出所有 Action Creators */
export default {
  fetchMachineType, addMachineType, updateMachineType, deleteMachineType, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_MACHINETYPE]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_MACHINETYPE]: (result, { payload }) => ({payload}),
  [UPDATE_MACHINETYPE]: (result, { payload }) => ({payload}),
  [DELETE_MACHINETYPE]: (result, { payload }) => ({payload})
}



