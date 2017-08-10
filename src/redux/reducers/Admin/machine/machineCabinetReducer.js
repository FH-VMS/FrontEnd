import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/machine/machineCabinetAction'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
