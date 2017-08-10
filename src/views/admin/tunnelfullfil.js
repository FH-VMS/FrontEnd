import React, {Component} from 'react'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Spin, Select, message, Table } from 'antd'
import model from 'STORE/model'

const { Column } = Table


class TunnelFullfil extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            machineDic: [],
            searchDatasource: [],
            cabinetDataSource: [],
            auth: {
                CanAdd: 'none',
                CanDelete: 'none',
                CanModify: 'none',
                CanSearch: 'none'
            },
            pagination: {
                defaultPageSize: model.BaseSetting.PageSize
            }
        }

       this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize
        }
        
    }

    componentWillMount() {
     // 页面级权限
     let authVal = Utility.Cookie.getAuth()
     this.setState({auth: authVal})
     this.setState({loading: true})
     // 取机器字典
     this.props.fetchMachineDic().then(msg => {
         if (this.props.tunnelInfo && this.props.tunnelInfo.machineDic) {
             this.state.machineDic = this.props.tunnelInfo.machineDic
             let searchDatasource = []
             let typeDicSelect = this.state.machineDic.map((item, index) => {
              return (
                <Option value={item.Id}>{item.Name}</Option>
              )
            })
            searchDatasource.push({
                label: '选择机器',
                name: 'machineId',
                control: <Select onChange={this.machineChange}>
                    {typeDicSelect}
                </Select>
            })

             searchDatasource.push({
                label: '机柜',
                name: 'cabinetId',
                control: <Select>
                  
                </Select>
            })
            
             this.setState({searchDatasource: searchDatasource, loading: false})
             
         }
     })

     this.nowPosition = 0
    }

    machineChange = (value) => {
        let chosenItem = ''
        $.each(this.state.machineDic, (index, item) => {
          if (item.Id == value) {
              chosenItem = item
              return false
          }
        })
        if (chosenItem && chosenItem.children) {
             let typeDicSelect = chosenItem.children.map((item, index) => {
              return (
                <Option value={item.Id}>{item.Name}</Option>
              )
            })

            if (this.state.searchDatasource.length == 2) {
                this.state.searchDatasource.splice(1, 1)
            }
             this.state.searchDatasource.push({
                label: '机柜',
                name: 'cabinetId',
                control: <Select>
                    {typeDicSelect}
                </Select>
            })
            this.setState({searchDatasource: this.state.searchDatasource})
        }
    }
    

    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchFullfilTunnel(val).then((msg) => {
         if (this.props.tunnelInfo) {
           this.setState({dataSource: this.props.tunnelInfo.data, pagination: {
                total: this.props.tunnelInfo.pager.TotalRows,
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
       if (!value.machineId) {
           message.warning('请选择机器')
           return
       }

       if (!value.cabinetId) {
           message.warning('请选择机柜')
           return
       }
       this.searchPara.machineId = value.machineId
       this.searchPara.cabinetId = value.cabinetId
       this.searchPara.pageIndex = 1
       this.getData(this.searchPara)
       
       
    }
    
  



    render() {
       
        
        return (
             <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={this.state.searchDatasource} onSearch={this.onSearch} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="货道编号"
                        dataIndex="TunnelId"
                        key="TunnelId"
                    />
                    <Column
                        title="当前缺货"
                        dataIndex="MaxPuts"
                        key="MaxPuts"
                        render={(text, record) => {
                            console.log('ppppp', record)
                            if (record.CurrStock == '' || record.CurrStock == null) {
                                return record.MaxPuts
                            } else {
                                return parseInt(text, 0) - parseInt(record.CurrStock, 0)
                            }
                        }
                      }
                    />
              </Table>
                </Spin>
           </div>
        )
    }
}

export default TunnelFullfil
