import { Modal, Form, Input } from 'antd'
import React, {Component} from 'react'
const FormItem = Form.Item

const CopyDialog = Form.create()(class Copy extends Component {
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



  checkMachineId = (rule, value, callback) => {
    if (value.match(/^[\w]{12}$/)) {
      callback()
    } else {
      callback('12位机器编号')
    }
    
  }

  componentDidMount() {
  }

  onCreate = () => {
    
        }

        onCancel = () => {

        }

    render() {
   
    const { visible, copyMachineId, form} = this.props
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
        onCancel={this.onCancel}
        onOk={this.onCreate}
        maskClosable={false}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label={copyMachineId + '  --> '}
          hasFeedback
        >
          {getFieldDecorator('DeviceId', {
            rules: [{
              required: true, message: '12位机器编号'
            }, {
              validator: this.checkMachineId
            }]
          })(
           <Input />
          )}
        </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default CopyDialog
