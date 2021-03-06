import React, {Component} from 'react'
import {TabBar, Toast} from 'antd-mobile'
import {hashHistory} from 'react-router'
import {handleUrlParams} from 'UTIL/mobileUtility'
import wechatUtility from 'UTIL/wechatUtility'
import 'ASSET/less/wechat.less'


import wechat from 'ACTION/wechat/common/wechatAction'
import { bindActionCreators } from 'redux'
import {connect} from 'react-redux'
import PropTypes from 'prop-types'
import $ from 'jquery'


// const { Header, Sider, Content } = Layout

const mapDispatchToProps = (dispatch) => ({
  wechat: bindActionCreators(wechat, dispatch)
})

@connect(
	({ wechat }) => ({ wechat }),
	mapDispatchToProps
)

class WechatFrame extends Component {
	constructor(props) {
        super(props)
        this.state = {
           selectedTab: 'mall',
           canLoad: false,
           cartCount: 0
        }
  }
  
  // 父组件声明自己支持 context
  static childContextTypes = {
      callback: PropTypes.func
  }

  // 父组件提供一个函数，用来返回相应的 context 对象
  getChildContext() {
      return {
          callback: this.callback.bind(this)
      }
  }

  callback(typ, obj) {
    
    switch (typ) {
      case 'addcart':
      let carts = []
      let chosenProducts = wechatUtility.Cart.getData()
      
      if (!chosenProducts) {
        if (!obj.chosenNum) {
          obj.chosenNum = 1
        }
        carts.push(obj)
        
      } else {
        carts = JSON.parse(chosenProducts)
        let canPush = true
        for (let i = 0;i < carts.length;i++) {
          if (obj.WaresId == carts[i].WaresId) {
            if (!obj.chosenNum) {
              carts[i].chosenNum = carts[i].chosenNum + 1
            } else {
              carts[i].chosenNum = carts[i].chosenNum + obj.chosenNum
            }
            
            canPush = false
            break
          }
        }
        if (canPush) {
          if (!obj.chosenNum) {
            obj.chosenNum = 1
          }
          carts.push(obj)
        }
      }

      localStorage.setItem('cartproducts', JSON.stringify(carts))
      this.setState({cartCount: carts.length})
      break
      case 'deletecartproduct':
      this.setState({cartCount: this.state.cartCount - 1})
      break
      case 'clearcart':
      wechatUtility.Cart.clearData()
      this.setState({cartCount: 0})
      break
    }
  }

  componentWillMount() {
    
    Toast.loading('加载中')
    let searchPara = handleUrlParams(window.location.href.split('?')[1])
    if (!searchPara.clientId) {
        hashHistory.push('/notservice')
        return
    }
    this.gotoPage(searchPara)
    if (!sessionStorage.getItem('wechatInfo')) {
        if (location.href.split('?').length > 2) {
          let reallyUrlArr = location.href.split('#')[0].split('?')
          location.href = reallyUrlArr[0] + '#/?' + reallyUrlArr[1]
          return
        }
        
        if (wechatUtility.isWeiXin()) {
          
          if (!searchPara.code) {
              searchPara.code = '-1'
          }
          let backUrl = this.getBackUrl(searchPara)
          this.props.wechat.fetchWechatAuth({m: searchPara.clientId, code: searchPara.code, retBack: backUrl}).then(msg => {
            let {RequestState, RequestData, ProductJson} = msg
            if (RequestState == '0') {
              location.href = RequestData
            } else if (RequestState == '1') {
              sessionStorage.setItem('wechatInfo', ProductJson)
              this.setState({canLoad: true})
            } else if (RequestState == '2') {
              // 请求商品错误
            } else {
            }
            Toast.hide()
          })
      }
    }
   
  }

  // 微信回调页面
  getBackUrl = (searchPara) => {
    let backUrl = ''
    if (this.props.params.waresId) {
      backUrl = escape(`&waresId=${this.props.params.waresId}`)
    } else if (searchPara.openId && searchPara.pickupNo) {
      backUrl = escape(`&openId=${searchPara.openId}&pickupNo=${searchPara.pickupNo}`)
    }
    return backUrl
  }

  // 跳转页面
  gotoPage = (searchPara) => {
    if (searchPara.waresId) {
      hashHistory.push(`/pay?clientId=${searchPara.clientId}&waresId=${searchPara.waresId}`)
    } else if (searchPara.openId && searchPara.pickupNo) {
      hashHistory.push(`/getshare/${searchPara.openId}/${searchPara.pickupNo}?clientId=${searchPara.clientId}`)
    }
  }
     // 判断是否为微信

  tabBarClick = (txt) => {
    if (!txt) {
      this.setState({selectedTab: 'mall'})
    } else {
      this.setState({selectedTab: txt})
    }
    
    hashHistory.push(txt + this.props.location.search)
  }
  
  componentDidMount() {
    $(this.refs.childArea).height($(window.document).height() - 100)
    let chosenProducts = localStorage.getItem('cartproducts')
    if (chosenProducts) {
      this.setState({cartCount: JSON.parse(chosenProducts).length})
    }
  }



  render() {
      if (!this.state.canLoad) {
         return (<div></div>)
      }
      return (
        <div>
        <div ref="childArea" className="childArea">{this.props.children}</div>
           <div className="globalTabBar">
           
        <TabBar
          unselectedTintColor="#949494"
          tintColor="#33A3F4"
          barTintColor="white"
          noRenderContent={true}
        >
          <TabBar.Item
            title="商城"
            key="mall"
            icon={<div style={{
              width: '44px',
              height: '44px',
              background: `url(${require('ASSET/img/wechat/mall.png')}) center center /  44px 44px no-repeat` }}
            />
            }
            selectedIcon={<div style={{
              width: '44px',
              height: '44px',
              background: `url(${require('ASSET/img/wechat/mall.png')}) center center /  44px 44px no-repeat` }}
            />
            }
            selected={this.state.selectedTab === 'mall'}
            onPress={this.tabBarClick.bind(this, '')}
            data-seed="logId"
          >
          
          </TabBar.Item>
          <TabBar.Item
            icon={
              <div style={{
                width: '44px',
                height: '44px',
                background: `url(${require('ASSET/img/wechat/cart.png')}) center center /  44px 44px no-repeat` }}
              />
            }
            selectedIcon={
              <div style={{
                width: '44px',
                height: '44px',
                background: `url(${require('ASSET/img/wechat/cart.png')}) center center /  44px 44px no-repeat` }}
              />
            }
            title="购物车"
            key="cart"
            badge={this.state.cartCount}
            selected={this.state.selectedTab === 'cart'}
            onPress={this.tabBarClick.bind(this, 'cart')}
            data-seed="logId1"
          >
          </TabBar.Item>
          <TabBar.Item
            icon={
              <div style={{
                width: '44px',
                height: '44px',
                background: `url(${require('ASSET/img/wechat/gift.png')}) center center /  44px 44px no-repeat` }}
              />
            }
            selectedIcon={
              <div style={{
                width: '44px',
                height: '44px',
                background: `url(${require('ASSET/img/wechat/gift.png')}) center center /  44px 44px no-repeat` }}
              />
            }
            title="活动"
            key="activity"
            selected={this.state.selectedTab === 'activity'}
            onPress={this.tabBarClick.bind(this, 'activity')}
          >
          </TabBar.Item>
          <TabBar.Item
          icon={
            <div style={{
              width: '44px',
              height: '44px',
              background: `url(${require('ASSET/img/wechat/my.png')}) center center /  44px 44px no-repeat` }}
            />
          }
          selectedIcon={
            <div style={{
              width: '44px',
              height: '44px',
              background: `url(${require('ASSET/img/wechat/my.png')}) center center /  44px 44px no-repeat` }}
            />
          }
            title="我的"
            key="my"
            selected={this.state.selectedTab === 'my'}
            onPress={this.tabBarClick.bind(this, 'my')}
          >
          </TabBar.Item>
        </TabBar>
      </div>
      </div>
        )
 }
  
}

export default WechatFrame
