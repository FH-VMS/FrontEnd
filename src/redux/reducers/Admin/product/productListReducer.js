import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/product/productListAction'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
