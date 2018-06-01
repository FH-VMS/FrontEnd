import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'
import Utility from 'UTIL/utility'
const connectComponent = createContainer(
  ({ machineMap }) => ({ machineMap }), // mapStateToProps
  require('ACTION/Admin/machine/mapAction').default               // mapActionCreators
)
export default {
  path: 'machinemap',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
      injectReducer('machineMap', require('REDUCER/Admin/machine/mapReducer').default)

      cb(null, connectComponent(require('VIEW/admin/map').default))
    }, 'machineMapView')
  },

  indexRoute: { // 对应 /msg
  },

  childRoutes: [
  ],
  onEnter: () => {
    Utility.hasAuth('machinemap')
  }
}
