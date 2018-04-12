import { Modal, Form, Input, InputNumber } from 'antd'
// import model from 'STORE/model'
import React, {Component} from 'react'
const FormItem = Form.Item

const ProductTypeDialog = Form.create({
  mapPropsToFields(props) {
    return {
       WaresTypeName: {
        ...props.WaresTypeName,
        value: props.WaresTypeName
      },
      Sequence: {
        ...props.Sequence,
        value: props.Sequence
      },
      WaresTypeRemark: {
        ...props.WaresTypeRemark,
        value: props.WaresTypeRemark
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
        
    }

    
 

    render() {

    
    const { visible, onCancel, onCreate, form, title} = this.props
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
          label="类型名称："
          hasFeedback
        >
          {getFieldDecorator('WaresTypeName', {
            rules: [{
              required: true, message: '类型名称不能为空'
            }]
          })(
            <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="排序："
          hasFeedback
        >
          {getFieldDecorator('Sequence', {
            rules: [{
              required: false
            }]
          })(
            <InputNumber min={1} max={100}/>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="备注："
          hasFeedback
        >
          {getFieldDecorator('WaresTypeRemark', {
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

export default ProductTypeDialog
