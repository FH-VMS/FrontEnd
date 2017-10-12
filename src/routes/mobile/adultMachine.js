import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'

const connectComponent = createContainer(
  ({product}) => ({ product }), // mapStateToProps
  require('ACTION/mobile/product/listAction').default               // mapActionCreators
)

export default {
  path: 'a/:id',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
      injectReducer('adultMachine', require('REDUCER/mobile/product/listReducer').default)

      cb(null, connectComponent(require('VIEW/mobile/adultmachine').default))
    }, 'adultMachineView')
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
