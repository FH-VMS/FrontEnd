import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/auth'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
