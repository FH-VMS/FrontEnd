import { Modal, Form, Input, Select, Radio } from 'antd'
// import model from 'STORE/model'
import React from 'react'
const FormItem = Form.Item
const RadioGroup = Radio.Group

const CustomerDialog = Form.create({
  mapPropsToFields(props) {
    return {
       ClientName: {
        ...props.ClientName,
        value: props.ClientName
      },
      ClientStatus: {
        ...props.ClientStatus,
        value: props.ClientStatus
      },
      ClientType: {
        ...props.ClientType,
        value: props.ClientType
      },
      ClientContect: {
         ...props.ClientContect,
        value: props.ClientContect
      },
      ClientTel: {
         ...props.ClientTel,
        value: props.ClientTel
      },
      ClientEmail: {
         ...props.ClientEmail,
        value: props.ClientEmail
      },
      ClientCountry: {
         ...props.ClientCountry,
        value: props.ClientCountry
      },
      ClientCurrency: {
         ...props.ClientCurrency,
        value: props.ClientCurrency
      },
      ClientAddress: {
         ...props.ClientAddress,
        value: props.ClientAddress
      }
    }
  }
})(
  (props) => {
    const { visible, onCancel, onCreate, form, title, okText } = props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }
    // let userModel = model.User.UserModel
    return (
      <Modal
        visible={visible}
        title={title}
        okText={okText}
        onCancel={onCancel}
        onOk={onCreate}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="名称："
          hasFeedback
        >
          {getFieldDecorator('ClientName', {
            rules: [{
              required: true, message: '名称不能为空'
            }]
          })(
            <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="状态："
          hasFeedback
        >
          {getFieldDecorator('ClientStatus', {
            rules: [{
              required: true, message: '状态必选'
            }]
          })(
             <RadioGroup>
                    <Radio value='可用'><span>可用</span></Radio>
                    <Radio value='禁用'><span>禁用</span></Radio>
                </RadioGroup>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="类别："
          hasFeedback
        >
          {getFieldDecorator('ClientType', {
            rules: [{
              required: false
            }]
          })(
            <Select>
               <Option value="运营商">运营商</Option>
               <Option value="点位提供商">点位提供商</Option>
            </Select>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="联系人："
          hasFeedback
        >
          {getFieldDecorator('ClientContect', {
            rules: [{
              required: true, message: '填写联系人'
            }]
          })(
             <Input />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="联系电话："
          hasFeedback
        >
          {getFieldDecorator('ClientTel', {
            rules: [{
              required: true, message: '填写联系电话'
            }]
          })(
             <Input />
          )}
        </FormItem>
           <FormItem
          {...formItemLayout}
          label="邮箱："
          hasFeedback
        >
          {getFieldDecorator('ClientEmail', {
            rules: [{
              type: 'email', message: '无效邮箱'
            }, {
              required: false
            }]
          })(
            <Input />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="国家："
          hasFeedback
        >
          {getFieldDecorator('ClientCountry', {
            rules: [{
              required: false
            }]
          })(
             <Input />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="货币："
          hasFeedback
        >
          {getFieldDecorator('ClientCurrency', {
            rules: [{
              required: false
            }]
          })(
              <Select>
               <Option value="人民币">人民币</Option>
            </Select>
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="客户地址："
          hasFeedback
        >
          {getFieldDecorator('ClientAddress', {
            rules: [{
              required: false
            }]
          })(
             <Input />
          )}
        </FormItem>
        </Form>
      </Modal>
    )
  }
)

export default CustomerDialog
