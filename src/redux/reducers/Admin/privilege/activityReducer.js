import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/privilege/activityAction'

export default createReducer({data: [], pager: {}, relationData: []}, ACTION_HANDLERS)
