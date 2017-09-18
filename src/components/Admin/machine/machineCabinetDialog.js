import { Modal, Form, Input, InputNumber, message } from 'antd'
import React, {Component} from 'react'
const FormItem = Form.Item

const MachineTypeDialog = Form.create({
  mapPropsToFields(props) {
    return {
       CabinetName: {
        ...props.CabinetName,
        value: props.CabinetName
      },
       CabinetType: {
        ...props.CabinetType,
        value: props.CabinetType
      },
       LayerNumber: {
        ...props.LayerNumber,
        value: props.LayerNumber
      },
       LayerGoodsNumber: {
        ...props.LayerGoodsNumber,
        value: props.LayerGoodsNumber
      },
       CabinetDisplay: {
        ...props.CabinetDisplay,
        value: props.CabinetDisplay
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
      this.layer = 0
    }

    changeLayerNumber = (val) => {
       this.layer = val
    }

 checkNum = (rule, value, callback) => {
      if (!value || value == 0) {
         // callback()
         message.error('层数必须大于0')
         return
      }
      callback()
    }

  checkTunnelRules = (rule, value, callback) => {
      if (!value) {
         // callback()
         
         return
      }
      let reg = /^[1-9]+(,[1-9]+)*$/

      if (reg.test(value) && value.split(',').length == parseInt(this.layer, 0)) {
          callback()
      } else {
          message.error('列数不符合规则')
      }
     
    }

  componentDidMount() {
  }

    render() {
    // 此为修改
    const { visible, onCancel, onCreate, form, title} = this.props
    const { getFieldDecorator, getFieldValue } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }
    if (getFieldValue('LayerNumber')) {
        this.layer = getFieldValue('LayerNumber')
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
          label="机柜名称："
        >
          {getFieldDecorator('CabinetName', {
            rules: [{
              required: true, message: '机柜名称'
            }]
          })(
           <Input />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="类型："
        >
          {getFieldDecorator('CabinetType', {
            rules: [{
              required: false
            }]
          })(
            <Input/>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="层数："
        >
          {getFieldDecorator('LayerNumber', {
            rules: [{
                required: true, validator: this.checkNum, message: '层数'
            }]
          })(
           <InputNumber onChange={this.changeLayerNumber}/>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="层数对应的列数："
        >
          {getFieldDecorator('LayerGoodsNumber', {
            rules: [{
              required: true, validator: this.checkTunnelRules, message: '列数'
            }]
          })(
           <Input placeholder='用逗号隔开，列数必须与层数对应'/>
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="柜号："
        >
          {getFieldDecorator('CabinetDisplay', {
            rules: [{
              required: true, message: '柜号'
            }]
          })(
           <Input />
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
           <textarea style={{width: '100%'}}></textarea>
          )}
        </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default MachineTypeDialog
