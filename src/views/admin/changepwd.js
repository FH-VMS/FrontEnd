import React, {Component} from 'react'
import { Form, Icon, Input, Button, Spin, message } from 'antd'
import Utility from 'UTIL/utility'
const FormItem = Form.Item

const ChangePasswordForm = Form.create()(class ChangePasswordInput extends Component {
     constructor(props) {
       super(props)
       this.state = {
            loading: false
        }
     }
     
     changePwd = (e) => {
         e.preventDefault()
       this.props.form.validateFields((err, values) => {
      
     
            if (err) {
                return
            }
            let userInfoCookie = Utility.Cookie.getValue('UserInfo')
            this.props.login({userInfo: {UserAccount: userInfoCookie.UserAccount, UserPassword: values.oldPassword}}).then(msg => {
                
                if (this.props.userdata && this.props.userdata.Id != '' && this.props.userdata.Id != null) {
                  
                    // hashHistory.push({ pathname: rootRouter.admin.path})
                    // location.href = 'index.html'
                    this.props.changePassword({userInfo: {Id: this.props.userdata.Id, UserPassword: values.confirm}}).then(msg => {
                        if (msg) {
                             message.success('修改成功')
                             location.href = 'login.html'
                        } else {
                            message.warning('修改失败')
                        }
                    })
                } else {
                    
                }
                this.props.form.resetFields()
                this.setState({loading: false})
                
            })
            return
            
        })
     }

     checkConfirm = (rule, value, callback) => {
        const form = this.props.form
        if (value && this.state.confirmDirty) {
        form.validateFields(['confirm'], { force: true })
        }
        callback()
    }

    checkPassword = (rule, value, callback) => {
        const form = this.props.form
        if (value && value !== form.getFieldValue('password')) {
        callback('两次密码不一致!')
        } else {
        callback()
        }
    }

     

     render() {
        const { getFieldDecorator } = this.props.form
        const formItemLayout = {
            labelCol: {
                xs: { span: 24 },
                sm: { span: 6 }
            },
            wrapperCol: {
                xs: { span: 24 },
                sm: { span: 14 }
            }
        }

        const tailFormItemLayout = {
            wrapperCol: {
                xs: {
                span: 24,
                offset: 0
                },
                sm: {
                span: 14,
                offset: 6
                }
            }
         }

        return (
            <Spin size="large" spinning={this.state.loading}>
          <Form onSubmit={this.changePwd} className="login-form">
            <FormItem style={{ paddingBottom: 20 }} {...formItemLayout} label="原密码：">
              {getFieldDecorator('oldPassword', {
                rules: [{ required: true, message: '原密码不能为空' }]
              })(
                <Input addonBefore={<Icon type="lock" />} type="password" placeholder="原密码" autocomplete="off" />
              )}
            </FormItem>
             <FormItem style={{ paddingBottom: 20 }} {...formItemLayout} label="新密码：">
              {getFieldDecorator('password', {
                rules: [{ required: true, message: '新密码不能为空' }, {
                    validator: this.checkConfirm
                }]
              })(
                <Input addonBefore={<Icon type="lock" />} type="password" placeholder="新密码" autocomplete="off" />
              )}
            </FormItem>
             <FormItem style={{ paddingBottom: 20 }} {...formItemLayout} label="确认密码：">
              {getFieldDecorator('confirm', {
                rules: [{ required: true, message: '确认密码不能为空' }, {
              validator: this.checkPassword
            }]
              })(
                <Input addonBefore={<Icon type="lock" />} type="password" placeholder="确认密码" autocomplete="off" />
              )}
            </FormItem>
            <FormItem {...tailFormItemLayout}>
              <Button type="primary" style={{width: '60%'}} htmlType="submit" className="login-form-button">
                修改
              </Button>
            </FormItem>
          </Form>
          </Spin>
        )
     }
   
  
})

export default ChangePasswordForm
