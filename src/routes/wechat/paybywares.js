import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'
const connectWechat = createContainer(
    ({wechat}) => ({ wechat }), // mapStateToProps
    require('ACTION/wechat/common/wechatAction').default               // mapActionCreators
  )

export default {
    path: 'pay/:waresId',
  
    /* 布局基页 */
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        // 立即注入 Reducer
        injectReducer('wechat', require('REDUCER/wechat/common/wechatReducer').default)
        cb(null, connectWechat(require('VIEW/wechat/pay').default))
      }, 'payView')
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
      path: 'pay/:waresId',
      getComponent (nextState, cb) {
        require.ensure([], (require) => {
          // 立即注入 Reducer
          injectReducer('wechat', require('REDUCER/wechat/common/wechatReducer').default)
          cb(null, connectWechat(require('VIEW/wechat/pay').default))
        }, 'payView')
      }
    }
     
    ,
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
