import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_MENU = 'FETCH_MENU'
const CLEAR_LOGINCACHE = 'CLEAR_LOGINCACHE'
const FETCH_CLIENTDIC = 'FETCH_CLIENTDIC'


// ================================
// Action Creator
// ================================
const fetchMenu = () => dispatch =>
  apis
    .Common
    .GetMenus()
    .then(msgs => {
      dispatch({
         type: FETCH_MENU,
         payload: msgs
      })

      return msgs
  })
      // 清除登录缓存
      const clearLoginCache = () => dispatch =>
      apis
        .Common
        .ClearLoginCache()
        .then(msgs => {
          dispatch({
             type: CLEAR_LOGINCACHE,
             payload: msgs
          })
          return msgs
      })

        // 取客户当字典
  const fetchClient = (bdy) => dispatch =>
  apis
    .User
    .GetClientDic(bdy)
    .then(msgs => {
      dispatch({
         type: FETCH_CLIENTDIC,
         payload: msgs
      })

      return msgs
  })
  
/* default 导出所有 Action Creators */
export default {
  fetchMenu, clearLoginCache, fetchClient
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_MENU]: (menus, { payload }) => ({
      menus: payload
  }),
  [CLEAR_LOGINCACHE]: (result, { payload }) => ({payload})
}



