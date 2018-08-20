import { Modal, Form, Input, DatePicker, InputNumber, Select, Upload, Icon, Button, message } from 'antd'
import Utility from 'UTIL/utility'
import React, {Component} from 'react'
const FormItem = Form.Item
const Option = Select.Option

const ProductListDialog = Form.create({
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
      WaresDiscountUnitPrice: {
        ...props.WaresDiscountUnitPrice,
        value: props.WaresDiscountUnitPrice
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
      },
      WaresStatus: {
       ...props.WaresStatus,
       value: props.WaresStatus
     }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        picSelect: [],
        productTypeSelect: [],
        productStatusSelect: []
      }
    }

    componentWillMount() {
      this.PicData = []
      this.props.fetchPictureDic({typ: '1'}).then(msg => {
        this.PicData = msg
         this.getPicSelect(msg)
      })

      this.props.fetchProductTypeDic().then(msg => {
         this.getProductTypeSelect(msg)
      })

      this.props.fetchDic({id: 'productstatus'}).then(msg => {
        this.getProductStatus(msg)
      })
    }

    getProductStatus = (data) => {
      if (data) {
        let letProductStatuseSelect = data.map((item, index) => {
          return <Option value={item.Value}>{item.BookChinese}</Option>
        })
  
        this.setState({productStatusSelect: letProductStatuseSelect})
      }
    }

   getPicSelect = (data) => {
     if (data) {
       let letPicSelect = data.map((item, index) => {
         let name = ''
         name = item.Name.split('/')[item.Name.split('/').length - 1]
         return <Option value={item.Id}><img style={{width: '30px', height: '20px', marginRight: '3px'}} src = {item.Name}/>{name}</Option>
       })

       this.setState({picSelect: letPicSelect})
     }
   }

   getProductTypeSelect = (data) => {
    if (data) {
      let letProductTypeSelect = data.map((item, index) => {
        return <Option value={item.Id}>{item.Name}</Option>
      })

      this.setState({productTypeSelect: letProductTypeSelect})
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
    const uploadObj = Utility.getUploadObj(1)
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
        maskClosable={false}
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
           <Input maxLength={20}/>
          )}
        </FormItem>
         <FormItem
          {...formItemLayout}
          label="原价："
          hasFeedback
        >
          {getFieldDecorator('WaresUnitPrice', {
            rules: [{
              validator: this.checkNum
            }]
          })(
           <InputNumber min={0.01} step="0.01" />
          )}
        </FormItem>
        <FormItem
        {...formItemLayout}
        label="活动价："
        hasFeedback
      >
        {getFieldDecorator('WaresDiscountUnitPrice', {
          rules: [{
            validator: this.checkNum
          }]
        })(
         <InputNumber min={0.01} step="0.01" />
        )}
      </FormItem>
         <FormItem
          {...formItemLayout}
          label="容量："
          hasFeedback
        >
          {getFieldDecorator('WaresWeight', {
            rules: [{
              validator: this.checkNum
            }]
          })(
           <InputNumber step="0.01" />
          )}
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
           <Input maxLength={50}/>
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
             <Select>
             {this.state.productTypeSelect}
             </Select>
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
            <Select showSearch optionFilterProp="children" filterOption={(input, option) => option.props.children[1].toLowerCase().indexOf(input.toLowerCase()) >= 0}>
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
        label="状态："
        hasFeedback
      >
        {getFieldDecorator('WaresStatus', {
          rules: [{
            required: true, message: '状态必填'
          }]
        })(
           <Select>
              {this.state.productStatusSelect}
           </Select>
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

export default ProductListDialog
