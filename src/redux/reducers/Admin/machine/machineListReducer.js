import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/machine/machineListAction'

export default createReducer({data: [], pager: {}, machineTypeDic: []}, ACTION_HANDLERS)
