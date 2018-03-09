import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/home/homeAction'

export default createReducer({data: [], totalMachine: '', amountByMachine: '', payNumbers: [], groupMoney: [], groupProduct: []}, ACTION_HANDLERS)
