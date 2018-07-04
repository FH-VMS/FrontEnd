import { Modal, Form, Input, Checkbox } from 'antd'
import React, {Component} from 'react'
const FormItem = Form.Item
const CheckboxGroup = Checkbox.Group

const CopyDialog = Form.create()(class Copy extends Component {
    constructor(props) {
      super(props)
      this.state = {
        userSelect: [],
        payConfigSelect: [],
        checkList: [{label: '机器配置', value: '机器配置'}, {label: '货道配置', value: '货道配置'}]
      }
    }

    componentWillMount() {
      this.clientId = ''
      this.payConfigClient = ''
      
    }



  checkMachineId = (rule, value, callback) => {
    if (value.match(/^[\w]{12}$/)) {
      callback()
    } else {
      callback('12位机器编号')
    }
    
  }

  checkDeviceId = (rule, value, callback) => {
    if (value.match(/^[\w]{15}$/)) {
      callback()
    } else {
      callback('15位设备编号')
    }
    
  }

  componentDidMount() {
    this.props.form.setFieldsValue({'CopyItems': ['机器配置', '货道配置'], 'DeviceId': ''})
  }



    render() {
   
    const { visible, copyMachineId, form, copyDeviceId} = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }

   
    // let userModel = model.User.UserModel
    return (
      
      <Modal
        visible={visible}
        title='复制当前机器'
        onCancel={this.props.onCancel}
        onOk={this.props.onCreate}
        maskClosable={false}
      >
        <Form horizontal>
        <FormItem
        {...formItemLayout}
        label={copyDeviceId + '  --> '}
        hasFeedback
      >
        {getFieldDecorator('DeviceId', {
          rules: [ {
            validator: this.checkDeviceId
          }]
        })(
         <Input placeholder="设备编号"/>
        )}
      </FormItem>
         <FormItem
          {...formItemLayout}
          label={copyMachineId + '  --> '}
          hasFeedback
        >
          {getFieldDecorator('MachineId', {
            rules: [ {
              validator: this.checkMachineId
            }]
          })(
           <Input placeholder="机器编号"/>
          )}
        </FormItem>
        <FormItem
        {...formItemLayout}
          label='复制项目：'
        >
         {getFieldDecorator('CopyItems', {
            rules: [{
              required: false
            }]
          })(
             <CheckboxGroup options={this.state.checkList} />
          )}
        </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default CopyDialog
