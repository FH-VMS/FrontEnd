import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Input, Table, message, Spin, Popconfirm } from 'antd'
import Dialog from 'COMPONENT/admin/customer/dialog'

const { Column } = Table

class Customer extends Component {
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
            savePara: model.User.UserModel
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
     
      // table选择框
      this.dataSource = {}
    }
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchCustomer(val).then((msg) => {
         if (this.props.customer) {
           this.setState({dataSource: this.props.customer.data, pagination: {
                total: this.props.customer.pager.TotalRows,
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
    

    recontrustData = (data) => {
        for (var i = 0; i < data.length; i++) {
            if (this.dataSource[data[i].ClientFatherId]) {
                this.dataSource[data[i].ClientFatherId].push(data[i])
            } else {
                this.dataSource[data[i].ClientFatherId] = []
                this.dataSource[data[i].ClientFatherId].push(data[i])
            }
        }
       
       return this.iterate(this.dataSource, Utility.Cookie.getValue('UserInfo').UserClientId)
    }

    iterate = (data, clientId) => {
        if (data[clientId]) {
            for (let i = 0; i < data[clientId].length; i++) {
                if (data[data[clientId][i].Id]) {
                    data[clientId][i].children = []
                    data[clientId][i].children = data[data[clientId][i].Id]
                    this.iterate(data, data[clientId][i].Id)
                }
            }
        }

       return data[Utility.Cookie.getValue('UserInfo').UserClientId]
    }



    
    // 查询
    onSearch = (value) => {
         this.searchPara.userName = value.userName
         this.searchPara.userAccount = value.userAccount
         this.searchPara.pageIndex = 1
         this.getData(value)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: model.User.UserModel })
         } else {
            this.setState({ visible: true, savePara: item })
         }
         
    }

    
    // 删除
    handleDelete = (record, e) => {
        
        if (record.Id) {
            this.props.deleteCustomer({idList: record.Id}).then(msg => {
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
           this.props.updateCustomer({customerInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addCustomer({customerInfo: values}).then((msg) => {
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
        
        // 查询条件
        let searchDatasource = [{
            label: '客户名称',
            name: 'ClientName',
            control: <Input placeholder="客户名称" />
        }]

        // 修改时直接绑定参数
        const fields = this.state.savePara

        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="名称"
                        dataIndex="ClientName"
                        key="ClientName"
                    />
                    <Column
                        title="状态"
                        dataIndex="ClientStatus"
                        key="ClientStatus"
                    />
                    <Column
                        title="类别"
                        dataIndex="ClientType"
                        key="ClientType"
                    />
                    <Column
                        title="联系人"
                        dataIndex="ClientContect"
                        key="ClientContect"
                    />
                    <Column
                        title="联系电话"
                        dataIndex="ClientTel"
                        key="ClientTel"
                    />
                     <Column
                        title="邮箱"
                        dataIndex="ClientEmail"
                        key="ClientEmail"
                    />
                    <Column
                        title="国家"
                        dataIndex="ClientCountry"
                        key="ClientCountry"
                    />
                    <Column
                        title="货币"
                        dataIndex="ClientCurrency"
                        key="ClientCurrency"
                    />
                    <Column
                        title="客户地址"
                        dataIndex="ClientAddress"
                        key="ClientAddress"
                    />
                     <Column
                        title="创建日期"
                        dataIndex="CreateDate"
                        key="CreateDate"
                        render={(text, record) => {
                            if (text == '0001-01-01T00:00:00') {
                                return ''
                            } else {
                                return text.replace('T', ' ')
                            }
                        }
                      }
                    />
                   {this.DeleteAndModify}
              </Table>
              <Dialog ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="创建客户"
                        {...fields}
                 />
                </Spin>
           </div>
        )
    }
}

export default Customer
