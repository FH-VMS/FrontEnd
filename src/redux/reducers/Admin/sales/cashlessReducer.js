import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/sales/cashlessAction'

export default createReducer({data: [], pager: {}, refundDetail: {}}, ACTION_HANDLERS)
