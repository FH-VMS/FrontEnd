import React, {Component} from 'react'
import{List, InputItem, Button, Toast} from 'antd-mobile'
import Utility from 'UTIL/utility'
import {hashHistory} from 'react-router'

const Item = List.Item

import login from 'ACTION/Admin/common/loginAction'
import { bindActionCreators } from 'redux'
import {connect} from 'react-redux'


const mapDispatchToProps = (dispatch) => ({
  login: bindActionCreators(login, dispatch)
})

@connect(
	({ login, loginData }) => ({ login, loginData }),
	mapDispatchToProps
)

class H5Login extends Component {
	constructor(props) {
		super(props)
    this.state = {
      account: '',
      password: ''
    }
	}

  componentWillMount() {
    Utility.Cookie.clear('UserInfo')
  }

  login = (e) => {
    if (!this.state.account) {
      Toast.fail('用户名不能为空', 1)
      return
    } else if (!this.state.password) {
      Toast.fail('密码不能为空', 1)
      return
    }
    // console.log('ooooooooooooo', arguments)
    Toast.loading('登录...', 10)
    e.preventDefault()
      this.setState({loading: true})
      Utility.Cookie.clear('UserInfo')
      this.props.login.login({userInfo: {UserAccount: this.state.account, UserPassword: this.state.password}}).then(msg => {
         
          let userInfo = this.props.loginData
          if (userInfo && userInfo.Id != '' && this.props.loginData.Id != null) {
             Utility.Cookie.setValue('UserInfo', {UserAccount: userInfo.UserAccount, UserAccessId: userInfo.UserAccessId, UserClientId: userInfo.UserClientId, Sts: userInfo.Sts})
             hashHistory.push({ pathname: 'h5main'})
             Toast.hide()
           
          } else {
            Toast.hide()
            Toast.fail('用户名或密码错误', 1)
          }
          this.setState({loading: false})
          
      })
      return
     
  }

  render() {

      return (
        <div className="h5loginContainer">
           <List renderHeader={() => <div className="loginHeader">管理员登录</div>}>
            <InputItem
            clear
            placeholder="请输入账号"
            value={this.state.account}
            onChange={(val)=>{
              this.setState({account: val})
            }}
            >登录名</InputItem>
            <InputItem 
            placeholder="请输入密码" 
            type="password" 
            value={this.state.password}
            onChange={(val)=>{
              this.setState({password: val})
            }}
            >
            密码
            </InputItem>
        
            <Item>
            <Button type="primary" style={{width: '100%'}} inline onClick={this.login.bind(this)}>登录</Button>
            </Item>
        </List>
        </div>
        )
 }
  
}

export default H5Login
