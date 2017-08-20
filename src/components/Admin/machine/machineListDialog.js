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

  componentDidMount() {
  }

    render() {
    let isDisable = false
    // 此为修改
    if (this.props.MachineId) {
      this.clientSelect(this.props.ClientId)
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
