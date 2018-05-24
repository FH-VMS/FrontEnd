import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/Admin/websetting/webSettingAction'

export default createReducer({webData: [], resourceData: [], resourcePager: {}}, ACTION_HANDLERS)
