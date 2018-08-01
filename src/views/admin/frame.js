import React, {Component} from 'react'
import SlideNav from 'COMPONENT/admin/common/slideNav'
import {message, Tooltip, Popover, Tree} from 'antd'
// import {Icon, Layout} from 'antd'
// import rootRouter from 'ROUTE/index'
 // import {hashHistory} from 'react-router'
 import Utility from 'UTIL/utility'

import common from 'ACTION/Admin/common/frameAction'
import { bindActionCreators } from 'redux'
import {connect} from 'react-redux'

import 'ASSET/less/fh-admin.less'
const TreeNode = Tree.TreeNode
// const { Header, Sider, Content } = Layout

const mapDispatchToProps = (dispatch) => ({
  common: bindActionCreators(common, dispatch)
})

@connect(
	({ common, commonInfo }) => ({ common, commonInfo }),
	mapDispatchToProps
)

class Frame extends Component {
	constructor(props) {
		super(props)
    this.state = {
      menus: [],
      collapsed: false,
      clientDic: []
    }

	}

  componentWillMount() {
   
    let userInfo = Utility.Cookie.getValue('UserInfo')
   
    this.userInfo = userInfo
    if (userInfo && userInfo.UserAccount) {
      let sessionMenus = sessionStorage.getItem('Menus')
      if (sessionMenus) {
        this.setState({menus: JSON.parse(sessionMenus)})
      } else {
        this.props.common.fetchMenu().then(() => {
            this.setState({menus: this.props.commonInfo.menus})
            sessionStorage.setItem('Menus', JSON.stringify(this.props.commonInfo.menus))
        })
      }

      this.getClients(userInfo.OriginClientId)
    } else {
      // hashHistory.push({ pathname: rootRouter.login.path})
      location.href = 'login.html'
    }
    
  }

  logout = () =>{
     Utility.Cookie.clear('MenuAuth')
    Utility.Cookie.clear('UserInfo')
    sessionStorage.removeItem('Menus')
    sessionStorage.removeItem('Clients')
    sessionStorage.removeItem('DisplayClient')
    // hashHistory.push({ pathname: rootRouter.login.path})
     location.href = 'login.html'
  }

  toggleMenu = () => {
    this.setState({
      collapsed: !this.state.collapsed
    })
  }

  clearLoginCache = () => {
   
    this.props.common.clearLoginCache().then(msg => {
      if (msg) {
        message.success('清除完成')
      } else {
        location.href = 'login.html'
      }
    })
  }

  componentDidMount() {
      
  }

  getClients = (clientId) => {
    if (!sessionStorage.getItem('Clients')) {
        this.props.common.fetchClient({clientId: clientId}).then(msg => {
          if (msg) {
            let dicData = Utility.getTreeClient(msg)
            dicData.unshift({label: '自己', value: this.userInfo.OriginClientId})
            sessionStorage.setItem('Clients', JSON.stringify(dicData))
            this.setState({clientDic: dicData})
          }
        })
    } else {
      this.setState({clientDic: JSON.parse(sessionStorage.getItem('Clients'))})
    }
  }

  swithClient = (val, e) => {
    
    this.userInfo.UserClientId = val[0]
    if (this.userInfo.UserClientId == this.userInfo.OriginClientId) {
      sessionStorage.setItem('DisplayClient', this.userInfo.UserAccount)
    } else {
      sessionStorage.setItem('DisplayClient', e.node.props.title)
    }
    
    Utility.Cookie.setValue('UserInfo', this.userInfo)
    location.reload()
  }

  render() {
    
    const loop = data => data.map((item) => {
        if (item.children && item.children.length) {
          return <TreeNode key={item.value} title={item.label}>{loop(item.children)}</TreeNode>;
        }
        return <TreeNode key={item.value} title={item.label} />;
      })
    /*
      return (
         <div>
            <Header />
            <SlideNav />
            <div className="container">
              { this.props.children }
            </div>
            <footer>456456</footer>
        </div>
      )
      * */
     let displayName = this.userInfo.UserAccount
     if (sessionStorage.getItem('DisplayClient') && sessionStorage.getItem('DisplayClient') != this.userInfo.OriginClientId) {
      displayName = sessionStorage.getItem('DisplayClient')
     }
      return (
        <div className="globalStyle">
           <div className="headerArea">
             <div className="logo">控制中心</div>
            <div className="userArea">
              <Tooltip placement="bottom" title='清除缓存'>
                 <span onClick={this.clearLoginCache.bind(this)}><i className="fa fa-eraser"></i></span>
              </Tooltip>
              <Tooltip placement="bottom" title='退出登录'>
                <span onClick={this.logout}><i className="fa fa-arrow-circle-o-right"></i>
                </span>
              </Tooltip>
              <span><Popover placement="bottom" title={"切换客户"} content={<div style={{maxHeight: '400px', overflowY: 'auto'}}>
                <Tree
                defaultExpandAll
                onSelect={this.swithClient}
              >
                {loop(this.state.clientDic)}
              </Tree></div>} trigger="click"><i className="fa fa-user-circle"></i>{displayName}</Popover></span>
            </div>
           </div>
           <div className="leftMenu">
              <div><SlideNav datasource={this.state.menus} /></div>
           </div>
           <div className="rightArea">
             
             <div id="childrenContainer" className="childrenContainer">
                { this.props.children }
             </div>
             
           </div> 
        </div>
        )
       /*
        return (
   
    <Layout>
      <Sider collapsed={this.state.collapsed} width={200} style={{ overflowY: !this.state.collapsed ? 'auto' : 'inherit', height: '100vh', left: 0 }}>
      <div>控制中心</div>
      <SlideNav collapsed={this.state.collapsed} datasource={this.state.menus} />
      </Sider>
      <Layout>
      <Header style={{height: '50px'}}>
      <Icon onClick={this.toggleMenu} type={this.state.collapsed ? 'menu-unfold' : 'menu-fold'} />
    </Header>
        <Content style={{overflowY: 'auto', height: '94vh', overflowX: 'hidden', backgroundColor: '#dcdedd'}}>
        <div id="childrenContainer" className="childrenContainer">
        { this.props.children }
        </div>
        </Content>
      </Layout>
    </Layout>
        )
        */
 }
  
}

export default Frame
