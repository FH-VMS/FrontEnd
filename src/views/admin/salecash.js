import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, Spin, Input, DatePicker } from 'antd'

const { Column } = Table

const { RangePicker } = DatePicker

class SaleCash extends Component {
    constructor(props) {
		super(props)
        let oneWeekDate = Utility.getCurrentWeekDate()
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
            outTradeNo: '',
            payType: '',
            description: '统计金额需选定时间范围，',
            defaultRange: oneWeekDate
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize,
            salesDate: Utility.dateFormaterString(oneWeekDate[0]) + '^' + Utility.dateFormaterString(oneWeekDate[1])
        }
    }

    componentWillMount() {
     
     this.getData(this.searchPara)
     // 页面级权限
     this.setState({auth: Utility.Cookie.getAuth()})
     
    

       // this.setState({searchDatasource: searchDatasource})
     
      
    }
    // 取数据方法
    getData = (val) => {
        this.setState({loading: true})
        
        val.salesType = 1
       this.props.fetchCashList(val).then((msg) => {
         if (this.props.saleCash) {
             let totalCount = this.state.total
             if (this.props.saleCash.pager) {
                totalCount = this.props.saleCash.pager.TotalRows
             }
           this.setState({dataSource: this.props.saleCash.data, pagination: {
                total: totalCount,
                showSizeChanger: true,
                onShowSizeChange: (current, pageSize) => {
                    this.searchPara.pageIndex = current
                    this.searchPara.pageSize = pageSize
                    this.getData(this.searchPara)
                },
                onChange: (current) => {
                    this.searchPara.pageIndex = current
                    this.getData(this.searchPara)
                },
                showTotal: (total) => `${this.state.description}共 ${total} 行`
           },
           loading: false
           })
         }
      })
      
     
    }
    
    // 查询
    onSearch = (value) => {
          this.searchPara.machineId = value.machineId
         if (value.salesDate) {
            this.searchPara.salesDate = Utility.dateFormaterString(value.salesDate[0]) + '^' + Utility.dateFormaterString(value.salesDate[1])
         } else {
             this.searchPara.salesDate = Utility.dateFormaterString(this.state.defaultRange[0]) + '^' + Utility.dateFormaterString(this.state.defaultRange[1])
         }
          
          this.searchPara.tradeStatus = value.tradeStatus
          this.searchPara.tradeNo = value.tradeNo
         this.searchPara.pageIndex = 1
         
         this.getData(this.searchPara)
         /*
          if (this.searchPara.salesDate) {
          this.props.fetchSalesMoney({salesDate: this.searchPara.salesDate}).then(msg => {
              if (msg) {
                  let arrMoney = JSON.parse(msg).map((item, index) => {
                      return item.PAY_INTERFACE + ':' + item.TOTALMONEY + ',手续费:' + item.SERVICECHARGE
                  })
                  this.setState({description: arrMoney.join(';') + ';'})
              }
          })
      } else {
           this.setState({description: '统计金额需选定时间范围，'})
      }
      */
    }
    


     /* ****************************对弹出框form的操作方法********************************** */
     
     // 修改和删除的权限控制
    getAuth = () => {
        
    }
    

    render() {
        this.getAuth()

        
 // 查询条件
        let searchDatasource = [{
            label: '机器编号',
            name: 'machineId',
            control: <Input placeholder="机器编号" />
        },
        {
            label: '销售日期',
            name: 'salesDate',
            control: <RangePicker />
        },
        {
            label: '单号',
            name: 'tradeNo',
            control: <Input placeholder="交易单号" />
        }]
        
        let fields = {salesDate: this.state.defaultRange}
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} defaultValue={fields} onSearch={this.onSearch} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="设备编号"
                        dataIndex="MachineId"
                        key="MachineId"
                    />
                    <Column
                        title="设备名称"
                        dataIndex="MachineName"
                        key="MachineName"
                    />
                     <Column
                        title="货道编号"
                        dataIndex="GoodsId"
                        key="GoodsId"
                    />
                    <Column
                        title="商品名"
                        dataIndex="WaresName"
                        key="WaresName"
                    />
                    <Column
                        title="数量"
                        dataIndex="SalesNumber"
                        key="SalesNumber"
                    />
                    <Column
                        title="销售日期"
                        dataIndex="SalesDate"
                        key="SalesDate"
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
                        title="商户交易号"
                        dataIndex="TradeNo"
                        key="TradeNo"
                    />
                     <Column
                        title="交易金额"
                        dataIndex="SalesPrices"
                        key="SalesPrices"
                    />
                    
                    <Column
                        title="交易状态"
                        dataIndex="TradeStatus"
                        key="TradeStatus"
                        render={(text, record) => {
                                return '已出货'
                        }
                      }
                    />
                    
              </Table>
                </Spin>
           </div>
        )
    }
}

export default SaleCash
