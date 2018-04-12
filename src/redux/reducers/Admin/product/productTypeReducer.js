import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/product/productTypeAction'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
