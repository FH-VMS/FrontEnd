import React, {Component} from 'react'
import { Form, Icon, Input, Button, Spin } from 'antd'
const FormItem = Form.Item

const NormalLoginForm = Form.create()(class NormalLoginInput extends Component {
     constructor(props) {
       super(props)
     }
     
     

     render() {
        const { login, form } = this.props
        const { getFieldDecorator } = form
        
        return (
          <Form onSubmit={login} className="login-form">
            <Spin size="large" spinning={this.props.loading}>
            <FormItem style={{ paddingBottom: 10 }}>
              {getFieldDecorator('UserAccount', {
                rules: [{ required: true, message: '用户名不能为空!' }]
              })(
                <Input addonBefore={<Icon type="user" />} style={{width: '100%'}} placeholder="用户名" autocomplete="off" />
              )}
            </FormItem>
            <FormItem style={{ paddingBottom: 10 }}>
              {getFieldDecorator('UserPassword', {
                rules: [{ required: true, message: '密码不能为空' }]
              })(
                <Input addonBefore={<Icon type="lock" />} style={{width: '100%'}} type="password" placeholder="密码" autocomplete="off" />
              )}
            </FormItem>
            <FormItem>
              <Button type="primary" style={{width: '100%'}} htmlType="submit" className="login-form-button">
                登录
              </Button>
            </FormItem>
              </Spin>
          </Form>
        )
     }
   
  
})

export default NormalLoginForm
