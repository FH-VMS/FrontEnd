import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'
// ================================
// Action Type
// ================================
const FETCH_PRODUCTGROUP = 'FETCH_PRODUCTGROUP'
const ADD_PRODUCTGROUP = 'ADD_PRODUCTGROUP'
const UPDATE_PRODUCTGROUP = 'UPDATE_PRODUCTGROUP'
const DELETE_PRODUCTGROUP = 'DELETE_PRODUCTGROUP'
const FETCH_PRODUCTGROUPBYID = 'FETCH_PRODUCTGROUPBYID'

// ================================
// Action Creator
// ================================
const fetchProductGroup = (queryBody) => dispatch =>
  apis
    .ProductGroup
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTGROUP,
         payload: msgs
      })
  })


const addProductGroup = (queryBody) => dispatch =>
  apis
    .ProductGroup
    .PostData(queryBody)
    .then(msgs => {
      dispatch({
         type: ADD_PRODUCTGROUP,
         payload: msgs
      })
      return msgs
  })

const updateProductGroup = (updBody) => dispatch =>
  apis
    .ProductGroup
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_PRODUCTGROUP,
         payload: msgs
      })
     return msgs
  })

  const deleteProductGroup = (deleteBody) => dispatch =>
  apis
    .ProductGroup
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_PRODUCTGROUP,
         payload: msgs
      })
     return msgs
  })


  const fetchProductGroupById = (queryBody) => dispatch =>
  apis
    .ProductGroup
    .GetProductRelationById(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTGROUPBYID,
         payload: msgs
      })
  })



/* default 导出所有 Action Creators */
export default {
    fetchProductGroup, addProductGroup, updateProductGroup, deleteProductGroup, fetchProductGroupById, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_PRODUCTGROUP]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [ADD_PRODUCTGROUP]: (result, { payload }) => ({payload}),
  [UPDATE_PRODUCTGROUP]: (result, { payload }) => ({payload}),
  [DELETE_PRODUCTGROUP]: (result, { payload }) => ({payload}),
  [FETCH_PRODUCTGROUPBYID]: (result, { payload }) => {
    result.groupData = payload
    return result
}
}



