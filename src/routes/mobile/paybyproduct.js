import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'

const connectComponent = createContainer(
  ({ mobile }) => ({ mobile }), // mapStateToProps
  require('ACTION/mobile/pay/payAction').default               // mapActionCreators
)

export default {
  path: 'paybyproduct',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
        injectReducer('mobile', require('REDUCER/mobile/pay/payReducer').default)

        cb(null, connectComponent(require('VIEW/mobile/paybyproduct').default))
      }, 'mobileView')
  },

  indexRoute: { // 对应 /msg
    /* 
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        cb(null, connectComponent(require('COMPONENT/admin/user/userList').default))
      }, 'userList')
    }
    * */
  },

  childRoutes: [
    /*
    { // 对应 /msg/detail/:msgId
    path: 'detail/:msgId',
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        cb(null, connectComponent(require('COMPONENT/Msg/MsgDetail').default))
      }, 'msgDetail')
    }
  },
  { // 对应 /msg/add
    path: 'add',
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        cb(null, connectComponent(require('COMPONENT/Msg/MsgForm').default))
      }, 'msgForm')
    },
    onEnter: userAuth
  },
  { // 对应 /msg/:msgId
    path: 'modify/:msgId',
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        cb(null, connectComponent(require('COMPONENT/Msg/MsgForm').default))
      }, 'msgForm')
    },
    onEnter: userAuth
  }
  * */
  ]
}
