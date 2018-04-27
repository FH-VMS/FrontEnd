import React, {Component} from 'react'
import {TabBar} from 'antd-mobile'
import {hashHistory} from 'react-router'
// import {handleUrlParams} from 'UTIL/mobileUtility'
import 'ASSET/less/wechat.less'


import wechat from 'ACTION/wechat/common/wechatAction'
import { bindActionCreators } from 'redux'
import {connect} from 'react-redux'


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
           canLoad: true
        }
	}

  componentWillMount() {
    /*
    Toast.loading('加载中')
    let searchPara = handleUrlParams(window.location.href.split('?')[1])
    if (!searchPara.clientId) {
        hashHistory.push('notservice')
        return
    }
    
    if (!sessionStorage.getItem('wechatInfo')) {
        if (location.href.split('?').length > 2) {
          let reallyUrlArr = location.href.split('#')[0].split('?')
          location.href = reallyUrlArr[0] + '#/?' + reallyUrlArr[1]
          return
        }
    
        if (this.isWeiXin()) {
          
          if (!searchPara.code) {
              searchPara.code = '-1'
          }
          this.props.wechat.fetchWechatAuth({m: searchPara.clientId, code: searchPara.code}).then(msg => {
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
    */
  }

     // 判断是否为微信

  isWeiXin =() =>{
      
      var ua = window.navigator.userAgent.toLowerCase()
      
      if (ua.match(/MicroMessenger/i) == 'micromessenger') {
          return true
      } else {
          return false
      }
  }

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
              background: 'url(https://zos.alipayobjects.com/rmsportal/sifuoDUQdAFKAVcFGROC.svg) center center /  44px 44px no-repeat' }}
            />
            }
            selectedIcon={<div style={{
              width: '44px',
              height: '44px',
              background: 'url(https://zos.alipayobjects.com/rmsportal/iSrlOTqrKddqbOmlvUfq.svg) center center /  44px 44px no-repeat' }}
            />
            }
            selected={this.state.selectedTab === 'mall'}
            badge={1}
            onPress={this.tabBarClick.bind(this, '')}
            data-seed="logId"
          >
          
          </TabBar.Item>
          <TabBar.Item
            icon={
              <div style={{
                width: '44px',
                height: '44px',
                background: 'url(https://gw.alipayobjects.com/zos/rmsportal/BTSsmHkPsQSPTktcXyTV.svg) center center /  44px 44px no-repeat' }}
              />
            }
            selectedIcon={
              <div style={{
                width: '44px',
                height: '44px',
                background: 'url(https://gw.alipayobjects.com/zos/rmsportal/ekLecvKBnRazVLXbWOnE.svg) center center /  44px 44px no-repeat' }}
              />
            }
            title="购物车"
            key="cart"
            badge={1}
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
                background: 'url(https://zos.alipayobjects.com/rmsportal/psUFoAMjkCcjqtUCNPxB.svg) center center /  44px 44px no-repeat' }}
              />
            }
            selectedIcon={
              <div style={{
                width: '44px',
                height: '44px',
                background: 'url(https://zos.alipayobjects.com/rmsportal/IIRLrXXrFAhXVdhMWgUI.svg) center center /  44px 44px no-repeat' }}
              />
            }
            title="活动"
            key="activity"
            dot
            selected={this.state.selectedTab === 'activity'}
            onPress={this.tabBarClick.bind(this, 'activity')}
          >
          </TabBar.Item>
          <TabBar.Item
            icon={{ uri: 'https://zos.alipayobjects.com/rmsportal/asJMfBrNqpMMlVpeInPQ.svg' }}
            selectedIcon={{ uri: 'https://zos.alipayobjects.com/rmsportal/gjpzzcrPMkhfEqgbYvmN.svg' }}
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
