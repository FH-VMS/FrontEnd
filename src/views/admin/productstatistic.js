import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, DatePicker, Input } from 'antd'

const { Column } = Table
const { RangePicker } = DatePicker

class ProductStatistic extends Component {
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
            searchDatasource: [{
                label: '统计日期',
                name: 'salesDate',
                control: <RangePicker defaultValue={oneWeekDate}/>
            },
            {
                label: '机器编号',
                name: 'machineId',
                control: <Input />
            },
            {
                label: '商品名称',
                name: 'waresName',
                control: <Input />
            }],
            defaultRange: oneWeekDate
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize,
            needPage: true
        }
    }

    componentWillMount() {
     // 页面级权限
     this.setState({auth: Utility.Cookie.getAuth()})
      let oneWeekDate = Utility.getCurrentWeekDate()
    
     this.searchPara.salesDateStart = Utility.dateFormaterString(oneWeekDate[0])
     this.searchPara.salesDateEnd = Utility.dateFormaterString(oneWeekDate[1])
     this.getData(this.searchPara)
      
    }
    
    componentDidMount() {
    }
/* 
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
     
    */
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchProductStatistic(val).then((msg) => {
         if (this.props.statistic && this.props.statistic.pager.TotalRows > 0) {
           this.setState({dataSource: JSON.parse(this.props.statistic.data), pagination: {
                total: this.props.statistic.pager.TotalRows,
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
         } else {
             this.setState({loading: false, dataSource: [], pagination: {total: 0}})
         }
      })
     
    }
    
    // 查询
    onSearch = (value) => {
         if (!value.salesDate) {
             message.warning('时间范围不能为空')
             return
         }
         this.searchPara.salesDateStart = Utility.dateFormaterString(value.salesDate[0]) 
         this.searchPara.salesDateEnd = Utility.dateFormaterString(value.salesDate[1])
         this.searchPara.productName = value.waresName
         this.searchPara.pageIndex = 1
         this.searchPara.machineId = value.machineId
         this.getData(this.searchPara)
    }
    

    
    
    /* ****************************对弹出框form的操作方法********************************** */


    handleCancel = () => {
        this.setState({ visible: false })
    }


     /* ****************************对弹出框form的操作方法********************************** */
     
    

    render() {
         let fields = {salesDate: this.state.defaultRange}
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={this.state.searchDatasource} defaultValue={fields} onSearch={this.onSearch} />
              
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="商品名称"
                        dataIndex="WARES_NAME"
                        key="WARES_NAME"
                    />
                     <Column
                        title="金额"
                        dataIndex="AMOUNT"
                        key="AMOUNT"
                    />
                    <Column
                        title="销售笔数"
                        dataIndex="PAYNUMBERS"
                        key="PAYNUMBERS"
                    />

              </Table>
                </Spin>
           </div>
        )
    }
}

export default ProductStatistic
