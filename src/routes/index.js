
// 移动端
import { injectReducer } from 'REDUCER'
import createContainer from 'UTIL/createContainer'

const connectComponent = createContainer(
  ({ mobile }) => ({ mobile }), // mapStateToProps
  require('ACTION/mobile/pay/payAction').default               // mapActionCreators
)

const connectTotalMoeny = createContainer(
  ({totalMoney}) => ({ totalMoney }), // mapStateToProps
  require('ACTION/Admin/home/homeAction').default               // mapActionCreators
)

export default {
  main: {
  
 },
 admin: {
  path: '/',
  component: require('VIEW/admin/frame').default,
  indexRoute: {
    // component: require('VIEW/admin/home').default
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        // 立即注入 Reducer
        injectReducer('totalMoney', require('REDUCER/Admin/home/homeReducer').default)

        cb(null, connectTotalMoeny(require('VIEW/admin/home').default))
      }, 'totalMoneyView')
    }
  },

  childRoutes: [
    // 路由按模块组织分离，避免单文件代码量过大
     require('./admin/user').default,      // 用户列表
     require('./admin/customer').default, // 客户列表
     require('./admin/auth').default, // 权限配置
     require('./admin/machineType').default,  // 机型列表
     require('./admin/machineList').default,  // 机器列表
     require('./admin/machineConfig').default,  // 机器配置
     require('./admin/tunnelConfig').default,  // 货道配置
     require('./admin/productList').default,  // 商品列表
     require('./admin/salesCashless').default,  // 销售列表
     require('./admin/customerInfo').default,  // 客户运营信息
     require('./admin/userInfo').default,  // 用户运营信息
     require('./admin/machineConfigInfo').default,  // 机器配置信息
     require('./admin/tunnelInfo').default,  // 货道信息
     require('./admin/machinemap').default,  // 机器地图
     require('./admin/changepwd').default,  // 修改密码
     require('./admin/tunnelfullfil').default,  // 补货单生成
     require('./admin/machinecabinet').default,  // 机柜列表
     require('./admin/payconfig').default,  // 支付配置列表
     require('./admin/machineMoney').default,  // 按机器统计销售额
     require('./admin/machineTrans').default,  // 机器迁移
    // 强制“刷新”页面的 hack
    { path: 'redirect', component: require('COMPONENT/Redirect').default },
    
    // 无路由匹配的情况一定要放到最后，否则会拦截所有路由
    { path: '*', component: require('COMPONENT/admin/404').default }
  ]
 },
 login: {
  path: '/',
  component: require('VIEW/admin/login').default,
  indexRoute: {
    component: require('VIEW/admin/login').default
  },
  childRoutes: [
    // 路由按模块组织分离，避免单文件代码量过大
    // 强制“刷新”页面的 hack
    { path: 'redirect', component: require('COMPONENT/Redirect').default },
    
    // 无路由匹配的情况一定要放到最后，否则会拦截所有路由
    { path: '*', component: require('COMPONENT/admin/404').default }
  ]
 },
 mobile: {
  path: '/',
  component: require('VIEW/mobile/frame').default,
  indexRoute: {
    getComponent (nextState, cb) {
      require.ensure([], (require) => {
        // 立即注入 Reducer
        injectReducer('mobile', require('REDUCER/mobile/pay/payReducer').default)

        cb(null, connectComponent(require('VIEW/mobile/pay').default))
      }, 'mobileView')
  }
  },
  childRoutes: [
    require('./mobile/productList').default, // 根据机器编号取商品列表
    require('./mobile/payResult').default, // 支付结果页
    require('./mobile/notService').default,
    require('./mobile/paybyproduct').default // 手机选择商品去支付
  ]
 },
 hfive: {
  path: '/',
  component: require('VIEW/h5/frame').default,
  indexRoute: {
    getComponent (nextState, cb) {
     
      require.ensure([], (require) => {
        // 立即注入 Reducer
        // injectReducer('mobile', require('REDUCER/mobile/pay/payReducer').default)
      
        cb(null, connectComponent(require('VIEW/h5/login').default))
      }, 'h5LoginView')
      
      
  }
  },
  childRoutes: [
      require('./h5/main').default, // 主页九宫格
      require('./h5/choosemachine').default, // 选择机器
       require('./h5/stockmanageh5').default // 库存管理
  ]
 }
}


/*
  当前路由树如下
  ├ /
  |
  ├ /msg
  ├ /msg/add
  ├ /msg/detail/:msgId
  ├ /msg/modify/:msgId
  |
  ├ /todo
  |
  ├ /redirect
*/
