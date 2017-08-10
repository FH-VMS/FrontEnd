import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_MACHINECABINET = 'FETCH_MACHINECABINET'
const ADD_MACHINECABINET = 'ADD_MACHINECABINET'
const UPDATE_MACHINECABINET = 'UPDATE_MACHINECABINET'
const DELETE_MACHINECABINET = 'DELETE_MACHINECABINET'

// ================================
// Action Creator
// ================================
const fetchMachineCabinet = (queryBody) => dispatch =>
  apis
    .MachineCabinet
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_MACHINECABINET,
         payload: msgs
      })
  })

 


const addMachineCabinet = (queryBody) => dispatch =>
  apis
    .MachineCabinet
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_MACHINECABINET,
         payload: msgs
      })
      return msgs
  })

const updateMachineCabinet = (updBody) => dispatch =>
  apis
    .MachineCabinet
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_MACHINECABINET,
         payload: msgs
      })
     return msgs
  })

  const deleteMachineCabinet = (deleteBody) => dispatch =>
  apis
    .MachineCabinet
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_MACHINECABINET,
         payload: msgs
      })
     return msgs
  })



/* default 导出所有 Action Creators */
export default {
  fetchMachineCabinet, addMachineCabinet, updateMachineCabinet, deleteMachineCabinet
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_MACHINECABINET]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_MACHINECABINET]: (result, { payload }) => ({payload}),
  [UPDATE_MACHINECABINET]: (result, { payload }) => ({payload}),
  [DELETE_MACHINECABINET]: (result, { payload }) => ({payload})
}



