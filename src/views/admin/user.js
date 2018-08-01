import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Input, Table, message, Spin, Popconfirm } from 'antd'
import Dialog from 'COMPONENT/admin/user/new'

const { Column } = Table

class User extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            authData: [], // 权限数据
            clientDicData: [], // 客户字典
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
     
      // 权限数据
      this.props.fetchAuthDic().then(msg => {
         this.setState({authData: this.props.userData.authData})
      })
       // 客户字典
       this.props.fetchClientDic().then(msg => {
          
         if (this.props.userData && this.props.userData.clientDic) {
            this.setState({clientDicData: Utility.getTreeClient(this.props.userData.clientDic)})
         }

        
      })
       this.reconstructCount = 0
    }

   
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchUser(val).then((msg) => {
         if (this.props.userData) {
           this.setState({dataSource: this.props.userData.data, pagination: {
                total: this.props.userData.pager.TotalRows,
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
        $.each(data, (index, item) => {
            
            item.key = index + '' + this.reconstructCount
            this.reconstructCount++
            if (item.children && item.children.length > 0) {
                this.recontrustData(item.children)
            } else {
                delete item.children
            }
         })
        this.reconstructCount = 0
        return data

    }
    
    // 查询
    onSearch = (value) => {
            this.searchPara.userName = value.userName
        

          this.searchPara.userAccount = value.userAccount
        
         
         
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: model.User.UserModel })
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

    // 重置
    resetPassword = (record, e) => {
       if (record.Id) {
           this.props.resetPassword({userInfo: record}).then(msg => {
                if (msg) {
                    message.success('重置成功')
                } else {
                    message.success('失败成功')
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
            label: '用户名',
            name: 'userAccount',
            control: <Input placeholder="用户名" />
        },
        {
            label: '姓名',
            name: 'userName',
            control: <Input placeholder="姓名" />
        }]

        // 修改时直接绑定参数
        const fields = this.state.savePara
        let userInfo = Utility.Cookie.getValue('UserInfo')
        let resetColumn = ''
        if (userInfo.Sts == 100) {
            resetColumn = <Column
            title="重置密码"
            key="resetpassword"
            render={(text, record) => (
            <span>
                 <Popconfirm title="确认重置吗?" onConfirm={this.resetPassword.bind(this, record)} okText="确定" cancelText="取消">
                    <a>重置</a>
                </Popconfirm>
            </span>
            )}
        />
        }
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="用户名"
                        dataIndex="UserAccount"
                        key="UserAccount"
                    />
                    <Column
                        title="真实姓名"
                        dataIndex="UserName"
                        key="UserName"
                    />
                    <Column
                        title="所属客户"
                        dataIndex="UserClientName"
                        key="UserClientName"
                    />
                   {this.DeleteAndModify}
                   {resetColumn}
              </Table>
              <Dialog ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="创建用户"
                        authData={this.state.authData}
                        clientDicData={this.state.clientDicData}
                        {...fields}
                 />
                </Spin>
           </div>
        )
    }
}

export default User
