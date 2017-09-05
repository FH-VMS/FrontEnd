import { Modal, Form, Input, Checkbox, Card } from 'antd'
// import model from 'STORE/model'
import React, {Component} from 'react'
const FormItem = Form.Item
const CheckboxGroup = Checkbox.Group

const PayConfigDialog = Form.create({
  mapPropsToFields(props) {
    return {
       TypeName: {
        ...props.Name,
        value: props.Name
      },
      ClientList: {
        ...props.ClientList,
        value: props.ClientList
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
        
    }

    render() {
    const { visible, onCancel, onCreate, form} = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 8 },
      wrapperCol: { span: 12 }
    }

    // let userModel = model.User.UserModel
    return (
      <Modal
        visible={visible}
        onCancel={onCancel}
        onOk={onCreate}
      >
        <Form horizontal>
         
         <Card title="基础配置" extra={<a href="#">More</a>}>
               <FormItem
                  {...formItemLayout}
                  label="名称："
                  hasFeedback
                >
                  {getFieldDecorator('Name', {
                    rules: [{
                      required: true, message: '名称不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
          </Card>
          <Card title="支付宝配置" style={{marginTop: '10px'}} extra={<a href="#">More</a>}>
               <FormItem
                  {...formItemLayout}
                  label="合作伙伴号(partner id)："
                  hasFeedback
                >
                  {getFieldDecorator('AliParter', {
                    rules: [{
                      required: true, message: 'partner id不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
          </Card>
          <Card title="微信配置" style={{marginTop: '10px'}} extra={<a href="#">More</a>}>
                <FormItem
                  {...formItemLayout}
                  label="应用ID(app id)："
                  hasFeedback
                >
                  {getFieldDecorator('WxAppId', {
                    rules: [{
                      required: true, message: 'app id不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
          </Card>
          <Card title="支付授权" style={{marginTop: '10px'}} extra={<a href="#">More</a>}>
                 <FormItem
                >
                  {getFieldDecorator('ClientList', {
                    rules: [{
                      required: false
                    }]
                  })(
                     <CheckboxGroup />
                  )}
                </FormItem>
          </Card>
        
        </Form>
      </Modal>
    )
    }
  }
)

export default PayConfigDialog
