import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/machine/tunnelInfoAction'

export default createReducer({data: [], machineDic: [], pager: {}, cabinetInfo: [], productDic: []}, ACTION_HANDLERS)
