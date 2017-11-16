import { Modal, Form, Input, Card } from 'antd'
// import model from 'STORE/model'
import React, {Component} from 'react'
const FormItem = Form.Item

const PayConfigDialog = Form.create({
  mapPropsToFields(props) {
    return {
       Name: {
        ...props.Name,
        value: props.Name
      },
      AliParter: {
        ...props.AliParter,
        value: props.AliParter
      },
      AliKey: {
        ...props.AliKey,
        value: props.AliKey
      },
      AliRefundAppId: {
        ...props.AliRefundAppId,
        value: props.AliRefundAppId
      },
      AliRefundRsaSign: {
        ...props.AliRefundRsaSign,
        value: props.AliRefundRsaSign
      },
      AliPublicKey: {
        ...props.AliPublicKey,
        value: props.AliPublicKey
      },
      AliAppId: {
        ...props.AliAppId,
        value: props.AliAppId
      },
      WxAppId: {
        ...props.WxAppId,
        value: props.WxAppId
      },
      WxMchId: {
        ...props.WxMchId,
        value: props.WxMchId
      },
      WxKey: {
        ...props.WxKey,
        value: props.WxKey
      },
      WxAppSecret: {
        ...props.WxAppSecret,
        value: props.WxAppSecret
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
        maskClosable={false}
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
                  label="合作者(parter id)："
                  hasFeedback
                >
                  {getFieldDecorator('AliParter', {
                    rules: [{
                      required: true, message: 'parter id不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="应用号(app id)："
                  hasFeedback
                >
                  {getFieldDecorator('AliAppId', {
                    rules: [{
                      required: true, message: 'app id不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="rsa私钥："
                  hasFeedback
                >
                  {getFieldDecorator('AliKey', {
                    rules: [{
                      required: true, message: 'rsa私钥不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="rsa公钥："
                  hasFeedback
                >
                  {getFieldDecorator('AliPublicKey', {
                    rules: [{
                      required: true, message: 'rsa公钥不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="退款应用ID："
                  hasFeedback
                >
                  {getFieldDecorator('AliRefundAppId', {
                    rules: [{
                      required: true, message: 'refund app id不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
                 <FormItem
                  {...formItemLayout}
                  label="退款RSA2签名："
                  hasFeedback
                >
                  {getFieldDecorator('AliRefundRsaSign', {
                    rules: [{
                      required: true, message: 'refund rsa sign不能为空'
                    }]
                  })(
                    <textarea style={{width: '100%'}}></textarea>
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
                <FormItem
                  {...formItemLayout}
                  label="商户号(mch id)："
                  hasFeedback
                >
                  {getFieldDecorator('WxMchId', {
                    rules: [{
                      required: true, message: 'mch id不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="商户支付密钥(key)："
                  hasFeedback
                >
                  {getFieldDecorator('WxKey', {
                    rules: [{
                      required: true, message: 'key不能为空'
                    }]
                  })(
                    <Input />
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="公众帐号(app secert)："
                  hasFeedback
                >
                  {getFieldDecorator('WxAppSecret', {
                    rules: [{
                      required: true, message: 'app secert不能为空'
                    }]
                  })(
                    <Input />
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
