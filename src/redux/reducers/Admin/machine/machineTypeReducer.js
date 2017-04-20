import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/machine/machineTypeAction'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
