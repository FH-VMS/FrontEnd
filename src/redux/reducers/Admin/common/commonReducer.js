import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/common/commonAction'

export default createReducer({dicData: [], productTypeDic: []}, ACTION_HANDLERS)
