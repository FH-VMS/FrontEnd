import { Modal, Form, Input, Card, TreeSelect, Select, InputNumber } from 'antd'
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
      PayConfigId: {
        ...props.PayConfigId,
        value: props.PayConfigId
      },
      UserOpenid: {
        ...props.UserOpenid,
        value: props.UserOpenid
      },
      WxUserName: {
        ...props.WxUserName,
        value: props.WxUserName
      },
      AliAccount: {
        ...props.AliAccount,
        value: props.AliAccount
      },
      AliUserName: {
        ...props.AliUserName,
        value: props.AliUserName
      },
      WxRate: {
        ...props.WxRate,
        value: props.WxRate
      },
      AliRate: {
        ...props.AliRate,
        value: props.AliRate
      },
      ClientId: {
        ...props.ClientId,
        value: props.ClientId == 'self' ? 'self' : props.ClientId
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
          value: 'self'
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
                      required: true, message: '所属客户必选'
                    }]
                  })(
                    <TreeSelect
                        dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
                        treeData={this.props.clientDicData}
                        treeDefaultExpandAll
                        showSearch
                        filterTreeNode={this.filterClient}
                      />
                  )}
                </FormItem>
                <FormItem
                {...formItemLayout}
                label="分账账户："
                hasFeedback
              >
                {getFieldDecorator('PayConfigId', {
                  rules: [{
                    required: true, message: '分账账户必选'
                  }]
                })(
                   <Select>
                    {
                      this.props.accountDicData.map((item, index) => {
                        return <Option value={item.Id}>{item.Name}</Option>
                      })
                    }
                  </Select>
                )}
              </FormItem>
          </Card>
          <Card title="支付宝配置" style={{marginTop: '10px'}}>
               <FormItem
                  {...formItemLayout}
                  label="支付宝账户："
                  hasFeedback
                >
                  {getFieldDecorator('AliAccount', {
                    rules: [{
                      required: true, message: '支付宝账户不能为空'
                    }]
                  })(
                    <Input placeholder="支付宝注册邮箱或手机号"/>
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="真实姓名："
                  hasFeedback
                >
                  {getFieldDecorator('AliUserName', {
                    rules: [{
                      required: true, message: '真实姓名不能为空'
                    }]
                  })(
                    <Input placeholder="支付宝用户真实姓名"/>
                  )}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label="费率(不包含支付宝收取)："
                  hasFeedback
                >
                  {getFieldDecorator('AliRate', {
                    rules: [{
                      required: false
                    }]
                  })(
                    <InputNumber placeholder="0到1之间" min={0} max={1} defaultValue={0} precision={4} />
                  )}
                </FormItem>
          </Card>
          <Card title="微信配置" style={{marginTop: '10px'}}>
                <FormItem
                {...formItemLayout}
                label="微信账户(二维码生成)："
                hasFeedback
                >
                {getFieldDecorator('UserOpenid', {
                    rules: [{
                    required: false
                    }]
                })(
                    <label></label>
                )}
                </FormItem>
                <FormItem
                {...formItemLayout}
                label="真实姓名："
                hasFeedback
                >
                {getFieldDecorator('WxUserName', {
                    rules: [{
                    required: true, message: '真实姓名不能为空'
                    }]
                })(
                    <Input placeholder="微信用户真实姓名"/>
                )}
                </FormItem>
                <FormItem
                {...formItemLayout}
                label="费率(不包含微信收取)："
                hasFeedback
                >
                {getFieldDecorator('WxRate', {
                    rules: [{
                    required: false
                    }]
                })(
                    <InputNumber placeholder="0到1之间" min={0} max={1} defaultValue={0} precision={4} />
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
