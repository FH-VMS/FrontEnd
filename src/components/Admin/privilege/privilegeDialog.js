import { Modal, Form, Input, Select, DatePicker, Checkbox, InputNumber } from 'antd'
import Utility from 'UTIL/utility'
import React, {Component} from 'react'
// import _ from 'lodash'
const FormItem = Form.Item

const PrivilegeDialogForm = Form.create({
  mapPropsToFields(props) {
    return {
       PrivilegeName: {
        ...props.PrivilegeName,
        value: props.DevPrivilegeNameiceId
      },
       PrincipleType: {
        ...props.PrincipleType,
        value: props.PrincipleType
      },
       UseMoneyLimit: {
        ...props.UseMoneyLimit,
        value: props.UseMoneyLimit
      },
       ExpireTime: {
        ...props.ExpireTime,
        value: Utility.dateFormaterObj(props.ExpireTime)
      },
       TimeRule: {
        ...props.TimeRule,
        value: props.TimeRule
      },
      IsBind: {
       ...props.IsBind,
       value: props.IsBind
     },
     BindProductIds: {
      ...props.BindProductIds,
      value: props.BindProductIds
    },
    IsOverlay: {
        ...props.IsOverlay,
        value: props.IsOverlay
    },
    Numbers: {
            ...props.Numbers,
            value: props.Numbers
    },
    Money: {
        ...props.Money,
        value: props.Money
    },
    Discount: {
        ...props.Discount,
        value: props.Discount
    },
    PrivilegeInstru: {
        ...props.PrivilegeInstru,
        value: props.PrivilegeInstru
    }
    }
  }
})(class PrivilegeDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        userSelect: [],
        payConfigSelect: [],
        adDicSelect: []
      }
    }

    componentWillMount() {
      this.clientId = ''
      this.payConfigClientId = ''
      this.adDicClientId = ''
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
     this.adDicSelect(value)
     this.props.form.setFieldsValue({UserAccount: '', MobilePayId: '', AdId: ''})
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
    if (this.payConfigClientId == value) { 
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
            this.payConfigClientId = value
      }
    })
  }

  adDicSelect = (value) => {
    if (this.adDicClientId == value) { 
      return
    }
    this.props.fetchAdDic({clientId: value}).then(msg => {
      if (msg) {
        let adDicSelect = msg.map((item, index) => {
          return (
            <Option value={item.Id}>{item.Name}</Option>
          )
        })
        this.setState({adDicSelect: adDicSelect})
        this.adDicClientId = value
      }
    })
  }

  checkTimeRule = (rule, value, callback) => {
    if (value.match(/^[\w]{12}$/)) {
      callback()
    } else {
      callback('12位机器编号')
    }
    
  }

  checkMoneyRule = (rule, value, callback) => {

  }

  closeDialog = () => {
    this.props.onCancel()
  }

  saveDialog = () => {
    this.props.onCreate()
  }

  componentDidMount() {
  }

  filterClient = (inputValue, treeNode) => {
      return treeNode.props.title.toLowerCase().indexOf(inputValue.toLowerCase()) >= 0
  }

  shouldComponentUpdate(nextProps, nextState) {
    return true
}

    render() {
    const { visible, form, title} = this.props
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
        onCancel={this.closeDialog}
        onOk={this.saveDialog}
        maskClosable={false}
      >
        <Form horizontal>
          <FormItem
          {...formItemLayout}
          label="名称："
          hasFeedback
        >
          {getFieldDecorator('PrivilegeName', {
            rules: [{
              required: true, message: '优惠券名称必填'
            }]
          })(
           <Input />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="券类型："
          hasFeedback
        >
          {getFieldDecorator('PrincipleType', {
            rules: [{
              required: true, message: '券类型必选'
            }]
          })(
            <Select>
               {this.typeDicSelect}
            </Select>
          )}
        </FormItem>
        <FormItem
        {...formItemLayout}
        label="券额："
        hasFeedback
      >
        {getFieldDecorator('Money', {
          rules: [{
            validator: this.checkMoneyRule
          }]
        })(
          <InputNumber />
        )}
      </FormItem>
      <FormItem
      {...formItemLayout}
      label="券折扣："
      hasFeedback
    >
      {getFieldDecorator('Discount', {
        rules: [{
            validator: this.checkMoneyRule
        }]
      })(
        <InputNumber />
      )}
    </FormItem>
        <FormItem
          {...formItemLayout}
          label="时间规则："
          hasFeedback
        >
          {getFieldDecorator('TimeRule', {
            rules: [{
                validator: this.checkTimeRule
            }]
          })(
              <Select>
                 {this.state.userSelect}
            </Select>
          )}
        </FormItem>
        <FormItem
        {...formItemLayout}
        label="过期时间："
        hasFeedback
      >
        {getFieldDecorator('ExpireTime', {
          rules: [{
              validator: this.checkTimeRule
          }]
        })(
            <DatePicker />
        )}
      </FormItem>
        <FormItem
          {...formItemLayout}
          label="是否可叠加："
          hasFeedback
        >
          {getFieldDecorator('IsOverlay', {
            rules: [{
              required: false
            }]
          })(
            <Checkbox></Checkbox>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="是否绑定商品："
          hasFeedback
        >
          {getFieldDecorator('IsBind', {
            rules: [{
              required: false
            }]
          })(
             <Checkbox></Checkbox>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="选择绑定商品："
          hasFeedback
        >
          {getFieldDecorator('BindProductIds', {
            rules: [{
              required: false
            }]
          })(
            <Select
            mode="multiple"
            placeholder=""
            defaultValue={[]}
            style={{ width: '100%' }}
          >
          </Select>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="券数量："
          hasFeedback
        >
          {getFieldDecorator('Numbers', {
            rules: [{
                required: true, message: '券数量必填'
            }]
          })(
            <InputNumber />
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

export default PrivilegeDialogForm
