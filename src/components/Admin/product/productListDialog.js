import { Modal, Form, Input, DatePicker, InputNumber, Select, Upload, Icon, Button, message } from 'antd'
import Utility from 'UTIL/utility'
import React, {Component} from 'react'
import Model from 'STORE/model'
const FormItem = Form.Item
const Option = Select.Option

const MachineTypeDialog = Form.create({
  mapPropsToFields(props) {
    return {
       WaresName: {
        ...props.WaresName,
        value: props.WaresName
      },
       WaresUnitPrice: {
        ...props.WaresUnitPrice,
        value: props.WaresUnitPrice
      },
       WaresWeight: {
        ...props.WaresWeight,
        value: props.WaresWeight
      },
       WaresSpecifications: {
        ...props.WaresSpecifications,
        value: props.WaresSpecifications
      },
       WaresManufactureDate: {
        ...props.WaresManufactureDate,
        value: Utility.dateFormaterObj(props.WaresManufactureDate)
      },
       WaresQualityPeriod: {
        ...props.WaresQualityPeriod,
        value: Utility.dateFormaterObj(props.WaresQualityPeriod)
      },
       WaresTypeId: {
        ...props.WaresTypeId,
        value: props.WaresTypeId
      },
       SupplierId: {
        ...props.SupplierId,
        value: props.SupplierId
      },
       PicId: {
        ...props.PicId,
        value: props.PicId
      },
       WaresDescription: {
        ...props.WaresDescription,
        value: props.WaresDescription
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        picSelect: []
      }
    }

    componentWillMount() {
      this.PicData = []
      this.props.fetchPictureDic().then(msg => {
        this.PicData = msg
         this.getPicSelect(msg)
      })
    }

   getPicSelect = (data) => {
     if (data) {
       let letPicSelect = data.map((item, index) => {
         return <Option value={item.Id}><img style={{width: '30px', height: '20px', marginRight: '3px'}} src={Model.BaseSetting.Root.replace('api', '') + '/Attachment/' + item.Name}/>{item.Name}</Option>
       })

       this.setState({picSelect: letPicSelect})
     }
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

  radioChange = (value) => {

  }

    render() {
    // 此为修改
    const { visible, onCancel, onCreate, form, title} = this.props
    const { getFieldDecorator } = form
    const formItemLayout = {
      labelCol: { span: 6 },
      wrapperCol: { span: 14 }
    }

    // 上传方法
    const uploadObj = Utility.getUploadObj()
    uploadObj.onChange = (info) => {
      if (info.file.status !== 'uploading') {
        console.log(info.file, info.fileList)
      }
      if (info.file.status === 'done') {
        message.success(`上传成功`)
        if (info.file.response) {
       
          let id = info.file.response.RetObj[0].Id
          let name = info.file.response.RetObj[0].Name
          this.PicData.push({Id: id, Name: name})
          this.getPicSelect(this.PicData)
          form.setFieldsValue({PicId: id})
        }
      } else if (info.file.status === 'error') {
        message.error(`上传失败`)
      }
  }
    // let userModel = model.User.UserModel
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
          label="商品名称："
          hasFeedback
        >
          {getFieldDecorator('WaresName', {
            rules: [{
              required: true, message: '商品名称必填'
            }]
          })(
           <Input />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="单价："
          hasFeedback
        >
          {getFieldDecorator('WaresUnitPrice', {
            rules: [{
              validator: this.checkNum
            }]
          })(
           <InputNumber step="0.01" />
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="重量："
          hasFeedback
        >
          {getFieldDecorator('WaresWeight', {
            rules: [{
              validator: this.checkNum
            }]
          })(
           <InputNumber step="0.01" />
          )}克
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="规格："
          hasFeedback
        >
          {getFieldDecorator('WaresSpecifications', {
            rules: [{
              required: false, message: '规格必选'
            }]
          })(
           <Input />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="生产日期："
          hasFeedback
        >
          {getFieldDecorator('WaresManufactureDate', {
            rules: [{
              required: false
            }]
          })(
             <DatePicker />
          )}
        </FormItem>
        <FormItem
          {...formItemLayout}
          label="保质期至："
          hasFeedback
        >
          {getFieldDecorator('WaresQualityPeriod', {
            rules: [{
              required: false
            }]
          })(
              <DatePicker />
          )}
        </FormItem>
        
         <FormItem
          {...formItemLayout}
          label="所属类型："
          hasFeedback
        >
          {getFieldDecorator('WaresTypeId', {
            rules: [{
              required: false, message: '所属类型必填'
            }]
          })(
             <Select></Select>
          )}
        </FormItem>
          <FormItem
          {...formItemLayout}
          label="供应商："
          hasFeedback
        >
          {getFieldDecorator('SupplierId', {
            rules: [{
              required: false, message: '供应商'
            }]
          })(
             <Select></Select>
          )}
        </FormItem>
       
        <FormItem
          {...formItemLayout}
          label="图片："
          hasFeedback
        >
          {getFieldDecorator('PicId', {
            rules: [{
              required: true, message: '图片必填'
            }]
          })(
            <Select>
                 {this.state.picSelect}
             </Select>
          )}
        </FormItem>
          <FormItem
          {...formItemLayout}
          label="新上传："
        >
          {getFieldDecorator('PicUpload', {
            rules: [{
              required: false
            }]
          })(
             <Upload {...uploadObj} >
                <Button type="ghost">
                  <Icon type="upload" /> 上传新图片
                </Button>
            </Upload>
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="备注："
        >
          {getFieldDecorator('WaresDescription', {
            rules: [{
              required: false
            }]
          })(
             <Input type="textarea" />
          )}
        </FormItem>
        </Form>
      </Modal>
     
    )
    }
  }
)

export default MachineTypeDialog
