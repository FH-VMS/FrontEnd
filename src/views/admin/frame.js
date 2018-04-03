import React, {Component} from 'react'
import SlideNav from 'COMPONENT/admin/common/slideNav'
// import {Icon, Layout} from 'antd'
// import rootRouter from 'ROUTE/index'
 // import {hashHistory} from 'react-router'
 import Utility from 'UTIL/utility'

import common from 'ACTION/Admin/common/frameAction'
import { bindActionCreators } from 'redux'
import {connect} from 'react-redux'

import 'ASSET/less/fh-admin.less'

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
      collapsed: false
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

        
    } else {
      // hashHistory.push({ pathname: rootRouter.login.path})
      location.href = 'login.html'
    }
    
  }

  logout = () =>{
     Utility.Cookie.clear('MenuAuth')
    Utility.Cookie.clear('UserInfo')
    sessionStorage.removeItem('Menus')
    // hashHistory.push({ pathname: rootRouter.login.path})
     location.href = 'login.html'
  }

  toggleMenu = () => {
    this.setState({
      collapsed: !this.state.collapsed
    })
  }



  render() {

    
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
     
      return (
        <div className="globalStyle">
           <div className="headerArea">
             <div className="logo">控制中心</div>
            <div className="userArea">
              <span><i className="fa fa-user-circle"></i>{this.userInfo.UserAccount}</span>
              <span onClick={this.logout}><i className="fa fa-arrow-circle-o-right"></i>退出</span>
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
