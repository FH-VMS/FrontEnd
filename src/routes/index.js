
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

const connectWechat = createContainer(
  ({wechat}) => ({ wechat }), // mapStateToProps
  require('ACTION/wechat/common/wechatAction').default               // mapActionCreators
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
     require('./admin/productgroup').default,  // 商品组
     require('./admin/producttype').default,  // 商品类型
     require('./admin/salesCashless').default,  // 销售列表
     require('./admin/picksales').default,  // 取货销售列表
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
     require('./admin/machineoperation').default,  // 补货修改
     require('./admin/cash').default,  // 现金下推
     require('./admin/resource').default,  // 资源库
     require('./admin/ad').default,  // 广告设置
     require('./admin/salecash').default,  // 现金销售记录
     require('./admin/saleic').default,  // IC销售记录
     require('./admin/productstatistic').default, // 商品统计
     require('./admin/moneystatistic').default, // 金额统计
     require('./admin/privilege').default, // 优惠券管理
     require('./admin/member').default, // 会员管理
     require('./admin/wechatsetting').default, // 公众号设置
     require('./admin/activity').default, // 活动管理
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
    require('./mobile/paybyproduct').default, // 手机选择商品去支付
    require('./mobile/adultMachine').default, // 小机器商品页
    require('./mobile/wechatproduct').default // 公众号内的商城
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
      require('./h5/stockmanageh5').default, // 库存管理
      require('./h5/maxstock').default, // 最大库存
      require('./h5/priceset').default // 价格设置
  ]
 },
 wechat: {
  path: '/',
  component: require('VIEW/wechat/frame').default,
  indexRoute: {
    getComponent (nextState, cb) {
     
      require.ensure([], (require) => {
        // 立即注入 Reducer
        injectReducer('wechat', require('REDUCER/wechat/common/wechatReducer').default)
      
        cb(null, connectWechat(require('VIEW/wechat/mall').default))
      }, 'wechatView')
      
      
  }
  },
  childRoutes: [
    require('./wechat/my').default,
    require('./wechat/cart').default,
    require('./wechat/activity').default,
    require('./wechat/notservice').default,
    require('./wechat/order').default,
    require('./wechat/pay').default,
    require('./wechat/paybywares').default,
    require('./wechat/myticket').default,
    require('./wechat/service').default,
    require('./wechat/around').default,
    require('./wechat/aroundmap').default,
    require('./wechat/result').default,
    require('./wechat/share').default,
    require('./wechat/getshare').default
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
