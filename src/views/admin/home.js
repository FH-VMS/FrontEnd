import React, {Component} from 'react'
// import Utility from 'UTIL/utility'
import { Chart, Geom, Tooltip, Coord, Label, Axis } from 'bizcharts'
import DataSet from '@antv/data-set'

const { DataView } = DataSet

const dv = new DataView()
const cols = {
    percent: {
      formatter: val => {
        val = (val * 100) + '%'
        return val
      }
    }
  }

  const colPayNum = {
    'sales': {tickInterval: 20}
  }


// var echarts = require('echarts')

class Home extends Component {
    constructor(props) {
		super(props)
        this.state = {
            machineSituationData: [],
            totalMachine: 0,
            payTotalNumbers: 0,
            successReate: '100%',
            payEveryData: [{ year: '1951 年', sales: 38 },
            { year: '1952 年', sales: 52 },
            { year: '1956 年', sales: 61 },
            { year: '1957 年', sales: 145 },
            { year: '1958 年', sales: 48 },
            { year: '1959 年', sales: 38 },
            { year: '1960 年', sales: 38 },
            { year: '1962 年', sales: 38 }]
        }
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {
        $('.childrenContainer').css('background-color', '#dcdedd')
        this.generateMachineSituation()
        this. generateTotalPayNumbers()
        this.generateGroupMoney()
        // this.generateIncome()
        // this.generateDynamicData()
        // this.generateTotalMoney()
    }

    generateMachineSituation = () => {
       
        this.props.fetchTotalMachineCount().then(msg => {
            if (this.props.totalMoney.totalMachine) {
                let countData = JSON.parse(this.props.totalMoney.totalMachine)
                this.setState({machineSituationData: [
                    { item: '在线', count: parseInt(countData[2].VALS, 0) },
                    { item: '离线', count: parseInt(countData[1].VALS, 0) },
                    { item: '未启用', count: parseInt(countData[0].VALS, 0) }
                  ], totalMachine: parseInt(countData[2].VALS, 0) + parseInt(countData[1].VALS, 0) + parseInt(countData[0].VALS, 0)})
            }
        })
       
    }

    generateTotalPayNumbers = () => {
        this.props.fetchPayNumbers().then(msg => {
            let numbers = this.props.totalMoney.payNumbers
           if (numbers) {
              let successNum = 0
              let totalNum = 0
              for (var i = 0; i < numbers.length; i++) {
                 if (numbers[i].Name == 2) {
                    successNum = numbers[i].Data
                 }
                 totalNum = totalNum + parseInt(numbers[i].Data, 0)

              }

              this.setState({payTotalNumbers: totalNum, successReate: ((successNum / totalNum) * 100).toFixed(2) + '%'})
           }
        })
    }

    generateGroupMoney = () => {
        console.log('ddddd', new Date().format('yyyy-MM-dd hh:mm:ss'))
        this.props.fetchGroupMoney({salesDateStart: '2017/12/01', salesDateEnd: '2018/03/08', type: 'month'}).then(msg => {

        })
    }

    generateIncome = () => {
        /*
        // 基于准备好的dom，初始化echarts实例
        let myChart = echarts.init(document.getElementById('dynamicData'))
        let nowWeek = Utility.getCurrentWeekDate()
         this.props.fetchAmountByMachine({salesDateStart: Utility.dateFormaterString(nowWeek[0]), salesDateEnd: Utility.dateFormaterString(nowWeek[1])}).then(msg => {
                if (this.props.totalMoney && this.props.totalMoney.amountByMachine) {
                    let finalData = JSON.parse(this.props.totalMoney.amountByMachine)
                    let xData = []
                    let yData = []
                    $.each(finalData, (index, item) => {
                        xData.push(item.MACHINE_ID)
                        yData.push(item.TOTAL)
                    })
                    // 绘制图表
                    myChart.setOption({
                        title: {
                            text: '当前周销售额',
                            x: 'center',
                            subtext: ''
                        },
                        color: ['#3398DB'],
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis: [
                            {
                                type: 'category',
                                data: xData,
                                axisTick: {
                                    alignWithLabel: true
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                name: '销售额',
                                type: 'bar',
                                barWidth: '40%',
                                data: yData
                            }
                        ]
                    })
                }
         })
         */
        
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

    showMachineSituation = (arr) => {
        dv.source(arr).transform({
            type: 'percent',
            field: 'count',
            dimension: 'item',
            as: 'percent'
        })
    }

    render() {

        this.showMachineSituation(this.state.machineSituationData)
      
        return (
            <div className="homeContainer">
               <div>
                <div className="homeTitle">机器情况</div>
               <Chart height={200} data={dv} scale={cols} padding={[ 8 ]} forceFit>
               <Coord type='theta' radius={0.75} />
               <Axis name="percent" />
               <Tooltip 
                 showTitle={false} 
                 itemTpl='<li><span style="background-color:{color};" class="g2-tooltip-marker"></span>{name}: {value}</li>'
                 />
               <Geom
                 type="intervalStack"
                 position="percent"
                 color={['item', [ '#54bd14', '#ea0e3c', '#71E3E3']]}
                 tooltip={['item*percent', (item, percent) => {
                   percent = (percent * 100).toFixed(2) + '%'
                   return {
                     name: item,
                     value: percent
                   }
                 }]}
                 style={{lineWidth: 1, stroke: '#fff'}}
                 >
                 <Label content={['item*count', (item, count) => {
                   // percent = percent * 100 + '%'
                   return item + ':' + count
                 }]} />
               </Geom>
             </Chart>
             <div className="homeFooter">
                 <span>总机器数量</span><span>{this.state.totalMachine}</span>
             </div>
               </div>
               <div>
                   <div className="homeSecondTitle">
                       总支付笔数
                   </div>
                   <div className="totalNumberSize">{this.state.payTotalNumbers}</div>
                   <Chart padding={[ 0, 0, 0, 0]} height={178} data={this.state.payEveryData} scale={colPayNum} forceFit>
                        <Tooltip crosshairs={{type: 'y'}}/>
                        <Geom type="interval" position="year*sales" />
                    </Chart>
                    <div className="homeFooter">
                        <span>成功转化率</span><span>{this.state.successReate}</span>
                    </div>
               </div>
               <div></div>
               <div></div>
           </div>
        )
    }
}

export default Home
