import React, {Component} from 'react'
import {Pagination, Modal, Radio, message, Upload, Icon} from 'antd'
import Utility from 'UTIL/utility'

const RadioGroup = Radio.Group

class ResourceDialog extends Component {
    constructor(props) {
		super(props)
        this.state = {
            dataSource: [],
            pagination: {
                defaultPageSize: 10
            },
            loading: false,
            value: 1
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: 9,
            fileType: 1
        }
    }

    componentWillMount() {
     
      
    
    }

    componentDidMount() {
        
        this.getDataReource(this.searchPara)
    }
    
    // 取数据方法
    getDataReource = (val) => {
      val.belong = this.props.typ
      this.setState({loading: true})
       this.props.fetchResource(val).then((msg) => {
         if (msg) {
           this.setState({dataSource: msg.data, pagination: {
                total: msg.pager.TotalRows,
                showSizeChanger: true,
                onShowSizeChange: (current, pageSize) => {
                    this.searchPara.pageIndex = current
                    this.searchPara.pageSize = pageSize
                    this.getDataReource(this.searchPara)
                },
                onChange: (current) => {
                    this.searchPara.pageIndex = current
                    this.getDataReource(this.searchPara)
                }
           },
           loading: false})
         }
      })
    }

   
    
   
    
    


     /* ****************************对弹出框form的操作方法********************************** */

  


    radioChange = (e) => {
        this.setState({
            value: e.target.value
          })

          this.searchPara.fileType = e.target.value
          this.getDataReource(this.searchPara)
    }
     

    
    

    render() {
        const uploadObj = Utility.getUploadObj(this.props.typ)
        uploadObj.onChange = (info) => {
            this.setState({loading: true, fileList: info.fileList})
            if (info.file.status !== 'uploading') {

            }
            if (info.file.status === 'done') {
                message.success(`上传成功`)
                this.getDataReource(this.searchPara)
                if (info.file.response) {
                // let id = info.file.response.RetObj[0].Id
                // let name = info.file.response.RetObj[0].Name
                }
                this.setState({loading: false, fileList: []})
            } else if (info.file.status === 'error') {
                message.error(`上传失败`)
                this.setState({loading: false, fileList: []})
            }
        }
        return (
            <Modal
            maskClosable={false}
            closable = {false}
            visible={this.props.visible}
            onOk={this.props.handleOk}
            onCancel={this.props.handleCancel}
            >
            <div>
                <div>
                <RadioGroup onChange={this.radioChange} value={this.state.value}>
                    <Radio value={1}>图片</Radio>
                    <Radio value={2}>视频</Radio>
                </RadioGroup>
                </div>
            <div className="imgContainer">
            <Upload
                className="avatar-uploader-dialog"
                name="avatar"
                showUploadList={this.state.loading}
                {...uploadObj} 
                fileList={this.state.fileList}
            >
                {
                    /*
                imageUrl ?
                    <img src={imageUrl} alt="" className="avatar" /> :
                    */
                   <Icon type="plus" className="avatar-uploader-trigger-dialog" />
                }
            </Upload>
            {
                           this.state.dataSource.map((cItem, cIndex) => {
                               if (cItem.FileType == '1') {
                                    return (
                                        <img src={cItem.PicUrl} title={cItem.PicName} onClick={this.props.resourceClick.bind(this, cItem)}/>
                                    )
                               } else {
                                    return (
                                       <span className="video"> <video src={cItem.PicUrl} title={cItem.PicName} onClick={this.props.resourceClick.bind(this, cItem)}/></span>
                                    )
                               }
                               
                           })
                       }
               
            </div>
            <div>
               <Pagination showSizeChanger onChange={this.state.pagination.onChange} onShowSizeChange={this.state.pagination.onShowSizeChange} defaultPageSize={this.state.pagination.defaultPageSize} defaultCurrent={1} total={this.state.pagination.total} />
            </div>
            </div>
            </Modal>
            
        )
    }
}

export default ResourceDialog
