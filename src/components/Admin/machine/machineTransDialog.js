import { Modal, Form, Input, Select, TreeSelect } from 'antd'
import React, {Component} from 'react'
const FormItem = Form.Item

const MachineTransDialog = Form.create({
  mapPropsToFields(props) {
    return {
       DeviceId: {
        ...props.DeviceId,
        value: props.DeviceId
      },
      Remark: {
        ...props.Remark,
        value: props.Remark
      },
       ClientId: {
        ...props.ClientId,
        value: props.ClientId
      },
       UserAccount: {
        ...props.UserAccount,
        value: props.UserAccount
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        userSelect: []
      }
    }

    componentWillMount() {
      this.clientId = ''
      
    }


 getMachineTypeSelect = (data) => {
   let typeDicSelect = data.map((item, index) => {
      return (
        <Option value={item.Id}>{item.Name}</Option>
      )
    })
    this.typeDicSelect = typeDicSelect
 }

 clientSelect = (value) => {
    if (this.clientId == value) { 
      return
    }
      
    this.props.fetchUserByClientId({id: value}).then(msg => {
       
      let userSelect = []
      if (msg) {
        userSelect = msg.map((item, index) => {
          return (
            <Option value={item.Id}>{item.Name}</Option>
          )
        })
          /*  
        if (this.clientId) {
            this.props.form.setFieldsValue({UserAccount: ''})
        }
            */ 
       
        this.setState({userSelect: userSelect})
        if (msg.length > 0) {
            this.props.form.setFieldsValue({UserAccount: msg[0].Id})
        } else {
             this.props.form.setFieldsValue({UserAccount: ''})
        }
        this.clientId = value
      }
    })
  }

  componentDidMount() {
  }
  
  onCancel = () => {
      
      this.props.onCancel()
      
  }
  
  onCreate = () => {
      
      this.props.onCreate()
    
  }

    render() {
    if (this.props.MachineId) {
      this.clientSelect(this.props.ClientId)
    }
    const { visible, form, title, clientDicData} = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }
    
    
    // this.getMachineTypeSelect(machineTypeDic)
    // let userModel = model.User.UserModel
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={this.onCancel}
        onOk={this.onCreate}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="机器编号："
          hasFeedback
        >
          {getFieldDecorator('DeviceId', {
            rules: [{
              required: true, message: '机器编号必填'
            }]
          })(
           <Input disabled={true}/>
          )}
        </FormItem>
          <FormItem
          {...formItemLayout}
          label="机器名称："
          hasFeedback
        >
          {getFieldDecorator('Remark', {
            rules: [{
              required: true, message: '机器名称必填'
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
              required: true, message: '所属客户必填'
            }]
          })(
             <TreeSelect
              dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
              treeData={clientDicData}
              treeDefaultExpandAll
              onChange={this.clientSelect}
            />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="登录账号："
          hasFeedback
        >
          {getFieldDecorator('UserAccount', {
            rules: [{
              required: true, message: '登录账号必填'
            }]
          })(
              <Select>
                 {this.state.userSelect}
            </Select>
          )}
        </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default MachineTransDialog

