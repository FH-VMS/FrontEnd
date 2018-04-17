import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Input, Table, message, Spin, Popconfirm, Icon, Upload, Button } from 'antd'
import Dialog from 'COMPONENT/admin/pay/payConfigDialog'
const { Column } = Table

class PayConfig extends Component {
	constructor(props) {
		super(props)
        this.state = {
            visible: false,
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
            savePara: model.Pay.ConfigModel,
            searchDatasource: [],
            clientDicData: [],
            fileList: []
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
     
     // 查询条件
        let searchDatasource = [{
            label: '名称',
            name: 'Name',
            control: <Input placeholder="名称" />
        }]
        
        this.setState({searchDatasource: searchDatasource})
        
    }
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchPayConfigList(val).then((msg) => {
         if (this.props.payConfig) {
          
           this.setState({dataSource: this.props.payConfig.data, pagination: {
                total: this.props.payConfig.pager.TotalRows,
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
          this.searchPara.name = value.Name
         
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: model.Pay.ConfigModel })
         } else {
             if (item.Cabinets) {
                 item.CabinetList = []
                 $.each(item.Cabinets, (index, eItem) => {
                    item.CabinetList.push(eItem.CabinetId)
                 })
             }
            this.setState({ visible: true, savePara: item })
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        if (record.Id == 1) {
           message.warning('默认配置，不可删除')
        } else {
            this.props.deletePayConfig({idList: record.Id}).then(msg => {
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
        if (values.CabinetList && values.CabinetList.length > 0) {
            values.Cabinets = []
            $.each(values.CabinetList, (index, item) => {
                values.Cabinets.push({CabinetId: item})
            })
        }
        // 更新
       if (this.state.savePara.Id) {
           values.Id = this.state.savePara.Id
           this.props.updatePayConfig({configInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addPayConfig({configInfo: values}).then((msg) => {
             if (msg) {
                message.success('保存成功')
                this.getData(this.searchPara)
             } else {
                message.warning('保存失败')
             }
              
        })
       }
        
     
        form.resetFields()
        this.setState({ visible: false })
        })
    }

    getTreeClient = (data) => {
            $.each(data, (index, item) => {
                item.label = item.Name
            
                item.value = item.Id
                item.key = item.Id
                delete item.Name
                delete item.Id
                if (item.children && item.children.length > 0) {
                this.getTreeClient(item.children)
                } else {
                    delete item.children
                }
            })
            return data
    }

    componentDidMount() {
         // 客户字典
       this.props.fetchClientDic().then(msg => {
        
        if (msg) {
            this.setState({clientDicData: this.getTreeClient(msg), loading: false})
        }

        
        })
    }



     /* ****************************对弹出框form的操作方法********************************** */
     
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
    
    getUploadObj = (mchId, id) => {
        let uploadObj = {...Utility.getUploadWxCertObj(mchId, id)}
        uploadObj.onChange = (info) => {
            console.log('aaaa', info)
            this.setState({loading: true, fileList: info.fileList})
            if (info.file.status !== 'uploading') {

            }
            if (info.file.response && info.file.response.RetCode == 1) {
                message.success(`上传成功`)
                this.getData(this.searchPara)
                if (info.file.response) {
                // let id = info.file.response.RetObj[0].Id
                // let name = info.file.response.RetObj[0].Name
                }
                this.setState({loading: false, fileList: []})
            } else if (info.file.response) {
                message.error(info.file.response.RetMsg)
                this.setState({loading: false, fileList: []})
            }
        }

        return uploadObj
    }


    render() {
        this.getAuth()
        
         // 上传方法
         
         

        // 修改时直接绑定参数
        const fields = this.state.savePara
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={this.state.searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="名称"
                        dataIndex="Name"
                        key="Name"
                    />
                    <Column
                        title="微信是否配置"
                        dataIndex="WxAppId"
                        key="WxAppId"
                         render={(text, record) => {
                            if (text) {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            } else {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="支付宝是否配置"
                        dataIndex="AliParter"
                        key="AliParter"
                         render={(text, record) => {
                            if (text) {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            } else {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="微信证书"
                        dataIndex="WxSslcertPath"
                        key="WxSslcertPath"
                        render={(text, record) => {
                            if (text) {
                                return <div><span style={{marginRight: '5px'}}><i className="fa fa-check" style={{color: '#25d508'}} /></span> 
                                <Upload 
                                showUploadList={false}
                                {...this.getUploadObj(record.WxMchId, record.Id)} 
                                fileList={this.state.fileList}
                                >
                                <Button>
                                  <Icon type="upload" /> 上传证书
                                </Button>
                              </Upload>
                              </div>
                            } else {
                                return <div><span style={{marginRight: '5px'}}><i className="fa fa-close" style={{color: '#f61132'}} /></span> 
                                <Upload 
                                showUploadList={this.state.loading}
                                {...this.getUploadObj(record.WxMchId, record.Id)} 
                                fileList={this.state.fileList}
                                >
                                <Button>
                                  <Icon type="upload" /> 上传证书
                                </Button>
                              </Upload>
                              </div>
                            }
                        }
                    }
                />
                   {this.DeleteAndModify}
              </Table>
                </Spin>
                <Dialog ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="支付配置"
                        fetchDic={this.props.fetchDic}
                        cabinetsList={this.state.cabinetsList}
                        {...fields}
                        clientDicData = {this.state.clientDicData}
                 />
           </div>
        )
    }
}


export default PayConfig

