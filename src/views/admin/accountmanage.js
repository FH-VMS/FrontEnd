import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Input, Table, message, Spin, Popconfirm, Tooltip } from 'antd'
import Dialog from 'COMPONENT/admin/accountmanage/dialog'
import QrDialog from 'COMPONENT/admin/accountmanage/qrcodeDialog'
const { Column } = Table

class AccountManage extends Component {
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
            accountDicData: [],
            qrVisible: false, 
            qrNowItem: ''
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
            name: 'name',
            control: <Input placeholder="名称" />
        }]
        
        this.setState({searchDatasource: searchDatasource})
        
    }
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchAccountManage(val).then((msg) => {
         if (this.props.accountManage) {
          
           this.setState({dataSource: this.props.accountManage.data, pagination: {
                total: this.props.accountManage.pager.TotalRows,
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
            this.props.deleteAccountManage({idList: record.Id}).then(msg => {
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
           this.props.updateAccountManage({accountInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addAccountManage({accountInfo: values}).then((msg) => {
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

    componentDidMount() {
         // 客户字典
       this.props.fetchClientDic().then(msg => {
        
        if (msg) {
            this.setState({clientDicData: Utility.getTreeClient(msg), loading: false})
        }

        
        })

        this.props.fetchCanDistributeDic().then(msg => {
            if (msg) {
                this.setState({accountDicData: msg, loading: false})
            }
        })
    }


    showQrcode = (item) => {
        this.setState({qrVisible: true, qrNowItem: item})
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
                        title="所属分账配置"
                        dataIndex="PayConfigName"
                        key="PayConfigName"
                    />
                    <Column
                        title="微信配置"
                        dataIndex="WxConfig"
                        key="WxConfig"
                         render={(text, record) => {
                            if (record.UserOpenid && record.WxUserName) {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            } else {
                                return <Tooltip placement="top" title={'生成二维码'}><div onClick={this.showQrcode.bind(this, record)}><i className="fa fa-close" style={{color: '#f61132'}} /><i className="fa fa-qrcode"></i></div></Tooltip>
                            }
                        }
                      }
                    />
                    
                    <Column
                        title="支付宝配置"
                        dataIndex="AliConfig"
                        key="AliConfig"
                         render={(text, record) => {
                            if (record.AliAccount && record.AliUserName) {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            } else {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="微信费率"
                        dataIndex="WxRate"
                        key="WxRate"
                    />
                    <Column
                        title="支付宝费率"
                        dataIndex="AliRate"
                        key="AliRate"
                    />
                   {this.DeleteAndModify}
              </Table>
                </Spin>
                <Dialog ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="账户配置"
                        {...fields}
                        clientDicData = {this.state.clientDicData}
                        accountDicData = {this.state.accountDicData}
                 />
                 <QrDialog 
                 visible={this.state.qrVisible}
                 onQrCreate = {() => {this.setState({qrVisible: false})}}
                 onQrCancel = {() => {this.setState({qrVisible: false})}}
                 qrNowItem = {this.state.qrNowItem}
                 title='微信分账配置二维码'
              />
           </div>
        )
    }
}


export default AccountManage
