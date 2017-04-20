import React, {Component} from 'react'
import LoginInput from 'COMPONENT/admin/common/loginInput'
import { Spin } from 'antd'
import Utility from 'UTIL/utility'

import rootRouter from 'ROUTE/index'
import {hashHistory} from 'react-router'

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
   
  }

  login = (values) => {
   
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
            console.log('login')
             Utility.Cookie.setValue('UserInfo', {UserAccount: userInfo.UserAccount, UserAccessId: userInfo.UserAccessId, UserClientId: userInfo.UserClientId, Sts: userInfo.Sts})
             hashHistory.push({ pathname: rootRouter.admin.path})
          } else {
            
          }
           form.resetFields()
          this.setState({loading: false})
          
      })
      
     
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
           <Spin size="large" spinning={this.state.loading}>
            <div className='loginContainer'>
            <LoginInput login={this.props.login} ref={this.saveFormRef} login={this.login}/>
            </div>
           </Spin>
        )
 }
  
}

export default Frame
