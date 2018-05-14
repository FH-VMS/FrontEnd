import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/privilege/privilegeListAction'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
