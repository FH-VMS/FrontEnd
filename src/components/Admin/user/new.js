import { Modal, Form, Input, Select, TreeSelect } from 'antd'
// import model from 'STORE/model'
import React, {Component} from 'react'
const FormItem = Form.Item

const Dialog = Form.create({
  mapPropsToFields(props) {
    return {
       UserAccount: {
        ...props.UserAccount,
        value: props.UserAccount
      },
      UserName: {
        ...props.UserName,
        value: props.UserName
      },
      UserAccessId: {
         ...props.UserAccessId,
        value: props.UserAccessId
      },
      UserClientId: {
         ...props.UserClientId,
        value: props.UserClientId
      },
      Remark: {
         ...props.Remark,
        value: props.Remark
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
      this.authTemplage = []
    }
    
    getAuthTemplate(data) {
      if (data) {
        this.authTemplage = data.map((item, index) => {
          return (
            <Option value={item.Id}>{item.Name}</Option>
          )
        })
      }
       
    }

    filterClient = (inputValue, treeNode) => {
      return treeNode.props.title.toLowerCase().indexOf(inputValue.toLowerCase()) >= 0
  }

    render() {

    
    const { visible, onCancel, onCreate, form, title, authData, clientDicData } = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }

    this.getAuthTemplate(authData)
    // let userModel = model.User.UserModel
    return (
      <Modal
        visible={visible}
        title={title}
        onCancel={onCancel}
        onOk={onCreate}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="用户名："
          hasFeedback
        >
          {getFieldDecorator('UserAccount', {
            rules: [{
              required: true, message: '用户名不能为空'
            }]
          })(
            <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="真实姓名："
          hasFeedback
        >
          {getFieldDecorator('UserName', {
            rules: [{
              required: false
            }]
          })(
            <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="权限："
          hasFeedback
        >
          {getFieldDecorator('UserAccessId', {
            rules: [{
              required: true, message: '权限必选'
            }]
          })(
             <Select placeholder="选择对应权限模板">
               {this.authTemplage}
            </Select>
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="所属客户："
          hasFeedback
        >
          {getFieldDecorator('UserClientId', {
            rules: [{
              required: true, message: '所属客户必选'
            }]
          })(
             <TreeSelect
              dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
              treeData={clientDicData}
              treeDefaultExpandAll
              showSearch
              filterTreeNode={this.filterClient}
            />
          )}
        </FormItem>
          <FormItem
          {...formItemLayout}
          label="备注："
          hasFeedback
        >
          {getFieldDecorator('Remark', {
            rules: [{
              required: false
            }]
          })(
            <Input type='textarea' />
          )}
        </FormItem>
        
        </Form>
      </Modal>
    )
    }
  }
)

export default Dialog
