import React, {Component} from 'react'
import {TabBar} from 'antd-mobile'
import {hashHistory} from 'react-router'
import 'ASSET/less/wechat.less'

class WechatFrame extends Component {
	constructor(props) {
        super(props)
        this.state = {
           selectedTab: 'mall'
        }
	}

  componentWillMount() {
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
