import { Modal, Form, Upload, Icon, Button, message } from 'antd'
import Utility from 'UTIL/utility'
import React, {Component} from 'react'
const FormItem = Form.Item

const ResourceDialog = Form.create()(class ClassDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
    }


  componentDidMount() {
  }




    render() {
    // 此为修改
    const { visible, onCancel, form, title} = this.props
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
      >
        <Form horizontal>
         
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
        </Form>
      </Modal>
     
    )
    }
  }
)

export default ResourceDialog
