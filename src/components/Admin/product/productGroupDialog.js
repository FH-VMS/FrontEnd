import { Modal, Form, Input, InputNumber, Select, Upload, Icon, Button, message } from 'antd'
import Utility from 'UTIL/utility'
import React, {Component} from 'react'
const FormItem = Form.Item
const Option = Select.Option

const ProductGroupDialog = Form.create({
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
       PicId: {
        ...props.PicId,
        value: props.PicId
      },
      WaresTypeId: {
       ...props.WaresTypeId,
       value: props.WaresTypeId
     },
       WaresDescription: {
        ...props.WaresDescription,
        value: props.WaresDescription
      },
      ProductRelation: {
        ...props.ProductRelation,
        value: props.ProductRelation
      }
    }
  }
})(class ClassDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
        picSelect: [],
        productDicSelect: [],
        productDic: [],
        productTypeSelect: [],
        chosenProduct: [],
        canLoad: true,
        initData: true
      }
    }

    componentWillMount() {
      this.PicData = []
      this.props.fetchPictureDic().then(msg => {
        this.PicData = msg
         this.getPicSelect(msg)
      })

      
      this.props.fetchProductTypeDic().then(msg => {
          this.getProductTypeSelect(msg)
      })

    }

    getProductTypeSelect = (data) => {
      if (data) {
        let letProductTypeSelect = data.map((item, index) => {
          return <Option value={item.Id}>{item.Name}</Option>
        })
  
        this.setState({productTypeSelect: letProductTypeSelect})
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


  componentDidMount() {
    this.getProductSelect()
  }

  getProductSelect = () => {
    if (this.state.productDic.length == 0) {
      this.props.fetchProductDic().then(msg => {
         if (msg) {
          let productSelectLet = msg.map((item, index) => {
            return <Option value={item.Id}>{item.Name}</Option>
          })
          this.setState({productDicSelect: productSelectLet})
         }
      })
    }
    
  }

   checkNum = (rule, value, callback) => {
      if (value) {
         callback()
         return
      }
     callback('不能为空')
    }

    checkProductRelation = (rule, value, callback) => {
      if (value.length == 0) {
        callback('至少选一个商品')
      } else {
        callback()
      }
    }

  radioChange = (value) => {

  }

  onCreate = () => {
    this.setState({canLoad: true, initData: true})
    this.props.onCreate()
  }

  onCancel = () => {
    this.setState({canLoad: true, initData: true})
    this.props.onCancel()
  }

  // 商品选择改变事件
  productChange = (item) => {
    if (item) {
      this.setState({chosenProduct: item, canLoad: false})
    } else {
      this.setState({chosenProduct: [], canLoad: false})
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
    
   if (visible && this.state.canLoad) {
     setTimeout(() => {
      this.productChange(this.props.ProductRelation)
      let setValues = {}
      this.state.chosenProduct.map((item, index) => {
          setValues[item.key] = item.number
      })

      if (Object.keys(setValues).length > 0) {
        setFieldsValue(setValues)
      }
     }, 20)
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
        onCancel={this.onCancel}
        onOk={this.onCreate}
        maskClosable={false}
      >
        <Form horizontal>
         <FormItem
          {...formItemLayout}
          label="商品组名称："
          key='WaresName'
          hasFeedback
        >
          {getFieldDecorator('WaresName', {
            rules: [{
              required: true, message: '商品组名称必填'
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
        label="对应商品："
        hasFeedback
      >
        {getFieldDecorator('ProductRelation', {
          rules: [{
            validator: this.checkProductRelation
          }]
        })(
          <Select
          mode="multiple"
          showSearch
          style={{ width: '100%' }}
          placeholder="选择商品"
          optionFilterProp="children"
          filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
          onChange={this.productChange}
          labelInValue={true}
      >{this.state.productDicSelect}</Select>
        )}
      </FormItem>
      {
        this.state.chosenProduct.map((item, index) => {
           return (<FormItem
             {...formItemLayout}
             label={item.label}
             key={item.key}
             hasFeedback
           >
             {getFieldDecorator(item.key, {
               rules: [{required: false}]
             })(
               <InputNumber placeholder="数量(默认1)" min={1} step={1} max={10} precision={0}/>
             )}
           </FormItem>)
         }) 
      }
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

export default ProductGroupDialog
