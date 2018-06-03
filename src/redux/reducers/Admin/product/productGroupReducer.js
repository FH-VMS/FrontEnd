import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/product/productGroupAction'

export default createReducer({data: [], pager: {}}, ACTION_HANDLERS)
