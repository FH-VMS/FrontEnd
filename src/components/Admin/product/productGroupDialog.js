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
         let name = ''
         name = item.Name.split('/')[item.Name.split('/').length - 1]
         return <Option value={item.Id}><img style={{width: '30px', height: '20px', marginRight: '3px'}} src = {item.Name}/>{name}</Option>
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
          label="商品组名称："
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
