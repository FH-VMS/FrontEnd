import apis from 'SERVICE/apis'
import common from 'ACTION/Admin/common/commonAction'

// ================================
// Action Type
// ================================
const FETCH_RESOURCE = 'FETCH_RESOURCE'
const FETCH_WEBSETTING = 'FETCH_WEBSETTING'
const CREATE_WEBSETTING = 'CREATE_WEBSETTING'


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
      return msgs
  })

  const fetchWebSetting = (queryBody) => dispatch =>
  apis
    .WebSetting
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_WEBSETTING,
         payload: msgs
      })
  })

  const createWebSetting = (queryBody) => dispatch =>
  apis
    .WebSetting
    .CreateWebInfo(queryBody)
    .then(msgs => {
      dispatch({
         type: CREATE_WEBSETTING,
         payload: msgs
      })
      return msgs
  })



/* default 导出所有 Action Creators */
export default {
    fetchResource, fetchWebSetting, createWebSetting, ...common
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_RESOURCE]: (result, { payload }) => {
    result.resourceData = payload.data
    result.resourcePager = payload.pager
      return {...result, ...payload}
  },
  [FETCH_WEBSETTING]: (result, { payload }) => {
    result.webData = payload
      return result
  },
  [CREATE_WEBSETTING]: (result, { payload }) => (payload)
}



