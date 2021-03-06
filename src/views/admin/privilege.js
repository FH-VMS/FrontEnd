import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, Popconfirm, Input, Select } from 'antd'
import Dialog from 'COMPONENT/admin/privilege/privilegeDialog'

const { Column } = Table

class Privilege extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: [],
            dialogTitle: '添加优惠券',
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
            searchDatasource: [],
            privilegeTypeDic: [],
            timeRuleDic: [],
            privilegeGroupDic: []
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize
        }
    }

    /* *********************拷贝机器操作方法******************************* */
    saveCopyFormRef = (form) => {
        this.copyForm = form
    }


    componentWillMount() {
     
     this.getData(this.searchPara)
     
     // 页面级权限
     this.setState({auth: Utility.Cookie.getAuth()})
     
     // 查询条件
        let searchDatasource = [{
            label: '优惠券名称',
            name: 'privilegeName',
            control: <Input placeholder="优惠券名称" />
        },
        {
            label: '所属客户',
            name: 'clientName',
            control: <Input placeholder="所属客户" />
        }]

       // this.setState({searchDatasource: searchDatasource})
 
      this.props.fetchDic({id: 'privilegetype'}).then(msg => {
          if (msg) {
            let typeDicSelect = msg.map((item, index) => {
              return (
                <Option value={item.Value}>{item.BookChinese}</Option>
              )
            })

            searchDatasource.push({
                label: '券类型',
                name: 'privilegeType',
                control: <Select>
                    {typeDicSelect}
                </Select>
            })

            this.setState({searchDatasource: searchDatasource, machineTypeDic: msg, loading: false, privilegeTypeDic: msg})
          }
      })
      this.props.fetchDic({id: 'privilegegroup'}).then(msg => {
        if (msg) {
          this.setState({loading: false, privilegeGroupDic: msg})
        }
    })
      
    }

    getTimeRuleDic = () => {
        this.props.fetchDic({id: 'timerule'}).then(msg => {
            if (msg) {
              this.setState({timeRuleDic: msg})
            }
        })
    }

    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchPrivilegeList(val).then((msg) => {
         if (this.props.privilege) {
           this.setState({dataSource: this.props.privilege.data, pagination: {
                total: this.props.privilege.pager.TotalRows,
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

    componentDidMount() {
        this.getTimeRuleDic()
    }
    
    // 查询
    onSearch = (value) => {
          this.searchPara.privilegeName = value.privilegeName
        

          this.searchPara.privilegeType = value.privilegeType
          this.searchPara.clientName = value.clientName
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: {}, dialogTitle: '添加优惠券' })
         } else {
             if (parseFloat(item.Discount, 0) == 0) {
                item.Discount = ''
             }
             if (parseFloat(item.Money, 0) == 0) {
                item.Money = ''
             }
            this.setState({ visible: true, savePara: item, dialogTitle: '修改优惠券' })
         }
         
    }
    
    

    // 删除
    handleDelete = (record, e) => {
        if (record.PrivilegeId) {
            this.props.deletePrivilegeList({idList: record.PrivilegeId}).then(msg => {
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
        if (values.ExpireTime) {
            values.ExpireTime = Utility.timeFormaterString(values.ExpireTime)
        }
        if (values.StartTime) {
            values.StartTime = Utility.timeFormaterString(values.StartTime)
        }
        if (values.IsBind) {
            values.IsBind = 1
        }

        if (values.IsOverlay) {
            values.IsOverlay = 1
        }
        
        // 更新
       if (this.state.savePara.PrivilegeId) {
           values.PrivilegeId = this.state.savePara.PrivilegeId
           this.props.updatePrivilegeList({privilegeInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addPrivilegeList({privilegeInfo: values}).then((msg) => {
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
        
        

        // 修改时直接绑定参数
        const fields = this.state.savePara
        
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={this.state.searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="名称"
                        dataIndex="PrivilegeName"
                        key="PrivilegeName"
                    />
                    <Column
                        title="类型"
                        dataIndex="PrincipleTypeText"
                        key="PrincipleTypeText"
                    />
                    <Column
                        title="金额"
                        dataIndex="Money"
                        key="Money"
                    />
                    <Column
                        title="金额限制"
                        dataIndex="UseMoneyLimit"
                        key="UseMoneyLimit"
                        render={(text, record) => {
                            if (text) {
                                return text
                            } else {
                                return '-'
                            }
                        }
                        }
                    />
                    <Column
                        title="折扣"
                        dataIndex="Discount"
                        key="Discount"
                        render={(text, record) => {
                            if (text) {
                                return text
                            } else {
                                return '-'
                            }
                        }
                        }
                    />
                     <Column
                        title="券数量"
                        dataIndex="Numbers"
                        key="Numbers"
                    />
                    <Column
                        title="时间规则"
                        dataIndex="TimeRuleText"
                        key="TimeRuleText"
                    />
                      <Column
                        title="过期时间"
                        dataIndex="ExpireTime"
                        key="ExpireTime"
                        render={(text, record) => {
                            if (text == '0001-01-01T00:00:00') {
                                return ''
                            } else {
                                return text.replace('T', ' ')
                            }
                        }
                        }
                    />
                     <Column
                        title="是否绑定商品"
                        dataIndex="IsBind"
                        key="IsBind" render={(text, record) => {
                            if (text) {
                                return '是'
                            } else {
                                return '否'
                            }
                        }
                    }
                    />
                     <Column
                        title="开始活动"
                        dataIndex="StartTime"
                        key="StartTime"
                        render={(text, record) => {
                            if (text == '0001-01-01T00:00:00') {
                                return ''
                            } else {
                                return text.replace('T', ' ')
                            }
                        }
                      }
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
                        title={this.state.dialogTitle}
                        {...fields}
                        privilegeTypeDic={this.state.privilegeTypeDic}
                        privilegeGroupDic={this.state.privilegeGroupDic}
                        timeRuleDic={this.state.timeRuleDic}
                        fetchProductDic={this.props.fetchProductDic}
                 />
                </Spin>
           </div>
        )
    }
}

export default Privilege
