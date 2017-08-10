
export default {
  path: 'machinemap',

  /* 布局基页 */
  getComponent (nextState, cb) {
    require.ensure([], (require) => {
      // 立即注入 Reducer
      // injectReducer('customer', require('REDUCER/Admin/customer/').default)

      cb(null, require('VIEW/admin/map').default)
    }, 'customerView')
  },

  indexRoute: { // 对应 /msg
  },

  childRoutes: [
  ]
}
