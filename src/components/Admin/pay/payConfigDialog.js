import { Modal, Form, Input, Card, TreeSelect } from 'antd'
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
      AliPrivateKey: {
        ...props.AliPrivateKey,
        value: props.AliPrivateKey
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
      },
      WxTxtKey: {
        ...props.WxTxtKey,
        value: props.WxTxtKey
      },
      ClientId: {
        ...props.ClientId,
        value: props.ClientId == 'self' ? '' : props.ClientId
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
        
    }

    componentDidMount() {
      
    }

    filterClient = (inputValue, treeNode) => {
      return treeNode.props.title.toLowerCase().indexOf(inputValue.toLowerCase()) >= 0
   }


    render() {
    const { visible, onCancel, onCreate, form} = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 8 },
      wrapperCol: { span: 13 }
    }

    if (this.props.clientDicData instanceof Array) {
         if (this.props.clientDicData[0] && this.props.clientDicData[0].key == 'aaaa') {
           return
         }
        this.props.clientDicData.unshift({
          key: 'aaa',
          label: '自己',
          value: ''
        })
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
         
         <Card title="基础配置">
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
                <FormItem
                  {...formItemLayout}
                  label="所属客户："
                  hasFeedback
                >
                  {getFieldDecorator('ClientId', {
                    rules: [{
                      required: false
                    }]
                  })(
                    <TreeSelect
                        dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
                        treeData={this.props.clientDicData}
                        treeDefaultExpandAll
                        showSearch
                        filterTreeNode={this.filterClient}
                        onSelect={this.clientChanged}
                      />
                  )}
                </FormItem>
          </Card>
          <Card title="支付宝配置" style={{marginTop: '10px'}}>
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
                  label="MD5："
                  hasFeedback
                >
                  {getFieldDecorator('AliKey', {
                    rules: [{
                      required: true, message: 'MD5不能为空'
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
                    <textarea style={{width: '100%'}}></textarea>
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="rsa私钥："
                  hasFeedback
                >
                  {getFieldDecorator('AliPrivateKey', {
                    rules: [{
                      required: true, message: 'rsa私钥不能为空'
                    }]
                  })(
                    <textarea style={{width: '100%'}}></textarea>
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
          </Card>
          <Card title="微信配置" style={{marginTop: '10px'}}>
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
                <FormItem
                {...formItemLayout}
                label="文本内容(txt key)："
                hasFeedback
              >
                {getFieldDecorator('WxTxtKey', {
                  rules: [{
                    required: false
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
