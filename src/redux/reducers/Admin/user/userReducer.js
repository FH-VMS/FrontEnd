import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/user/userAction'

export default createReducer({data: [], pager: {}, authData: [], clientDic: []}, ACTION_HANDLERS)
