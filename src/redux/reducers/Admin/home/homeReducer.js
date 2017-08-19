import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/home/homeAction'

export default createReducer({data: [], totalMachine: '', amountByMachine: ''}, ACTION_HANDLERS)
