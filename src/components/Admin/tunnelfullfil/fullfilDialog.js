import { Modal, Form, Checkbox } from 'antd'
import React, {Component} from 'react'
const FormItem = Form.Item

const CheckboxGroup = Checkbox.Group

const MachineTypeDialog = Form.create()(class ClassDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
    }



  componentDidMount() {
  }

    render() {
    const { visible, onCancel, onCreate, form, machineList} = this.props
	let chkGroupData = []
	machineList.map((item, index) => {
		chkGroupData.push({label: item.Name, value: item.Id})
	})
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 1 },
      wrapperCol: { span: 19 }
    }
    // let userModel = model.User.UserModel
    return (
      
      <Modal
        visible={visible}
        title='选择机器'
        onCancel={onCancel}
        onOk={onCreate}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
        >
          {getFieldDecorator('DeviceId', {
            rules: [{
              required: true, message: '选择至少一台机器导出'
            }]
          })(
           <CheckboxGroup options={chkGroupData}/>
          )}
        </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default MachineTypeDialog
