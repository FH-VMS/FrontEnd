import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_CUSTOMER = 'FETCH_CUSTOMER'
const ADD_CUSTOMER = 'ADD_CUSTOMER'
const UPDATE_CUSTOMER = 'UPDATE_CUSTOMER'
const DELETE_CUSTOMER = 'DELETE_CUSTOMER'

// ================================
// Action Creator
// ================================
const fetchCustomer = (queryBody) => dispatch =>
  apis
    .Customer
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_CUSTOMER,
         payload: msgs
      })
  })

const addCustomer = (queryBody) => dispatch =>
  apis
    .Customer
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_CUSTOMER,
         payload: msgs
      })
      return msgs
  })

const updateCustomer = (updBody) => dispatch =>
  apis
    .Customer
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_CUSTOMER,
         payload: msgs
      })
     return msgs
  })

  const deleteCustomer = (deleteBody) => dispatch =>
  apis
    .Customer
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_CUSTOMER,
         payload: msgs
      })
     return msgs
  })

/* default 导出所有 Action Creators */
export default {
  fetchCustomer, addCustomer, updateCustomer, deleteCustomer
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_CUSTOMER]: (customer, { payload }) => {
      customer.data = payload.data
      customer.pager = payload.pager
      return customer
  },
  [ADD_CUSTOMER]: (result, { payload }) => ({payload}),
  [UPDATE_CUSTOMER]: (result, { payload }) => ({payload}),
  [DELETE_CUSTOMER]: (result, { payload }) => ({payload})
}



