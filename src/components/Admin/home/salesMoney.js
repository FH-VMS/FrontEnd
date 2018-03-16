import React, {Component} from 'react'
import {Tabs, DatePicker, Table, Avatar} from 'antd'
import { Chart, Geom, Tooltip, Axis } from 'bizcharts'
import Utility from 'UTIL/utility'
const { Column } = Table


const TabPane = Tabs.TabPane
const { RangePicker } = DatePicker

class SalesMoney extends Component {
    constructor(props) {
		super(props)
        this.state = {
            payEveryData: [],
            name: 'Name2',
            rangeDate: [],
            machineData: []
        }
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {
        setTimeout(() => {
        this.periodChosen('近七日')
        }, 1500)
    }

    setValueForPiacker = (startDate, endDate) => {
        this.setState({rangeDate: [Utility.dateFormaterObj(new Date(startDate)), Utility.dateFormaterObj(new Date(endDate))]})
    }

    onChange = (date, dateString) => {

    }

    periodChosen = (txt, ev) => {
        if (ev) {
            $('.tabExtra').removeClass('aChosen')
            $(ev.target).addClass('aChosen')
        }
       
       let startDate = ''
       let endDate = ''
       let date = new Date()
       let year = date.getFullYear()
       let month = date.getMonth() + 1
       let day = date.getDate()
       let typ = 'day'
       switch (txt) {
         case '近七日':
         let hour = date.getHours()
         let minute = date.getMinutes()
         let second = date.getSeconds()
 
        endDate = year + '/' + month + '/' + day + ' ' + hour + ':' + minute + ':' + second
         let date2 = new Date(date)
         date2.setDate(date2.getDate() - 7)
          startDate = date2.getFullYear() + '/' + (date2.getMonth() + 1) + '/' + date2.getDate() + ' 00:00:00'
         
         break
         case '本月':
         startDate = year + '/' + month + '/01'
         endDate = year + '/' + month + '/' + new Date(year, month - 1 + 1, 0).getDate() + ' 23:59:59'
         break
         case '全年':
         typ = 'month'
         startDate = year + '/01/01'
         endDate = year + '/12/31' + ' 23:59:59'
         break
       }
      
       this.generateGroupMoney(startDate, endDate, typ)
       this.generateGroupMoneyByMachine(startDate, endDate)
       this.setValueForPiacker(startDate, endDate)
    }

    generateGroupMoney = (startDate, endDate, typ) => {
        this.props.fetchGroupMoney({salesDateStart: startDate, salesDateEnd: endDate, type: typ}).then(msg => {
            let tData = this.props.data.groupMoney
            let fData = []
            
            
            if (typ == 'month') {
                for (let i = 0;i < tData.length;i++) {
                   fData.push({Name: tData[i].Name1, Data: parseFloat(tData[i].Data)})
               }
            } else {
                 for (let i = 0;i < tData.length;i++) {
                   fData.push({Name: tData[i].Name2, Data: parseFloat(tData[i].Data)})
               }
                
            }
            console.log('pppppp', fData)
            this.setState({payEveryData: fData})
        })
    }

    generateGroupMoneyByMachine = (startDate, endDate) => {
        this.props.fetchGroupMoneyByMachine({salesDateStart: startDate, salesDateEnd: endDate}).then(msg => {
            this.setState({machineData: this.props.data.groupMoneyByMachine})
        })
    }

    render() {
        let operations = [<a className='tabExtra aChosen' onClick={this.periodChosen.bind(this, '近七日')}>近七日</a>, <a onClick={this.periodChosen.bind(this, '本月')} className='tabExtra'>本月</a>, <a onClick={this.periodChosen.bind(this, '全年')} className='tabExtra'>全年</a>, <RangePicker value={this.state.rangeDate} onChange={this.onChange} />]
        return (
            <div className="salesMoneyContainer">
                <Tabs tabBarExtraContent={operations}>
                <TabPane tab="销售额" key="1">
                <div className="chartAndMachineSales">
                    <div> 
                           <div className="homeTitle" style={{paddingLeft: '30px'}}>
                                销售额走势
                            </div>
                            <Chart padding={[50]} height={400} data={this.state.payEveryData} forceFit>
                                <Axis name='Name' />
                                <Axis name="Data" />
                                <Tooltip crosshairs={{type: 'y'}}/>
                                <Geom type="interval" position="Name*Data" />
                            </Chart>
                            
                        </div>
                        <div> 
                            <div className="homeTitle" style={{marginBottom: '20px', paddingLeft: '5px'}}>
                                机器销售额排行榜
                            </div>
                        <Table dataSource={this.state.machineData} pagination={false} showHeader={false}>
                            <Column
                                    title="序号"
                                    key="index"
                                    render={(text, record, index) => (
                                    <span>
                                        <Avatar size="small" style={{ backgroundColor: '#303030' }}>{index + 1}</Avatar>
                                    </span>
                                    )}
                                />
                                <Column
                                    title="名称"
                                    key="Name"
                                    dataIndex="Name"
                                />
                                <Column
                                    title="金额"
                                    dataIndex="Data"
                                    key="Data"
                                />
                                </Table>
                        </div>
                    </div>
                    </TabPane>
                </Tabs>
           </div>
        )
    }
}

export default SalesMoney
