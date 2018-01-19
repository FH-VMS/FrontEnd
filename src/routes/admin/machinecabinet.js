import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'
import Utility from 'UTIL/utility'

const connectComponent = createContainer(
  ({ machineCabinet }) => ({ machineCabinet }), // mapStateToProps
  require('ACTION/Admin/machine/machineCabinetAction').default               // mapActionCreators
)

export default {
  path: 'machinecabinet',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
      injectReducer('machineCabinet', require('REDUCER/Admin/machine/machineCabinetReducer').default)

      cb(null, connectComponent(require('VIEW/admin/machinecabinet').default))
    }, 'machineCabinetView')
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
    Utility.hasAuth('machinecabinet')
  }
}
