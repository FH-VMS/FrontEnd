import React, {Component} from 'react'

import {Icon} from 'antd'
import SalesMoney from 'COMPONENT/Admin/home/salesMoney'
import ProductCloud from 'COMPONENT/Admin/home/productCloud'
import PayNumbers from 'COMPONENT/Admin/home/payNumbers'
import MachineSituation from 'COMPONENT/Admin/home/machineSituation'





// var echarts = require('echarts')

class HomeOther extends Component {
    constructor(props) {
		super(props)
        this.state = {
            threeMonthMoney: [{Data: 1}, {Data: 1}, {Data: 1}],
            groupProductData: [{Data: 1}, {Data: 1}]
        }
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {
        $('#childrenContainer').removeClass('childrenContainer')
        // this.generateMachineSituation()
        this.generateGroupMoney()
        this.generateGroupProduct()
        // this.generateIncome()
        // this.generateDynamicData()
        // this.generateTotalMoney()
    }

    generateGroupMoney = () => {
        let date = new Date()
        let year = date.getFullYear()
        let month = date.getMonth() + 1
        let day = date.getDate()
        let hour = date.getHours()
        let minute = date.getMinutes()
        let second = date.getSeconds()

        let endDate = year + '/' + month + '/' + day + ' ' + hour + ':' + minute + ':' + second
        let endMonth = month - 2
        let endYear = year
        if (endMonth < 1) {
            endMonth = 12 + endMonth
            endYear = endYear - 1
        }
        let startDate = endYear + '/' + endMonth + '/01' + ' 00:00:00'
        this.props.fetchGroupMoney({salesDateStart: startDate, salesDateEnd: endDate, type: 'month'}).then(msg => {
     
            this.setState({threeMonthMoney: msg})
        })
    }

    generateGroupProduct = () => {
        let date = new Date()
        let year = date.getFullYear()
        let month = date.getMonth() + 1
        let day = date.getDate()
        let hour = date.getHours()
        let minute = date.getMinutes()
        let second = date.getSeconds()

        let endDate = year + '/' + month + '/' + day + ' ' + hour + ':' + minute + ':' + second
        let endMonth = month - 2
        let endYear = year
        if (endMonth < 1) {
            endMonth = 12 + endMonth
            endYear = endYear - 1
        }
        let startDate = endYear + '/' + endMonth + '/' + day + ' 00:00:00'
        this.props.fetchGroupProduct({salesDateStart: startDate, salesDateEnd: endDate}).then(msg => {
            let tmpData = []
            this.props.totalMoney.groupProduct.map((item, index) => {
                if (item.Name) {
                    // item.Data = parseInt(item.Data, 0)
                    tmpData.push(item)
                }
            })
            this.setState({groupProductData: tmpData})
        })
    }




    componentWillUpdate(nextProps, nextState) {

    }

    componentDidUpdate(prevProps, prevState) {

    }

    componentWillUnmount() {

    }

    

    shouldComponentUpdate(nextProps, nextState) { // 组件判断是否重新渲染时调用
        return true
    }

    

    render() {

       

        let monthCompare = ((this.state.threeMonthMoney[1].Data / this.state.threeMonthMoney[0].Data) - 1) * 100
      
        return (
            <div>
            <div className="homeContainer">
               <div>
                   <MachineSituation data={this.props.totalMoney} fetchTotalMachineCount={this.props.fetchTotalMachineCount}/>
               </div>
               <div>
                   <PayNumbers data={this.props.totalMoney} fetchPayNumbers={this.props.fetchPayNumbers} fetchPayNumbersByDate={this.props.fetchPayNumbersByDate}/>
               </div>
               <div>
                    <div className="homeTitle">
                       近三月销售额
                   </div>
                   {
                       this.state.threeMonthMoney.map((item, index) => {
                           return (<div className="totalNumberSize" style={{fontSize: '18px', marginBottom: '5px'}}>{item.Name1 + ': '}¥{item.Data}</div>)
                       })
                   }
                  
                    <div className="homeFooter" style = {{marginTop: '120px'}}>
                        <span>月环比</span><span>{monthCompare.toFixed(2) + '%'} <Icon type={monthCompare < 0 ? 'caret-down' : 'caret-up'} style={{color: monthCompare < 0 ? '#ea0e3c' : '#54bd14'}} /></span>
                    </div>
               </div>
               <div>

                 <ProductCloud data={this.state.groupProductData} />
               </div>
           </div>
           <SalesMoney fetchGroupMoneyByMachine={this.props.fetchGroupMoneyByMachine} data={this.props.totalMoney} fetchGroupMoney={this.props.fetchGroupMoney} />
           </div>
        )
    }
}

export default HomeOther
