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
        adDicSelect: [],
        isBind: props.IsBind
      }
    }

    componentWillMount() {
    }


 getPrivilegeTypeSelect = (data) => {
   let typeDicSelect = data.map((item, index) => {
      return (
        <Option value={item.Value}>{item.BookChinese}</Option>
      )
    })
    this.privilegeTypeDicSelect = typeDicSelect
 }
 

  checkTimeRule = (rule, value, callback) => {
    /*
    if (value.match(/^[\w]{12}$/)) {
      callback()
    } else {
      callback('12位机器编号')
    }
    */
    const {getFieldValue, resetFields} = this.props.form
    if (getFieldValue('TimeRule') || getFieldValue('ExpireTime')) {
      if (getFieldValue('TimeRule')) {
        resetFields(['ExpireTime'])
      } else {
        resetFields(['TimeRule'])
      }
      callback()
    } else {
      callback('时间规则和过期时间必填其一')
    }
    
    
  }
  

  checkMoneyRule = (rule, value, callback) => {
    const {getFieldValue, resetFields} = this.props.form
    if (getFieldValue('Money') || getFieldValue('Discount')) {
      if (getFieldValue('Money')) {
        resetFields(['Discount'])
      } else {
        resetFields(['Money'])
      }
      callback()
    } else {
      callback('券额和折扣必填其一')
    }
  }

  closeDialog = () => {
    this.props.onCancel()
  }

  saveDialog = () => {
    this.props.onCreate()
  }

  componentDidMount() {
  }

  isBindProduct = (e) => {
    this.setState({isBind: e.target.checked})
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
    this.getPrivilegeTypeSelect(this.props.privilegeTypeDic)
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
               {this.privilegeTypeDicSelect}
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
          <InputNumber min={0} step={0.01} max={100} precision={2}/>
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
        <InputNumber min={0} max={10} step={0.1} precision={1}/>
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
            <DatePicker 
            showTime
            format="YYYY-MM-DD HH:mm:ss"
            style={{width: '100%'}}
            />
        )}
      </FormItem>
        <FormItem
          {...formItemLayout}
          label="是否可叠加："
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
        >
          {getFieldDecorator('IsBind', {
            rules: [{
              required: false
            }]
          })(
             <Checkbox onChange={this.isBindProduct}></Checkbox>
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="选择绑定商品："
          hasFeedback
          style={{display: this.state.isBind ? 'inherit' : 'none'}}
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
        </Form>
      </Modal>
     
    )
    }
  }
)

export default PrivilegeDialogForm
