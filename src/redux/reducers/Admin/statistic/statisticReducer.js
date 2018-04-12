import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/statistic/statisticAction'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
