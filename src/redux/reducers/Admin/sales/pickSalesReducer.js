import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/sales/pickSalesAction'

export default createReducer({data: [], pager: {}, refundDetail: {}}, ACTION_HANDLERS)
