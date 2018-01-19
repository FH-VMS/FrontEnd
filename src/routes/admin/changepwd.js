import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'
import Utility from 'UTIL/utility'

const connectComponent = createContainer(
  ({userdata}) => ({ userdata }), // mapStateToProps
  require('ACTION/Admin/common/loginAction').default               // mapActionCreators
)

export default {
  path: 'changepwd',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
      injectReducer('userdata', require('REDUCER/Admin/common/loginReducer').default)

      cb(null, connectComponent(require('VIEW/admin/changepwd').default))
    }, 'userdataView')
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
  ],
  onEnter: () => {
    Utility.hasAuth('changepwd')
  }
}
