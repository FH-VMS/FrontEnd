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
        value: props.PrivilegeName
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
        value: Utility.timeFormaterObj(props.ExpireTime)
      },
      StartTime: {
       ...props.StartTime,
       value: Utility.timeFormaterObj(props.StartTime)
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
    },
    DisplayText: {
        ...props.DisplayText,
        value: props.DisplayText
    },
    PrincipleGroup: {
        ...props.PrincipleGroup,
        value: props.PrincipleGroup
    }
    }
  }
})(class PrivilegeDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        timeRuleSelect: [],
        payConfigSelect: [],
        adDicSelect: [],
        isBind: props.IsBind,
        formItem: [],
        isRound: false,
        pricipleType: 1
      }
    }

    componentWillMount() {
    }

    groupChange = (val) => {
      if (val == '1') {
        this.setState({isRound: true})
      } else {
        this.setState({isRound: false})
      }
    }


 getPrivilegeTypeSelect = (data) => {
   let typeDicSelect = data.map((item, index) => {
      return (
        <Option value={item.Value}>{item.BookChinese}</Option>
      )
    })
    this.privilegeTypeDicSelect = typeDicSelect
 }

 getPrivilegeGroupSelect = (data) => {
  let typeDicSelect = data.map((item, index) => {
     return (
       <Option value={item.Value}>{item.BookChinese}</Option>
     )
   })
   this.privilegeGroupDicSelect = typeDicSelect
}

 getTimeRuleSelect = (data) => {
  let timeRuleSelect = data.map((item, index) => {
    return (
      <Option value={item.Value}>{item.BookChinese}</Option>
    )
  })
  this.timeRuleSelect = timeRuleSelect
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
    if (this.props.PricipleType) {
      this.setState({pricipleType: this.props.PricipleType})
    } else {
      this.setState({pricipleType: 1})
    }
   
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

getFormItems = (val) => {
  let items = []
  switch (val) {
    case '1':
    items.push({label: '券额：', key: 'Money', rules: [{
      required: true, message: '券额必填'
    }],
     control: <InputNumber min={0} step={0.01} max={100} precision={2}/>
   })
    break
    case '2':
    items.push({label: '券折扣：', key: 'Discount', rules: [{
      required: true, message: '折扣必填'
    }],
    control: <InputNumber min={0} max={10} step={0.1} precision={1}/>})
    break
    case '3':
    items.push({label: '选择赠送商品：', key: 'BindProductIds', rules: [{
      required: true, message: '选择赠送商品：'
    }],
    control: <Select>
      
    </Select>})
    break
    case '4':
    items.push({label: '券额：', key: 'Money', rules: [{
      required: true, message: '券额必填'
    }],
     control: <InputNumber min={0} step={0.01} max={100} precision={2}/>
   },
  )
  items.push({label: '选择赠送商品：', key: 'BindProductIds', rules: [{
    required: true, message: '选择赠送商品：'
  }],
  control: <Select>
    
  </Select>})
    break
    case '5':
    items.push({label: '券折扣：', key: 'Discount', rules: [{
      required: true, message: '折扣必填'
    }],
    control: <InputNumber min={0} max={10} step={0.1} precision={1}/>})
    items.push({label: '选择赠送商品：', key: 'BindProductIds', rules: [{
      required: true, message: '选择赠送商品：'
    }],
    control: <Select>
      
    </Select>})
    break
  }

  return items
}

principleTypeChange = (val) => {
  this.setState({pricipleType: val})
}

    render() {
    const { visible, form, title} = this.props
    const { getFieldDecorator, getFieldValue } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }
    this.getPrivilegeTypeSelect(this.props.privilegeTypeDic)
    this.getPrivilegeGroupSelect(this.props.privilegeGroupDic)
    this.getTimeRuleSelect(this.props.timeRuleDic)
    // let userModel = model.User.UserModel
    // alert(this.state.pricipleType)
    
    const items = this.getFormItems(getFieldValue('PrincipleType')).map((item, index) => {
      return <FormItem
      {...formItemLayout}
      label={item.label}
      hasFeedback
    >
      {getFieldDecorator(item.key, {
        rules: item.rules
      })(
        item.control
      )}
    </FormItem>
    }) 
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
        label="展示名称："
        hasFeedback
      >
        {getFieldDecorator('DisplayText', {
          rules: [{
            required: true, message: '展示名称'
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
            <Select onChange={this.principleTypeChange}>
               {this.privilegeTypeDicSelect}
            </Select>
          )}
        </FormItem>
        <FormItem
        {...formItemLayout}
        label="券组："
        hasFeedback
        
      >
        {getFieldDecorator('PrincipleGroup', {
          rules: [{
            required: false
          }]
        })(
          <Select allowClear={true} onChange={this.groupChange}>
             {this.privilegeGroupDicSelect}
          </Select>
        )}
      </FormItem>
      {
        items
      }
      <FormItem
      {...formItemLayout}
      label="使用金额限制："
      hasFeedback
    >
      {getFieldDecorator('UseMoneyLimit', {
        rules: [{
          required: false
        }]
      })(
         <InputNumber min={0} step={0.01} max={10000} precision={2}/>
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
              <Select allowClear={true}>
                 {this.timeRuleSelect}
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
        label="开始时间："
        hasFeedback
      >
        {getFieldDecorator('StartTime', {
          rules: [{
            required: false
          }]
        })(
            <DatePicker 
            showTime
            format="YYYY-MM-DD HH:mm:ss"
            style={{width: '100%'}}
            />
        )}
      </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default PrivilegeDialogForm
