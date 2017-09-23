import { Modal, Form, Input, Select, InputNumber, Checkbox } from 'antd'
// import model from 'STORE/model'
import React, {Component} from 'react'
const FormItem = Form.Item
const CheckboxGroup = Checkbox.Group

const MachineTypeDialog = Form.create({
  mapPropsToFields(props) {
    return {
       TypeName: {
        ...props.TypeName,
        value: props.TypeName
      },
      TypeType: {
        ...props.TypeType,
        value: props.TypeType
      },
      MaxGoods: {
        ...props.MaxGoods,
        value: props.MaxGoods
      },
      TypeRemark: {
         ...props.TypeRemark,
        value: props.TypeRemark
      },
      CabinetList: {
        ...props.CabinetList,
        value: props.CabinetList
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        typeDicSelect: ''
      }
    }

    componentWillMount() {
      this.props.fetchDic({id: 'typetype'}).then(msg => {
          if (msg) {
            let typeDicSelect = msg.map((item, index) => {
              return (
                <Option value={item.Value}>{item.BookChinese}</Option>
              )
            })

            this.setState({typeDicSelect: typeDicSelect})
          }
      })
    }

    checkNum = (rule, value, callback) => {
      if (value) {
         callback()
         return
      }
     callback('货道不能为空')
    }
    
 

    render() {

    
    const { visible, onCancel, onCreate, form, title, cabinetsList} = this.props
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
        onCancel={onCancel}
        onOk={onCreate}
        maskClosable={false}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="名称："
          hasFeedback
        >
          {getFieldDecorator('TypeName', {
            rules: [{
              required: true, message: '名称不能为空'
            }]
          })(
            <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="类型："
          hasFeedback
        >
          {getFieldDecorator('TypeType', {
            rules: [{
              required: true, message: '类型改造'
            }]
          })(
             <Select>
                {this.state.typeDicSelect}
            </Select>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="最大货道数："
          hasFeedback
        >
          {getFieldDecorator('MaxGoods', {
            rules: [{
              validator: this.checkNum
            }]
          })(
             <InputNumber />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="对应货柜："
        >
          {getFieldDecorator('CabinetList', {
            rules: [{
              required: false
            }]
          })(
             <CheckboxGroup options={cabinetsList} />
          )}
        </FormItem>
          <FormItem
          {...formItemLayout}
          label="备注："
          hasFeedback
        >
          {getFieldDecorator('TypeRemark', {
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

export default MachineTypeDialog
