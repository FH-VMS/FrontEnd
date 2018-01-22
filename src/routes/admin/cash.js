import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'
import Utility from 'UTIL/utility'

const connectComponent = createContainer(
  ({ machineOperation }) => ({ machineOperation }), // mapStateToProps
  require('ACTION/Admin/machineoperation/fullfilAction').default               // mapActionCreators
)

export default {
  path: 'cash/:machineId',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
      injectReducer('machineOperation', require('REDUCER/Admin/machineoperation/fullfilReducer').default)
   
      cb(null, connectComponent(require('COMPONENT/Admin/machineoperation/cash').default))
    }, 'machineOperationView')
  },

  indexRoute: { 
  },

  childRoutes: [
     /*
    { // 对应 /msg/detail/:msgId
    path: 'cash',
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        injectReducer('machineOperation', require('REDUCER/Admin/machineoperation/fullfilReducer').default)
        cb(null, connectComponent(require('COMPONENT/Admin/machineoperation/cash').default))
      }, 'cashView')
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
  ],
  onEnter: () => {
    Utility.hasAuth('machineoperation')
  }
}
