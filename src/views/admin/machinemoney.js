import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, DatePicker } from 'antd'

const { Column } = Table
const { RangePicker } = DatePicker

class MachineMoney extends Component {
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
            searchDatasource: [{
                label: '统计日期',
                name: 'salesDate',
                control: <RangePicker defaultValue={oneWeekDate}/>
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
      let oneWeekDate = this.defaultRangeDate()
    
     this.searchPara.salesDateStart = Utility.dateFormaterString(oneWeekDate[0])
     this.searchPara.salesDateEnd = Utility.dateFormaterString(oneWeekDate[1])
     this.getData(this.searchPara)
      
    }
    
    componentDidMount() {
    }

    defaultRangeDate = () => {
        var now = new Date() 
        var nowTime = now.getTime() 
        var day = now.getDay()
        var oneDayLong = 24 * 60 * 60 * 1000 


        var MondayTime = nowTime - (day - 1) * oneDayLong 
        var SundayTime = nowTime + (8 - day) * oneDayLong

        
        var monday = new Date(MondayTime)
        var sunday = new Date(SundayTime)
        return [Utility.dateFormaterObj(monday), Utility.dateFormaterObj(sunday)]
    }
     
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchAmountByMachine(val).then((msg) => {
         if (this.props.machineMoney) {
           this.setState({dataSource: JSON.parse(this.props.machineMoney.amountByMachine.data), pagination: {
                total: this.props.machineMoney.amountByMachine.pager.TotalRows,
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
        console.log('pppppp', value)
         if (!value.salesDate) {
             message.warning('时间范围不能为空')
             return
         }
         this.searchPara.salesDateStart = Utility.dateFormaterString(value.salesDate[0]) 
         this.searchPara.salesDateEnd = Utility.dateFormaterString(value.salesDate[1])
         this.searchPara.pageIndex = 1
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
                        title="机器编号"
                        dataIndex="MACHINE_ID"
                        key="MACHINE_ID"
                    />
                     <Column
                        title="名称"
                        dataIndex="REMARK"
                        key="REMARK"
                    />
                    <Column
                        title="销售额"
                        dataIndex="TOTAL"
                        key="TOTAL"
                    />

                    <Column
                        title="手续费"
                        dataIndex="SERVICECHARGE"
                        key="SERVICECHARGE"
                    />
              </Table>
                </Spin>
           </div>
        )
    }
}

export default MachineMoney
