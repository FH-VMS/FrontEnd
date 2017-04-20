import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, Spin, Input, Select } from 'antd'

const { Column } = Table

class SalesCashless extends Component {
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
            loading: false
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
     
    

       // this.setState({searchDatasource: searchDatasource})
     
      
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
                }
           },
           loading: false})
         }
      })
    }
    
    // 查询
    onSearch = (value) => {
          this.searchPara.deviceId = value.deviceId
        

          this.searchPara.payType = value.payType
         
         
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }
    

   
    

     /* ****************************对弹出框form的操作方法********************************** */
     
     // 修改和删除的权限控制
    getAuth = () =>{
        
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
        }]
        
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} onSearch={this.onSearch} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="设备编号"
                        dataIndex="DeviceId"
                        key="DeviceId"
                    />
                    <Column
                        title="销售日期"
                        dataIndex="SalesDate"
                        key="SalesDate"
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
                    />
                     <Column
                        title="交易号"
                        dataIndex="TradeNo"
                        key="TradeNo"
                    />
                     <Column
                        title="交易金额"
                        dataIndex="TradeAmount"
                        key="TradeAmount"
                    />
                    <Column
                        title="交易状态"
                        dataIndex="TradeStatus"
                        key="TradeStatus"
                    />
                     <Column
                        title="客户名称"
                        dataIndex="ClientName"
                        key="ClientName"
                    />
              </Table>
                </Spin>
           </div>
        )
    }
}

export default SalesCashless
