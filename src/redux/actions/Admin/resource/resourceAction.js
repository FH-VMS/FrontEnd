import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_RESOURCE = 'FETCH_RESOURCE'
const ADD_RESOURCE = 'ADD_RESOURCE'
const UPDATE_RESOURCE = 'UPDATE_RESOURCE'
const DELETE_RESOURCE = 'DELETE_RESOURCE'

// ================================
// Action Creator
// ================================
const fetchResource = (queryBody) => dispatch =>
  apis
    .Resource
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_RESOURCE,
         payload: msgs
      })
  })

  const addResource = (addBody) => dispatch =>
  apis
    .Resource
    .PostData(addBody)
    .then(msgs => {
      dispatch({
         type: ADD_RESOURCE,
         payload: msgs
      })
      return msgs
  })

const updateResource = (updBody) => dispatch =>
  apis
    .Resource
    .PutData(updBody)
    .then(msgs => {
      dispatch({
         type: UPDATE_RESOURCE,
         payload: msgs
      })
     return msgs
  })

  const deleteResource = (deleteBody) => dispatch =>
  apis
    .Resource
    .DeleteData(deleteBody)
    .then(msgs => {
      dispatch({
         type: DELETE_RESOURCE,
         payload: msgs
      })
     return msgs
  })

/* default 导出所有 Action Creators */
export default {
    fetchResource, addResource, updateResource, deleteResource
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_RESOURCE]: (resource, { payload }) => {
    resource.data = payload.data
    resource.pager = payload.pager
      return resource
  },
  [ADD_RESOURCE]: (result, { payload }) => ({payload}),
  [UPDATE_RESOURCE]: (result, { payload }) => ({payload}),
  [DELETE_RESOURCE]: (result, { payload }) => ({payload})
}



