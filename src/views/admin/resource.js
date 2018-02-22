import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import EveryResource from 'COMPONENT/admin/resource/everyResource'
import { Select, Table, message, Spin, Popconfirm, Pagination, Upload, Icon } from 'antd'

const { Column } = Table

class Resource extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            authData: [], // 权限数据
            dataSource: [],
            auth: {
                CanAdd: 'none',
                CanDelete: 'none',
                CanModify: 'none',
                CanSearch: 'none'
            },
            pagination: {
                defaultPageSize: model.BaseSetting.PageSize
            },
            loading: false,
            savePara: {},
            imageUrl: ''
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize
        }
    }

    componentWillMount() {
     
     this.getData(this.searchPara)
     // 页面级权限
     this.setState({auth: Utility.Cookie.getAuth()})
    }
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchResource(val).then((msg) => {
         if (this.props.resource) {
           this.setState({dataSource: this.props.resource.data, pagination: {
                total: this.props.resource.pager.TotalRows,
                showSizeChanger: true,
                onShowSizeChange: (current, pageSize) => {
                    this.searchPara.pageIndex = current
                    this.searchPara.pageSize = pageSize
                    this.getData(this.searchPara)
                },
                onChange: (current) => {
                    this.searchPara.pageIndex = current
                    this.getData(this.searchPara)
                }
           },
           loading: false})
         }
      })
    }

   
    
    // 查询
    onSearch = (value) => {
            this.searchPara.fileType = value.fileType
        

        
         
         
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: {} })
         } else {
            item.UserPassword = ''
            this.setState({ visible: true, savePara: item })
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        
        if (record.Id) {
            this.props.deleteUser({idList: record.Id}).then(msg => {
                if (msg) {
                    message.success('删除成功')
                    this.getData(this.searchPara)
                }
            })
        }
    }
    
    /* ****************************对弹出框form的操作方法********************************** */
    saveFormRef = (form) => {
        this.form = form
    }

    handleCancel = () => {
        this.setState({ visible: false })
    }

    handleCreate = () => {
        const form = this.form
        form.validateFields((err, values) => {
        if (err) {
            return
        }
        
        // 更新
       if (this.state.savePara.Id) {
           values.Id = this.state.savePara.Id
           this.props.updateUser({userInfo: values}).then((msg) => {
               if (msg == 1) {
                  message.success('更新成功')
                  form.resetFields()
                  this.setState({ visible: false })
                  this.getData(this.searchPara)
               } else if (msg == -1) {
                   message.warning('用户名已存在')
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addUser({userInfo: values}).then((msg) => {
             if (msg == 1) {
                message.success('保存成功')
                this.getData(this.searchPara)
             } else if (msg == -1) {
                 message.warning('用户名已存在')
             } else {
                message.warning('保存失败')
             }
              
        })
       }
         form.resetFields()
         this.setState({ visible: false })
     
        
        })
    }


     /* ****************************对弹出框form的操作方法********************************** */

     handleDelete = (item) => {
        console.log('pppppp', this.props)
        this.props.deleteResource({idList: item.PicId}).then(msg => {
            if (msg) {
                this.getData(this.searchPara)
                message.success('删除成功')
            }
        })
     }

     updateDialog = (typ, item) => {
        
    }
     
     // 修改和删除的权限控制
    getAuth = () =>{
        if (this.state.auth.CanDelete == 'none' && this.state.auth.CanModify == 'none') {
            this.DeleteAndModify = ''
        } else if (this.state.auth.CanDelete == 'none') {
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                            <a onClick={this.showDialog.bind(this, '修改', record)}>修改</a>
                        </span>
                        )}
                    />
        } else if (this.state.auth.CanModify == 'none') {
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                             <Popconfirm title="确认删除吗?" onConfirm={this.handleDelete.bind(this, record)} okText="确定" cancelText="取消">
                                <a style={{display: this.state.auth.CanDelete}}>删除</a>
                            </Popconfirm>
                        </span>
                        )}
                    />
        } else {
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                             <Popconfirm title="确认删除吗?" onConfirm={this.handleDelete.bind(this, record)} okText="确定" cancelText="取消">
                                <a style={{display: this.state.auth.CanDelete}}>删除</a>
                            </Popconfirm>
                            <span className="ant-divider" />
                            <a onClick={this.showDialog.bind(this, '修改', record)}>修改</a>
                        </span>
                        )}
                    />
        }
    }

    
    

    render() {
        // 上传方法
        const uploadObj = Utility.getUploadObj()
        uploadObj.onChange = (info) => {
            if (info.file.status !== 'uploading') {
               console.log('aaaaa', info)
            }
            if (info.file.status === 'done') {
                message.success(`上传成功`)
                this.getData(this.searchPara)
                if (info.file.response) {
                // let id = info.file.response.RetObj[0].Id
                // let name = info.file.response.RetObj[0].Name
                }
            } else if (info.file.status === 'error') {
                message.error(`上传失败`)
            }
        }
        this.getAuth()
        
        // 查询条件
        let searchDatasource = [{
            label: '类型',
            name: 'userAccount',
            control: <Select>
            <Option value='1'>图片</Option>
            <Option value='2'>视频</Option>
        </Select>
        }]

        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              <div className="resourceContainer">
                  <div className="everyResource newUpload">
                  <Upload
                    className="avatar-uploader"
                    name="avatar"
                    showUploadList={false}
                    {...uploadObj} 
                >
                    {
                        /*
                    imageUrl ?
                        <img src={imageUrl} alt="" className="avatar" /> :
                        */
                        <Icon type="plus" className="avatar-uploader-trigger" />
                    }
                </Upload>
                  </div>
              {
                             this.state.dataSource.map((cItem, cIndex) => {
                                 return (
                                    <EveryResource handleDelete={this.handleDelete} updateDialog={this.updateDialog} auth={this.state.auth} data={cItem} />
                                 )
                             })
                         }
                 
              </div>
              <Pagination showSizeChanger onChange={this.state.pagination.onChange} onShowSizeChange={this.state.pagination.onShowSizeChange} defaultPageSize={this.state.pagination.defaultPageSize} defaultCurrent={1} total={this.state.pagination.total} />
               </Spin>
           </div>
        )
    }
}

export default Resource
