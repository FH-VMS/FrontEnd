import React from 'react'
import { Form, Icon, Input, Button } from 'antd'
const FormItem = Form.Item

const NormalLoginForm = Form.create()((props) => {
  

    const { login, form } = props
    const { getFieldDecorator } = form
    
    return (
      <Form onSubmit={login} className="login-form">
        <FormItem style={{ paddingBottom: 20 }}>
          {getFieldDecorator('UserAccount', {
            rules: [{ required: true, message: '用户名不能为空!' }]
          })(
            <Input addonBefore={<Icon type="user" />} placeholder="用户名" />
          )}
        </FormItem>
        <FormItem style={{ paddingBottom: 20 }}>
          {getFieldDecorator('UserPassword', {
            rules: [{ required: true, message: '密码不能为空' }]
          })(
            <Input addonBefore={<Icon type="lock" />} type="password" placeholder="密码" />
          )}
        </FormItem>
         <FormItem>
          <Button type="primary" style={{width: '100%'}} htmlType="submit" className="login-form-button">
            登录
          </Button>
        </FormItem>
      </Form>
    )
  
})

export default NormalLoginForm
