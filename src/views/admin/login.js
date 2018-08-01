import React, {Component} from 'react'
import LoginInput from 'COMPONENT/admin/common/loginInput'
import Utility from 'UTIL/utility'

// import rootRouter from 'ROUTE/index'
// import {hashHistory} from 'react-router'

import login from 'ACTION/Admin/common/loginAction'
import { bindActionCreators } from 'redux'
import {connect} from 'react-redux'

import 'ASSET/less/fh-login.less'

const mapDispatchToProps = (dispatch) => ({
  login: bindActionCreators(login, dispatch)
})

@connect(
	({ login, loginData }) => ({ login, loginData }),
	mapDispatchToProps
)

class Frame extends Component {
	constructor(props) {
		super(props)
        this.state = {
            loading: false
        }
	}

  componentWillMount() {
    Utility.Cookie.clear('UserInfo')
    sessionStorage.removeItem('chosenMenuVal')
    sessionStorage.removeItem('Clients')
    sessionStorage.removeItem('DisplayClient')
  }

  login = (e) => {
    // console.log('ooooooooooooo', arguments)
    e.preventDefault()
    const form = this.form
    form.validateFields((err, values) => {
      
      if (err) {
        return
      }
      this.setState({loading: true})
      Utility.Cookie.clear('UserInfo')
      this.props.login.login({userInfo: values}).then(msg => {
         
          let userInfo = this.props.loginData
          if (userInfo && userInfo.Id != '' && this.props.loginData.Id != null) {
             Utility.Cookie.setValue('UserInfo', {UserAccount: userInfo.UserAccount, UserAccessId: userInfo.UserAccessId, UserClientId: userInfo.UserClientId, Sts: userInfo.Sts, OriginClientId: userInfo.UserClientId})
             // hashHistory.push({ pathname: rootRouter.admin.path})
             location.href = 'index.html'
          } else {
            
          }
           // form.resetFields()
          this.setState({loading: false})
          
      })
      return
     
    })
  }

  saveFormRef = (form) => {
        this.form = form
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
        
           <div>
            <div className='loginContainer'>
               <img src={require('ASSET/img/admin/slogan.png')} />
              
            <LoginInput loading={this.state.loading} login={this.props.login} ref={this.saveFormRef} login={this.login}/>
          
            <div className='rdCodeArea'>
               <p><img src={require('ASSET/img/admin/rdCode.png')} /></p>
               <p>关注我们 关注美好生活</p>
               <p>那些路 那些人 那些正在发生的...</p>
            </div>
            </div>
            <div className="loginFooter"><span>© 2017 FY-CN.TOP</span><span>ALL RIGHT RESERVED | 版权所有</span><span>沪ICP备17017062号-1</span></div>
            </div>
            
        )
 }
  
}

export default Frame
