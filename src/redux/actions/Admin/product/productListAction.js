import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'
// ================================
// Action Type
// ================================
const FETCH_PRODUCTLIST = 'FETCH_PRODUCTLIST'
const ADD_PRODUCTLIST = 'ADD_PRODUCTLIST'
const UPDATE_PRODUCTLIST = 'UPDATE_PRODUCTLIST'
const DELETE_PRODUCTLIST = 'DELETE_PRODUCTLIST'

// ================================
// Action Creator
// ================================
const fetchProductList = (queryBody) => dispatch =>
  apis
    .ProductList
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTLIST,
         payload: msgs
      })
  })


const addProductList = (queryBody) => dispatch =>
  apis
    .ProductList
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_PRODUCTLIST,
         payload: msgs
      })
      return msgs
  })

const updateProductList = (updBody) => dispatch =>
  apis
    .ProductList
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_PRODUCTLIST,
         payload: msgs
      })
     return msgs
  })

  const deleteProductList = (deleteBody) => dispatch =>
  apis
    .ProductList
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_PRODUCTLIST,
         payload: msgs
      })
     return msgs
  })



/* default 导出所有 Action Creators */
export default {
  fetchProductList, addProductList, updateProductList, deleteProductList, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PRODUCTLIST]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_PRODUCTLIST]: (result, { payload }) => ({payload}),
  [UPDATE_PRODUCTLIST]: (result, { payload }) => ({payload}),
  [DELETE_PRODUCTLIST]: (result, { payload }) => ({payload})
}



