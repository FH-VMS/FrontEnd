import apis from 'SERVICE/apis'
// ================================
// Action Type
// ================================
const FETCH_PRODUCTTYPE = 'FETCH_PRODUCTTYPE'
const ADD_PRODUCTTYPE = 'ADD_PRODUCTTYPE'
const UPDATE_PRODUCTTYPE = 'UPDATE_PRODUCTTYPE'
const DELETE_PRODUCTTYPE = 'DELETE_PRODUCTTYPE'

// ================================
// Action Creator
// ================================
const fetchProductType = (queryBody) => dispatch =>
  apis
    .ProductType
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTTYPE,
         payload: msgs
      })
  })


const addProductType = (queryBody) => dispatch =>
  apis
    .ProductType
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_PRODUCTTYPE,
         payload: msgs
      })
      return msgs
  })

const updateProductType = (updBody) => dispatch =>
  apis
    .ProductType
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_PRODUCTTYPE,
         payload: msgs
      })
     return msgs
  })

  const deleteProductType = (deleteBody) => dispatch =>
  apis
    .ProductType
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_PRODUCTTYPE,
         payload: msgs
      })
     return msgs
  })



/* default 导出所有 Action Creators */
export default {
    fetchProductType, addProductType, updateProductType, deleteProductType
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PRODUCTTYPE]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_PRODUCTTYPE]: (result, { payload }) => ({payload}),
  [UPDATE_PRODUCTTYPE]: (result, { payload }) => ({payload}),
  [DELETE_PRODUCTTYPE]: (result, { payload }) => ({payload})
}



