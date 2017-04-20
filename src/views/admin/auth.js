import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, Popconfirm } from 'antd'
import Dialog from 'COMPONENT/admin/auth/dialog'

const { Column } = Table

class Auth extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: [],
            rankData: [], // 权限等级
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
            savePara: model.User.UserModel,
            menusData: []
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
     
      // 权限等级字典
      this.props.fetchRank({id: 'rank'}).then(msg => {
           this.setState({rankData: msg})
      })
     
    }
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchAuth(val).then((msg) => {
           
         if (this.props.auth) {
           this.setState({dataSource: this.props.auth.data, pagination: {
                total: this.props.auth.pager.TotalRows,
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
         this.searchPara.userName = value.userName
         this.searchPara.userAccount = value.userAccount
         this.searchPara.pageIndex = 1
         this.getData(value)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: model.User.UserModel, menusData: this.props.commonInfo.menus })
         } else {
             // var menus = this.props.commonInfo.menus
             // $.each()
            this.setState({ visible: true, savePara: item, menusData: item.lstAuthRelate })
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        
        if (record.Id) {
            this.props.deleteAuth({idList: record.Id}).then(msg => {
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

    handleCreate = (authTemplate, e) => {
        const form = this.form
        form.validateFields((err, values) => {
        if (err) {
            return
        }
      
        let saveData = []
        $.each(authTemplate, (pIndex, pItem) => {
           
            if (pItem.Menus) {
                $.each(pItem.Menus, (cIndex, cItem) => {
                     if (!cItem.Checked) {
                            return true
                        }
                    saveData.push({MenuId: cItem.MenuId, Add: cItem.Add, Del: cItem.Del, Sear: cItem.Sear, Mod: cItem.Mod})
                })
            }
           
        })
        console.log('aaaaaaaaaaaaa', saveData)
        // 更新
       
       if (this.state.savePara.Id) {
           values.Id = this.state.savePara.Id
           if (!isNaN(parseInt(values.rank, 10))) {
               this.state.savePara.Rank = values.rank
           }
           this.props.updateAuth({id: values.Id, name: values.name, rank: this.state.savePara.Rank, lstAuthInfo: saveData}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addAuth({name: values.name, rank: values.rank, lstAuthInfo: saveData}).then((msg) => {
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

    onChange = (e) => {
    console.log(`checked = ${e.target.checked}`)
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
        let searchDatasource = []

        // 修改时直接绑定参数
        const fields = this.state.savePara

        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="模板名称"
                        dataIndex="DmsName"
                        key="DmsName"
                    />
                    <Column
                        title="等级"
                        dataIndex="RankName"
                        key="RankName"
                    />
                   {this.DeleteAndModify}
              </Table>
              <Dialog ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="创建权限模板"
                        menus={this.state.menusData}
                        {...fields}
                        rankData={this.state.rankData}
                    
                 />
                </Spin>
           </div>
        )
    }
}

export default Auth
