import apis from 'SERVICE/apis'

// ================================
// Action Type
// ================================
const FETCH_MEMBER = 'FETCH_MEMBER'
const GIVE_PRIVILEGE = 'GIVE_PRIVILEGE'
const FETCH_PRIVILEGEBYMEMBER = 'FETCH_PRIVILEGEBYMEMBER'

// ================================
// Action Creator
// ================================
const fetchMemberList = (queryBody) => dispatch =>
  apis
    .Member
    .GetData(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_MEMBER,
         payload: msgs
      })
  })


const givePrivilege = (queryBody) => dispatch =>
  apis
    .Member
    .GivePrivilegeTicket(queryBody)
    .then(msgs => {
      dispatch({
         type: GIVE_PRIVILEGE,
         payload: msgs
      })
      return msgs
  })


  const fetchPrivilegeByMember = (queryBody) => dispatch =>
  apis
    .Wechat
    .GetPrivilegeByMemberId(queryBody)
    .then(msgs => {
      dispatch({
         type: FETCH_PRIVILEGEBYMEMBER,
         payload: msgs
      })
      return msgs
  })



/* default 导出所有 Action Creators */
export default {
    fetchMemberList, givePrivilege, fetchPrivilegeByMember
}

// ================================
// Action handlers for Reducer
// 本来更新 state 是 Reducer 的责任
// 但要把 ActionType 导出又引入实在太麻烦
// 且在 Reducer 中写 switch-case 实在太不优雅
// 故在此直接给出处理逻辑
// ================================
export const ACTION_HANDLERS = {
  [FETCH_MEMBER]: (result, { payload }) => {
      result.data = payload.data
      result.pager = payload.pager
      return result
  },
  [givePrivilege]: (result, { payload }) => ({payload}),
  [FETCH_PRIVILEGEBYMEMBER]: (result, { payload }) => ({payload})
}



