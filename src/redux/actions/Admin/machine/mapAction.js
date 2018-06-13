import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'


const FETCH_MACHINELOCATION = 'FETCH_MACHINELOCATION'
const ADD_MACHINELOCATION = 'ADD_MACHINELOCATION'
const UPDATE_MACHINELOCATION = 'UPDATE_MACHINELOCATION'
const DELETE_MACHINELOCATION = 'DELETE_MACHINELOCATION'
const FETCH_LOCATIONBYMACHINE = 'FETCH_LOCATIONBYMACHINE'


const fetchMachineList = (queryBody) => dispatch =>
apis
  .MachineLocation
  .GetData(queryBody)
  .then(msgs => {
    dispatch({
       type: FETCH_MACHINELOCATION,
       payload: msgs
    })
})




const addMachineLocation = (queryBody) => dispatch =>
apis
  .MachineLocation
  .PostData(queryBody)
  .then(msgs => {
    dispatch({
       type: ADD_MACHINELOCATION,
       payload: msgs
    })
    return msgs
})

const updateMachineLocation = (updBody) => dispatch =>
apis
  .MachineLocation
  .PutData(updBody)
  .then(msgs => {
    dispatch({
       type: UPDATE_MACHINELOCATION,
       payload: msgs
    })
   return msgs
})

const deleteMachineLocation = (deleteBody) => dispatch =>
apis
  .MachineLocation
  .DeleteData(deleteBody)
  .then(msgs => {
    dispatch({
       type: DELETE_MACHINELOCATION,
       payload: msgs
    })
   return msgs
})

const fetchLocationByMachine = (deleteBody) => dispatch =>
apis
  .MachineLocation
  .GetLocationByMachineId(deleteBody)
  .then(msgs => {
    dispatch({
       type: FETCH_LOCATIONBYMACHINE,
       payload: msgs
    })
   return msgs
})

/* default 导出所有 Action Creators */
export default {
  fetchMachineList, addMachineLocation, updateMachineLocation, deleteMachineLocation, fetchLocationByMachine, ...common
}


export const ACTION_HANDLERS = {
  [FETCH_MACHINELOCATION]: (result, { payload }) => {
      result.data = payload
      return result
  },
  [ADD_MACHINELOCATION]: (result, { payload }) => ({payload}),
  [UPDATE_MACHINELOCATION]: (result, { payload }) => ({payload}),
  [DELETE_MACHINELOCATION]: (result, { payload }) => ({payload}),
  [FETCH_LOCATIONBYMACHINE]: (result, { payload }) => ({payload})
}

