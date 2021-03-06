import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, Input, Select } from 'antd'
import Dialog from 'COMPONENT/admin/machine/machineTransDialog'

const { Column } = Table

class MachineTrans extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: [],
            dialogTitle: '迁移机器',
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
            savePara: model.Machine.MachindListModel,
            searchDatasource: [],
            machineTypeDic: [],
            clientDicData: []
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
            label: '机器编号',
            name: 'machineId',
            control: <Input placeholder="机器编号" />
        },
        {
            label: '客户名称',
            name: 'clinetName',
            control: <Input placeholder="客户名称" />
        },
        {
            label: '登录账号',
            name: 'userAccount',
            control: <Input placeholder="登录账号" />
        }]

       // this.setState({searchDatasource: searchDatasource})
     
      this.props.fetchMachineTypeDic().then(msg => {
          if (msg) {
            let typeDicSelect = msg.map((item, index) => {
              return (
                <Option value={item.Id}>{item.Name}</Option>
              )
            })

            searchDatasource.push({
                label: '机型',
                name: 'typeId',
                control: <Select>
                    {typeDicSelect}
                </Select>
            })

            this.setState({searchDatasource: searchDatasource, machineTypeDic: msg})
          }
      })
      this.setState({loading: true})
      // 客户字典
       this.props.fetchClientDic().then(msg => {
          
         if (msg) {
            this.setState({clientDicData: this.getTreeClient(msg), loading: false})
         }

        
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
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchMachineList(val).then((msg) => {
         if (this.props.machineList) {
           this.setState({dataSource: this.props.machineList.data, pagination: {
                total: this.props.machineList.pager.TotalRows,
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
          this.searchPara.machineId = value.machineId
        

          this.searchPara.clinetName = value.clinetName
          this.searchPara.userAccount = value.userAccount
          this.searchPara.typeId = value.typeId
         
         
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           // this.setState({ visible: true, savePara: model.Machine.MachineListModel, dialogTitle: '添加机器' })
         } else {
             
            this.setState({ visible: true, savePara: item, dialogTitle: '修改机器' })
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        
        if (record.MachineId) {
            this.props.deleteMachineList({idList: record.MachineId}).then(msg => {
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
       if (this.state.savePara.MachineId) {
           values.MachineId = this.state.savePara.MachineId
           this.props.updateMachineList({machineListInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           /*
           this.props.addMachineList({machineListInfo: values}).then((msg) => {
             if (msg) {
                message.success('保存成功')
                this.getData(this.searchPara)
             } else {
                message.warning('保存失败')
             }
              
        })
        */
       }
        
     
        form.resetFields()
        this.setState({ visible: false })
        })
    }

     /* ****************************对弹出框form的操作方法********************************** */
     
    // 修改和删除的权限控制
    getAuth = () =>{
       
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                            <a onClick={this.showDialog.bind(this, '修改', record)}>迁移</a>
                        </span>
                        )}
                    />
        
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
                        title="机器编号"
                        dataIndex="MachineId"
                        key="MachineId"
                    />
                     <Column
                        title="名称"
                        dataIndex="Remark"
                        key="Remark"
                    />
                    <Column
                        title="机型"
                        dataIndex="TypeText"
                        key="TypeText"
                    />

                    <Column
                        title="所属客户"
                        dataIndex="ClientText"
                        key="ClientText"
                    />
                     <Column
                        title="当前状态"
                        dataIndex="LatestOnline"
                        key="LatestOnline"
                        render={(text, record) => {
                            if (text) {
                                if (parseInt(text, 0) > 900) {
                                  return <span style={{color: 'red'}}>离线</span>
                                } else {
                                  return <span style={{color: 'green'}}>在线</span>
                                }
                                
                            } else {
                                return '未启用'
                            }
                        }
                      }
                    />
                    <Column
                        title="登录账号"
                        dataIndex="UserAccountName"
                        key="UserAccountName"
                    />
                    <Column
                        title="启用日期"
                        dataIndex="StartDate"
                        key="StartDate"
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
                        title="停用日期"
                        dataIndex="StopDate"
                        key="StopDate"
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
                        title="创建人"
                        dataIndex="Creator"
                        key="Creator"
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
                    <Column
                        title="更新者"
                        dataIndex="Updater"
                        key="Updater"
                    />
                     <Column
                        title="更新日期"
                        dataIndex="UpdateDate"
                        key="UpdateDate"
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
                        clientDicData ={this.state.clientDicData}
                        fetchUserByClientId={this.props.fetchUserByClientId}
                        fetchPayConfigByClientId={this.props.fetchPayConfigByClientId}
                 />
                </Spin>
           </div>
        )
    }
}

export default MachineTrans
