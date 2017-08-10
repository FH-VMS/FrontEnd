import { Modal, Form, Radio, Input, Checkbox, InputNumber } from 'antd'
import React, {Component} from 'react'
const FormItem = Form.Item
const RadioGroup = Radio.Group
const CheckboxGroup = Checkbox.Group

const MachineTypeDialog = Form.create({
  mapPropsToFields(props) {
    return {
       DeviceId: {
        ...props.DeviceId,
        value: props.DeviceId
      },
      McStatus: {
        ...props.McStatus,
        value: props.McStatus
      },
      McActivity: {
        ...props.McActivity,
        value: props.McActivity
      },
      PayLists: {
        ...props.PayLists,
        value: props.PayLists
      },
      MachineFucLists: {
        ...props.MachineFucLists,
        value: props.MachineFucLists
      },
      McArea1Temp: {
        ...props.McArea1Temp,
        value: props.McArea1Temp
      },
      McArea2Temp: {
        ...props.McArea2Temp,
        value: props.McArea2Temp
      },
      McArea3Temp: {
        ...props.McArea3Temp,
        value: props.McArea3Temp
      },
      McArea4Temp: {
        ...props.McArea4Temp,
        value: props.McArea4Temp
      },
      McGoodsUsed: {
        ...props.McGoodsUsed,
        value: props.McGoodsUsed
      },
      McLongitude: {
        ...props.McLongitude,
        value: props.McLongitude
      },
      McDimension: {
        ...props.McDimension,
        value: props.McDimension
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
    }

    checkNum = (rule, value, callback) => {
      if (value || value == 0) {
         callback()
         return
      }
      callback()
    }
 

  componentDidMount() {
  }

    render() {
    const { visible, onCancel, onCreate, form, title, payLists, machineFucLists} = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }
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
        >
          {getFieldDecorator('DeviceId', {
            rules: [{
              required: false
            }]
          })(
            <label>{this.props.DeviceId}</label>
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="状态："
          hasFeedback
        >
          {getFieldDecorator('McStatus', {
            rules: [{
              required: true, message: '状态必选'
            }]
          })(
            <RadioGroup>
              <Radio value="1">正常</Radio>
              <Radio value="0">异常</Radio>
            </RadioGroup>
          )}
        </FormItem>
        
        <FormItem
          {...formItemLayout}
          label="活动："
          hasFeedback
        >
          {getFieldDecorator('McActivity', {
            rules: [{
              required: false
            }]
          })(
              <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="支付功能："
        >
          {getFieldDecorator('PayLists', {
            rules: [{
              required: false
            }]
          })(
             <CheckboxGroup options={payLists} />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="机器功能："
        >
          {getFieldDecorator('MachineFucLists', {
            rules: [{
              required: false
            }]
          })(
             <CheckboxGroup options={machineFucLists} />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="空间1温度："
        >
          {getFieldDecorator('McArea1Temp', {
            rules: [{
              validator: this.checkNum,
              message: '温度必填'
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="空间2温度："
        >
          {getFieldDecorator('McArea2Temp', {
            rules: [{
              validator: this.checkNum
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="空间3温度："
        >
          {getFieldDecorator('McArea3Temp', {
            rules: [{
              validator: this.checkNum
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="空间4温度："
        >
          {getFieldDecorator('McArea4Temp', {
            rules: [{
              validator: this.checkNum
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="启用货道数："
        >
          {getFieldDecorator('McGoodsUsed', {
            rules: [{
              validator: this.checkNum
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="经度："
        >
          {getFieldDecorator('McLongitude', {
            rules: [{
              validator: this.checkNum
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="纬度："
        >
          {getFieldDecorator('McDimension', {
            rules: [{
              validator: this.checkNum
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="备注："
        >
          {getFieldDecorator('Remark', {
            rules: [{
              required: false
            }]
          })(
             <textarea></textarea>
          )}
        </FormItem>

        </Form>
        
      </Modal>
     
    )
    }
  }
)

export default MachineTypeDialog
