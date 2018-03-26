import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'

// ================================
// Action Type
// ================================
const FETCH_MACHINELIST = 'FETCH_MACHINELIST'
const ADD_MACHINELIST = 'ADD_MACHINELIST'
const UPDATE_MACHINELIST = 'UPDATE_MACHINELIST'
const DELETE_MACHINELIST = 'DELETE_MACHINELIST'
const FETCH_MACHINETYPEDIC = 'FETCH_MACHINETYPEDIC'
const COPY_MACHINE = 'COPY_MACHINE'

// ================================
// Action Creator
// ================================
const fetchMachineList = (queryBody) => dispatch =>
  apis
    .MachineList
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_MACHINELIST,
         payload: msgs
      })
  })

  const fetchMachineTypeDic = () => dispatch =>
  apis
    .MachineList
    .GetMachineTypeDic()
    .then(msgs => {
      dispatch({
         type: FETCH_MACHINETYPEDIC,
         payload: msgs
      })
      return msgs
  })


const addMachineList = (queryBody) => dispatch =>
  apis
    .MachineList
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_MACHINELIST,
         payload: msgs
      })
      return msgs
  })

const updateMachineList = (updBody) => dispatch =>
  apis
    .MachineList
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_MACHINELIST,
         payload: msgs
      })
     return msgs
  })

  const deleteMachineList = (deleteBody) => dispatch =>
  apis
    .MachineList
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_MACHINELIST,
         payload: msgs
      })
     return msgs
  })

  const copyOneMachine = (copyParam) => dispatch =>
  apis
    .MachineOperation
    .CopyOneMachine(copyParam)
    .then(msgs => {
      dispatch({
         type: COPY_MACHINE,
         payload: msgs
      })
      return msgs
  })



/* default 导出所有 Action Creators */
export default {
  fetchMachineList, addMachineList, updateMachineList, deleteMachineList, fetchMachineTypeDic, ...common, copyOneMachine
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_MACHINELIST]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_MACHINELIST]: (result, { payload }) => ({payload}),
  [UPDATE_MACHINELIST]: (result, { payload }) => ({payload}),
  [DELETE_MACHINELIST]: (result, { payload }) => ({payload}),
  [FETCH_MACHINETYPEDIC]: (result, { payload }) => {
      result.machineTypeDic = payload
      return result
  },
  [COPY_MACHINE]: (result, { payload }) => ({payload})
}



