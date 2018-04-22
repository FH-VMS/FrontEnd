


export default {
    path: 'cart',
  
    /* 布局基页 */
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        // 立即注入 Reducer
        cb(null, require('VIEW/wechat/cart').default)
      }, 'cartView')
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
