import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, Popconfirm, Input } from 'antd'
import Dialog from 'COMPONENT/admin/machine/machineConfigDialog'

const { Column } = Table

class MachineConfig extends Component {
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
            savePara: model.Machine.MachindConfigModel,
            payLists: [
                {label: '支付宝支付', value: 'McAlipayEnable'}, 
                {label: '微信支付', value: 'McWpayEnable'}, 
                {label: '纸币收币', value: 'McBillpayEnable'}, 
                {label: '纸币找零', value: 'McBillchangeEnable'}, 
                {label: '硬币收币', value: 'McCoinpayEnable'}, 
                {label: '硬币找零', value: 'McCoinchangeEnable'}, 
                {label: '银联支付', value: 'McUpayEnable'}, 
                {label: 'IC刷卡', value: 'McIcpayEnable'}
            ],
            machineFucLists: [{label: '升降机', value: 'McLiftEnable'}, {label: '光幕检测', value: 'McInfraredEnable'}]
        }



        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize
        }
    }

    componentWillMount() {
     this.getData(this.searchPara)
     // 页面级权限
     let authVal = Utility.Cookie.getAuth()
     this.setState({auth: authVal})
     
     

       this.setState({loading: true})
      
      
    }

    
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchMachineConfig(val).then((msg) => {
         if (this.props.machineConfig) {
           this.setState({dataSource: this.props.machineConfig.data, pagination: {
                total: this.props.machineConfig.pager.TotalRows,
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
           this.setState({ visible: true, savePara: model.Machine.MachineListModel })
         } else {
            item.McStatus = item.McStatus + ''
            item.PayLists = []
            $.each(this.state.payLists, (eIndex, eItem) => {
               
                if (item[eItem.value]) {
                    item.PayLists.push(eItem.value)
                }
            })

            item.MachineFucLists = []
            $.each(this.state.machineFucLists, (eIndex, eItem) => {
                if (item[eItem.value]) {
                    item.MachineFucLists.push(eItem.value)
                }
            })
            console.log('eeeee', item)
            this.setState({ visible: true, savePara: item })
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        
        if (record.MachineId) {
            this.props.deleteMachineConfig({idList: record.MachineId}).then(msg => {
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
         
        if (!this.state.savePara.MachineIdB) {
            return
        }
        
        if (values.PayLists && values.PayLists.length > 0) {
            $.each(values.PayLists, (index, item) => {
                values[item] = 1
            })
        }

        if (values.MachineFucLists && values.MachineFucLists.length > 0) {
            $.each(values.MachineFucLists, (index, item) => {
                values[item] = 1
            })
        }
        values.MachineId = this.state.savePara.MachineIdB

        this.props.addMachineConfig({machineConfigInfo: values}).then((msg) => {
             if (msg) {
                message.success('保存成功')
                this.getData(this.searchPara)
             } else {
                message.warning('保存失败')
             }
              
        })
        // 更新
        /*
       if (this.state.savePara.MachineId) {
           values.MachineId = this.state.savePara.MachineId
           this.props.updateMachineConfig({machineListInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addMachineConfig({machineConfigInfo: values}).then((msg) => {
             if (msg) {
                message.success('保存成功')
                this.getData(this.searchPara)
             } else {
                message.warning('保存失败')
             }
              
        })
       }
        
     * */
        form.resetFields()
        this.setState({ visible: false })
        })
    }

     /* ****************************对弹出框form的操作方法********************************** */
     
     // 修改和删除的权限控制
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
            label: '机器编号',
            name: 'machineId',
            control: <Input placeholder="设备编号" />
        }]

        // 修改时直接绑定参数
        const fields = this.state.savePara
        
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="机器编号"
                        dataIndex="MachineId"
                        key="MachineId"
                    />
                    <Column
                        title="状态"
                        dataIndex="McStatus"
                        key="McStatus"
                        render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="参加活动"
                        dataIndex="McActivity"
                        key="McActivity"
                    />
                    <Column
                        title="支付宝支付"
                        dataIndex="McAlipayEnable"
                        key="McAlipayEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="微信支付"
                        dataIndex="McWpayEnable"
                        key="McWpayEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="纸币收币"
                        dataIndex="McBillpayEnable"
                        key="McBillpayEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                     <Column
                        title="纸币找零"
                        dataIndex="McBillchangeEnable"
                        key="McBillchangeEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                     <Column
                        title="硬币收币"
                        dataIndex="McCoinpayEnable"
                        key="McCoinpayEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                     <Column
                        title="硬币找零"
                        dataIndex="McCoinchangeEnable"
                        key="McCoinchangeEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                     <Column
                        title="银联支付"
                        dataIndex="McUpayEnable"
                        key="McUpayEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="IC刷卡"
                        dataIndex="McIcpayEnable"
                        key="McIcpayEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                     <Column
                        title="升降机"
                        dataIndex="McLiftEnable"
                        key="McLiftEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="光幕检测"
                        dataIndex="McInfraredEnable"
                        key="McInfraredEnable"
                         render={(text, record) => {
                            if (text == '0') {
                                return <i className="fa fa-close" style={{color: '#f61132'}} />
                            } else {
                                return <i className="fa fa-check" style={{color: '#25d508'}} />
                            }
                        }
                      }
                    />
                    <Column
                        title="空间1设定温度"
                        dataIndex="McArea1Temp"
                        key="McArea1Temp"
                    />
                    <Column
                        title="空间2设定温度"
                        dataIndex="McArea2Temp"
                        key="McAre2Temp"
                    />
                    <Column
                        title="空间3设定温度"
                        dataIndex="McArea3Temp"
                        key="McArea3Temp"
                    />
                    <Column
                        title="空间4设定温度"
                        dataIndex="McArea4Temp"
                        key="McArea4Temp"
                    />
                    <Column
                        title="启用货道数"
                        dataIndex="McGoodsUsed"
                        key="McGoodsUsed"
                    />
                    <Column
                        title="经度"
                        dataIndex="McLongitude"
                        key="McLongitude"
                    />
                    <Column
                        title="维度"
                        dataIndex="McDimension"
                        key="McDimension"
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
                        title="机器配置"
                        {...fields}
                        payLists = {this.state.payLists}
                        machineFucLists = {this.state.machineFucLists}
                 />
                </Spin>
           </div>
        )
    }
}

export default MachineConfig
