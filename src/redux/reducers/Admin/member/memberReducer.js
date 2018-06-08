import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/member/memberAction'

export default createReducer({data: [], pager: {}, privilegeData: [], privilegePager: {}}, ACTION_HANDLERS)
