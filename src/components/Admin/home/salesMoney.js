import React, {Component} from 'react'
import {Tabs, DatePicker} from 'antd'
import { Chart, Geom, Tooltip, Axis } from 'bizcharts'



const TabPane = Tabs.TabPane
const { RangePicker } = DatePicker


class SalesMoney extends Component {
    constructor(props) {
		super(props)
        this.state = {
            payEveryData: [{ month: '1 月', sales: 5000 },
            { month: '2 月', sales: 10000 },
            { month: '3 月', sales: 11000 },
            { month: '4 月', sales: 14000 },
            { month: '5 月', sales: 14000 },
            { month: '6 月', sales: 40000 },
            { month: '7 月', sales: 70000 },
            { month: '8 月', sales: 55000 }]
        }
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {
    }

    onChange = (date, dateString) => {

    }

    periodChosen = (txt, ev) => {

    }

    render() {
        let operations = [<a className='tabExtra' onClick={this.periodChosen.bind(this, '本周')}>本周</a>, <a onClick={this.periodChosen.bind(this, '本月')} className='tabExtra'>本月</a>, <a onClick={this.periodChosen.bind(this, '全年')} className='tabExtra'>全年</a>, <RangePicker onChange={this.onChange} />]
        return (
            <div className="salesMoneyContainer">
                <Tabs tabBarExtraContent={operations}>
    <TabPane tab="销售额" key="1">
        <Chart height={400} data={this.state.payEveryData} forceFit>
                       <Axis name="month" />
                         <Axis name="sales" />
                        <Tooltip crosshairs={{type: 'y'}}/>
                        <Geom type="interval" position="month*sales" />
                    </Chart></TabPane>
  </Tabs>
           </div>
        )
    }
}

export default SalesMoney
