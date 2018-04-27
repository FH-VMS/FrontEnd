import createReducer from 'UTIL/createReducer'
import { ACTION_HANDLERS } from 'ACTION/wechat/common/wechatAction'

export default createReducer({productTypeData: [], productData: []}, ACTION_HANDLERS)
