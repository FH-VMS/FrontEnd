import { Modal, Form, Input, Select, TreeSelect, DatePicker } from 'antd'
import React, {Component} from 'react'
import Utility from 'UTIL/utility'
const FormItem = Form.Item

const MachineTransDialog = Form.create({
  mapPropsToFields(props) {
    return {
      MachineId: {
        ...props.MachineId,
        value: props.MachineId
      },
      Remark: {
        ...props.Remark,
        value: props.Remark
      },
       TypeId: {
        ...props.TypeId,
        value: props.TypeId
      },
       ClientId: {
        ...props.ClientId,
        value: props.ClientId
      },
       UserAccount: {
        ...props.UserAccount,
        value: props.UserAccount
      },
       StartDate: {
        ...props.StartDate,
        value: Utility.dateFormaterObj(props.StartDate)
      },
       StopDate: {
        ...props.StopDate,
        value: Utility.dateFormaterObj(props.StopDate)
      },
       MobilePayId: {
        ...props.MobilePayId,
        value: props.MobilePayId
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        userSelect: [],
        payConfigSelect: []
      }
    }

    componentWillMount() {
      this.clientId = ''
      this.payConfigClient = ''
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
  
  payConfigSelect = (value) => {
    if (this.payConfigClient == value) { 
      return
    }
      
    this.props.fetchPayConfigByClientId({clientId: value}).then(msg => {
       
      let payConfigSelect = []
      if (msg) {
        payConfigSelect = msg.map((item, index) => {
          return (
            <Option value={item.Id}>{item.Name}</Option>
          )
        })
          /*  
        if (this.clientId) {
            this.props.form.setFieldsValue({UserAccount: ''})
        }
            */ 
       
        this.setState({payConfigSelect: payConfigSelect})
        if (msg.length > 0) {
            this.props.form.setFieldsValue({MobilePayId: msg[0].Id})
        } else {
             this.props.form.setFieldsValue({MobilePayId: ''})
        }
        this.payConfigClient = value
      }
    })
  }
  
  clientChanged = (value) => {
      this.clientSelect(value)
      this.payConfigSelect(value)
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
    if (this.props.MachineId && !this.clientId) {
      this.clientChanged(this.props.ClientId)
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
        maskClosable={false}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="机器编号："
          hasFeedback
        >
          {getFieldDecorator('MachineId', {
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
          label="机型："
          style={{display: 'none'}}
          hasFeedback
        >
          {getFieldDecorator('TypeId', {
            rules: [{
              required: false, message: '机型必选'
            }]
          })(
            <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="启用日期："
          style={{display: 'none'}}
          hasFeedback
        >
          {getFieldDecorator('StartDate', {
            rules: [{
              required: false, message: '机型必选'
            }]
          })(
              <DatePicker />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="停用日期："
          style={{display: 'none'}}
          hasFeedback
        >
          {getFieldDecorator('StopDate', {
            rules: [{
              required: false, message: '机型必选'
            }]
          })(
              <DatePicker />
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
              onChange={this.clientChanged}
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
         <FormItem
          {...formItemLayout}
          label="支付配置："
          hasFeedback
        >
          {getFieldDecorator('MobilePayId', {
            rules: [{
              required: true, message: '支付配置必选'
            }]
          })(
              <Select>
                 {this.state.payConfigSelect}
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

