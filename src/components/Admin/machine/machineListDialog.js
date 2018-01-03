import { Modal, Form, Input, Select, TreeSelect, DatePicker } from 'antd'
import Utility from 'UTIL/utility'
import React, {Component} from 'react'
const FormItem = Form.Item

const MachineTypeDialog = Form.create({
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
 
 clientChanged = (value) => {
     this.clientSelect(value)
     this.payConfigSelect(value)
 }

 clientSelect = (value) => {
    if (this.clientId == value) { 
      return
    }
    this.props.fetchUserByClientId({id: value}).then(msg => {
      if (msg) {
        let userSelect = msg.map((item, index) => {
          return (
            <Option value={item.Id}>{item.Name}</Option>
          )
        })
        
            this.setState({userSelect: userSelect})
            this.clientId = value
        
       
      }
    })
  }
  
   payConfigSelect = (value) => {
    if (this.payConfigClient == value) { 
      return
    }
    this.props.fetchPayConfigByClientId({clientId: value}).then(msg => {
      if (msg) {
        let payConfigSelect = msg.map((item, index) => {
          return (
            <Option value={item.Id}>{item.Name}</Option>
          )
        })
        
            this.setState({payConfigSelect: payConfigSelect})
            this.payConfigClient = value
        
       
      }
    })
  }

  checkMachineId = (rule, value, callback) => {
    if (value.match(/^[\w]{12}$/)) {
      callback()
    } else {
      callback('12位机器编号')
    }
    
  }

  componentDidMount() {
  }

    render() {
    let isDisable = false
    // 此为修改
    if (this.props.MachineId) {
      this.clientSelect(this.props.ClientId)
      this.payConfigSelect(this.props.ClientId)
      isDisable = true
    }
    const { visible, onCancel, onCreate, form, title, clientDicData, machineTypeDic} = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }
    this.getMachineTypeSelect(machineTypeDic)
    // let userModel = model.User.UserModel
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={onCancel}
        onOk={onCreate}
        maskClosable={false}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="机器编号："
          hasFeedback
        >
          {getFieldDecorator('DeviceId', {
            rules: [{
              required: true, message: '12位机器编号'
            }, {
              validator: this.checkMachineId
            }]
          })(
           <Input disabled={isDisable}/>
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
          hasFeedback
        >
          {getFieldDecorator('TypeId', {
            rules: [{
              required: true, message: '机型必选'
            }]
          })(
            <Select disabled={isDisable}>
               {this.typeDicSelect}
            </Select>
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
             <TreeSelect disabled={isDisable}
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
        <FormItem
          {...formItemLayout}
          label="启用日期："
          hasFeedback
        >
          {getFieldDecorator('StartDate', {
            rules: [{
              required: false
            }]
          })(
             <DatePicker />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="停用日期："
          hasFeedback
        >
          {getFieldDecorator('StopDate', {
            rules: [{
              required: false
            }]
          })(
              <DatePicker />
          )}
        </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default MachineTypeDialog
