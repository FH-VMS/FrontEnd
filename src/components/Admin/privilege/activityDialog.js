import { Modal, Form, Input, InputNumber, Select, DatePicker } from 'antd'
import React, {Component} from 'react'
const FormItem = Form.Item
const Option = Select.Option

const ActivityDialog = Form.create({
  mapPropsToFields(props) {
    return {
       Name: {
        ...props.Name,
        value: props.Name
      },
       WaresUnitPrice: {
        ...props.WaresUnitPrice,
        value: props.WaresUnitPrice
      },
      TimeRule: {
        ...props.TimeRule,
        value: props.TimeRule
      },
      ActivityType: {
       ...props.ActivityType,
       value: props.ActivityType
     },
     StartTime: {
        ...props.StartTime,
        value: props.StartTime
      },
      EndTime: {
         ...props.EndTime,
         value: props.EndTime
       },
      RelationData: {
        ...props.RelationData,
        value: props.RelationData
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        privilegeTypeDicSelect: [],
        privilegeGroupDicSelect: [],
        chosenPrivilege: [],
        canLoad: true,
        initData: true
      }
    }

    componentWillMount() {

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


  componentDidMount() {
    
  }

 

   checkNum = (rule, value, callback) => {
      if (value) {
         callback()
         return
      }
     callback('不能为空')
    }

    checkRelation = (rule, value, callback) => {
      if (value.length == 0) {
        callback('至少选一个商品')
      } else {
        callback()
      }
    }

   

  onCreate = () => {
    this.setState({canLoad: true, initData: true})
    this.props.onCreate()
  }

  onCancel = () => {
    this.setState({canLoad: true, initData: true})
    this.props.onCancel()
  }

  // 优惠券选择改变事件
  relationChange = (item) => {
    if (item) {
      this.setState({chosenPrivilege: item, canLoad: false})
    } else {
      this.setState({chosenPrivilege: [], canLoad: false})
    }
  
  }

  


    render() {
    // 此为修改
    const { visible, form, title} = this.props
    const { getFieldDecorator, setFieldsValue } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }
    this.getPrivilegeGroupSelect(this.props.privilegeGroupDic)
    this.getTimeRuleSelect(this.props.timeRuleDic)
   if (visible && this.state.canLoad) {
     setTimeout(() => {
      this.relationChange(this.props.RelationData)
      let setValues = {}
      this.state.chosenPrivilege.map((item, index) => {
          setValues[item.key] = item.number
      })

      if (Object.keys(setValues).length > 0) {
        setFieldsValue(setValues)
      }
     }, 20)
   }

  
 

  
 
  
    // let userModel = model.User.UserModel
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={this.onCancel}
        onOk={this.onCreate}
        maskClosable={false}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="活动名称："
          key='Name'
          hasFeedback
        >
          {getFieldDecorator('Name', {
            rules: [{
              required: true, message: '活动名称必填'
            }]
          })(
           <Input />
          )}
        </FormItem>
        <FormItem
        {...formItemLayout}
        label="活动类型："
        hasFeedback
        
      >
        {getFieldDecorator('ActivityType', {
          rules: [{
            required: false
          }]
        })(
          <Select allowClear={true}>
             {this.privilegeGroupDicSelect}
          </Select>
        )}
      </FormItem>
       
        <FormItem
        {...formItemLayout}
        label="对应优惠券："
        hasFeedback
      >
        {getFieldDecorator('RelationData', {
          rules: [{
            validator: this.checkRelation
          }]
        })(
          <Select
          mode="multiple"
          showSearch
          style={{ width: '100%' }}
          placeholder="选择优惠"
          optionFilterProp="children"
          filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
          onChange={this.relationChange}
          labelInValue={true}
      >{this.state.productDicSelect}</Select>
        )}
      </FormItem>
      {
        this.state.chosenPrivilege.map((item, index) => {
           return (<FormItem
             {...formItemLayout}
             label={item.label}
             key={item.key}
             hasFeedback
           >
             {getFieldDecorator(item.key, {
               rules: [{required: false}]
             })(
               <InputNumber placeholder="概率(默认1)" min={0} step={1} max={100} precision={0}/>
             )}
           </FormItem>)
         }) 
      }
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
    label="开始时间："
    hasFeedback
  >
    {getFieldDecorator('StartTime', {
      rules: [{
        required: true, message: '活动开始时间必填'
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
  label="开始时间："
  hasFeedback
>
  {getFieldDecorator('EndTime', {
    rules: [{
        required: true, message: '活动开始时间必填'
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
label="时间规则："
hasFeedback
>
{getFieldDecorator('TimeRule', {
  rules: [{
    required: false
  }]
})(
    <Select allowClear={true}>
       {this.timeRuleSelect}
  </Select>
)}
</FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default ActivityDialog
