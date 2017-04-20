import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/machine/tunnelConfigAction'

export default createReducer({data: [], machineDic: [], productDic: []}, ACTION_HANDLERS)
