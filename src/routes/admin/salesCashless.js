import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'
import Utility from 'UTIL/utility'

const connectComponent = createContainer(
  ({ salesCashless }) => ({ salesCashless }), // mapStateToProps
  require('ACTION/Admin/sales/cashlessAction').default               // mapActionCreators
)

export default {
  path: 'salecashless',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
      injectReducer('salesCashless', require('REDUCER/Admin/sales/cashlessReducer').default)

      cb(null, connectComponent(require('VIEW/admin/salescashless').default))
    }, 'salescashlessView')
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
    Utility.hasAuth('salecashless')
  }
}
