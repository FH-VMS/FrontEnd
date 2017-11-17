import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, Spin, Input, Select, Popconfirm, DatePicker } from 'antd'
import Dialog from 'COMPONENT/admin/sales/refundDialog'

const { Column } = Table

const { RangePicker } = DatePicker

class SalesCashless extends Component {
    constructor(props) {
		super(props)
        let oneWeekDate = this.defaultRangeDate()
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
            refundDetail: {},
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
    
     defaultRangeDate = () => {
        var now = new Date() 
        var nowTime = now.getTime() 
        var day = now.getDay()
        var oneDayLong = 24 * 60 * 60 * 1000 
        if (day == 0) {
            day = 7
        }

        var MondayTime = nowTime - (day - 1) * oneDayLong 
        var SundayTime = nowTime + (7 - day) * oneDayLong

        
        var monday = new Date(MondayTime)
        var sunday = new Date(SundayTime)
        return [Utility.dateFormaterObj(monday), Utility.dateFormaterObj(sunday)]
    }

    
    // 取数据方法
    getData = (val) => {
        this.setState({loading: true})
        
      
       this.props.fetchCashlessList(val).then((msg) => {
         if (this.props.salesCashless) {
           this.setState({dataSource: this.props.salesCashless.data, pagination: {
                total: this.props.salesCashless.pager.TotalRows,
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
          this.searchPara.deviceId = value.deviceId
          this.searchPara.payType = value.payType
         if (value.salesDate) {
            this.searchPara.salesDate = Utility.dateFormaterString(value.salesDate[0]) + '^' + Utility.dateFormaterString(value.salesDate[1])
         } else {
             this.searchPara.salesDate = Utility.dateFormaterString(this.state.defaultRange[0]) + '^' + Utility.dateFormaterString(this.state.defaultRange[1])
         }
          
          this.searchPara.tradeStatus = value.tradeStatus
          this.searchPara.tradeNo = value.tradeNo
         this.searchPara.pageIndex = 1
         
         this.getData(this.searchPara)
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
    }
    

    RefundDetail = (record, ev) => {
      let orderNoVal = ''
      let typeVal = ''
      if (record.PayType == '微信') {
        orderNoVal = record.TradeNo
        typeVal = 'w'
      } else if (record.PayType == '支付宝') {
         orderNoVal = record.ComId
         typeVal = 'a'
      } else {
          return
      }
      this.props.fetchRefundDetail({orderNo: orderNoVal, typ: typeVal}).then(()=> {
         
         try {
           this.setState({ visible: true, refundDetail: JSON.parse(this.props.salesCashless.refundDetail.RefundDetail), outTradeNo: record.TradeNo, payType: typeVal })
         } catch (e) {

         }
         
      })
      
    }


    MannualRefund = (record, ev) => {
       this.props.postRefund({lstTradeNo: [record.TradeNo]}).then(msg => {
           if (msg) {
              setTimeout(() => {
                   this.searchPara.pageIndex = 1
                   this.getData(this.searchPara)
              }, 2000)
             
           }
       })
    }

    handleCancel = () => {
        this.setState({ visible: false })
    }

    handleCreate = () => {
        this.setState({ visible: false })
    }
    

     /* ****************************对弹出框form的操作方法********************************** */
     
     // 修改和删除的权限控制
    getAuth = () => {
        
    }
    

    render() {
        this.getAuth()

        
 // 查询条件
        let searchDatasource = [{
            label: '设备编号',
            name: 'deviceId',
            control: <Input placeholder="设备编号" />
        },
        {
            label: '支付方式',
            name: 'payType',
            control: <Select placeholder="支付方式">
                    <Option value="支付宝">支付宝</Option>
                    <Option value="微信">微信</Option>
                </Select>
        },
        {
            label: '状态',
            name: 'tradeStatus',
            control: <Select placeholder="状态">
                    <Option value="1">待出货</Option>
                    <Option value="2">已出货</Option>
                    <Option value="5">出货失败</Option>
                    <Option value="6">已退款</Option>
                </Select>
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
                        dataIndex="DeviceId"
                        key="DeviceId"
                    />
                     <Column
                        title="货道编号"
                        dataIndex="GoodsId"
                        key="GoodsId"
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
                        title="数量"
                        dataIndex="SalesNumber"
                        key="SalesNumber"
                    />
                    <Column
                        title="支付者"
                        dataIndex="Payer"
                        key="Payer"
                    />
                    <Column
                        title="支付方式"
                        dataIndex="PayType"
                        key="PayType"
                    />
                    <Column
                        title="支付时间"
                        dataIndex="PayDate"
                        key="PayDate"
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
                        dataIndex="TradeAmount"
                        key="TradeAmount"
                    />
                    <Column
                        title="手续费"
                        dataIndex="ServiceCharge"
                        key="ServiceCharge"
                    />
                     <Column
                        title="客户名称"
                        dataIndex="ClientName"
                        key="ClientName"
                    />
                    <Column
                        title="交易状态"
                        dataIndex="TradeStatus"
                        key="TradeStatus"
                        render={(text, record) => {
                            if (text == '1') {
                                return '待出货'
                            } else if (text == '2') {
                                return '已出货'
                            } else if (text == 3) {
                                return <span style={{color: 'red'}}>未退款(部分失败)</span>
                            } else if (text == 4) {
                                return <span style={{color: 'green'}}>已退款(部分失败)</span>
                            } else if (text == 5) {
                                return <span style={{color: 'red'}}>出货失败</span>
                            } else if (text == 6) {
                                return <span style={{color: 'green'}}>已退款</span>
                            }
                        }
                      }
                    />
                     <Column
                        title="退款详情"
                        dataIndex="RefundDetail"
                        render={(text, record) => {
                            if (record.TradeStatus == 4 || record.TradeStatus == 6) {
                                return <a onClick={this.RefundDetail.bind(this, record)}>退款详情</a>
                            } else if (record.TradeStatus == 5 || record.TradeStatus == 1) {
                                return <Popconfirm title="确认手动退款?" onConfirm={this.MannualRefund.bind(this, record)} okText="确定" cancelText="取消"><a>手动退款</a></Popconfirm>
                            }
                            
                        }
                      }
                    />
                    
              </Table>
                </Spin>
                 <Dialog 
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="退款详情"
                        tradeNo={this.state.outTradeNo}
                        refundDetail={this.state.refundDetail}
                        payType={this.state.payType}
                       
                 />
           </div>
        )
    }
}

export default SalesCashless
