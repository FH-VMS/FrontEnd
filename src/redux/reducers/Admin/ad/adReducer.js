import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/ad/adAction'

export default createReducer({data: [], resourceData: [], resourcePager: {}}, ACTION_HANDLERS)
