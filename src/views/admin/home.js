import React, {Component} from 'react'

var echarts = require('echarts')

class Home extends Component {
    constructor(props) {
		super(props)
        this.state = {
            aliMoney: 0,
            wxMoney: 0
        }
	}
    

    componentWillMount() {
     

    }

    componentDidMount() {
        this.generateMachineSituation()
        // this.generateIncome()
        this.generateDynamicData()
        this.generateTotalMoney()
    }

    generateTotalMoney = () => {
         this.props.fetchTotalMoney().then(msg => {
            if (this.props.totalMoney && this.props.totalMoney.data && this.props.totalMoney.data instanceof Array) {
                let aliM = 0
                let wxM = 0
                
                this.props.totalMoney.data.map((item, index) => {
                    
                    if (item.AliAccount) {
                        aliM = aliM + parseFloat(item.AliAccount)
                    }
                    if (item.WxAccount) {
                        wxM = wxM + item.WxAccount
                    }
                    
                })

                this.setState({aliMoney: aliM, wxMoney: wxM})
            }
        })
    }

    generateMachineSituation = () => {
       // 基于准备好的dom，初始化echarts实例
        let myChart = echarts.init(document.getElementById('machineSituation'))
        this.props.fetchTotalMachineCount().then(msg => {
            if (this.props.totalMoney.totalMachine) {
                let countData = JSON.parse(this.props.totalMoney.totalMachine)
                
                 // 绘制图表
                myChart.setOption({
                    title: {
                        text: '机器情况',
                        x: 'center',
                        subtext: parseInt(countData[0].VALS, 0) + parseInt(countData[1].VALS, 0) + parseInt(countData[2].VALS, 0)
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['未启用', '离线', '在线']
                    },
                    series: [
                        {
                            name: '机器情况',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: [
                                {
                                    value: parseInt(countData[0].VALS, 0), 
                                    name: '未启用',
                                    itemStyle: {
                                        normal: {
                                            // 设置扇形的颜色
                                            color: '#E6E6E2',
                                            shadowBlur: 10,
                                            shadowColor: 'rgba(0, 0, 0, 0.1)'
                                        }
                                    }
                                },
                                {value: parseInt(countData[1].VALS, 0), name: '离线'},
                                {
                                    value: parseInt(countData[2].VALS, 0), 
                                    name: '在线',
                                    itemStyle: {
                                        normal: {
                                            // 设置扇形的颜色
                                            color: '#54bd14',
                                            shadowBlur: 10,
                                            shadowColor: 'rgba(0, 0, 0, 0.1)'
                                        }
                                    }
                                }
                                 
                            ]
                        }
                    ]
                })
            }
        })
       
    }

    generateIncome = () => {
        // 基于准备好的dom，初始化echarts实例
        let myChart = echarts.init(document.getElementById('incomeSituation'))
        // 绘制图表
        myChart.setOption({
            title: {
                text: '收入情况',
                x: 'center',
                subtext: '共248534元'
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
                    data: ['现金', '支付宝', '微信', 'IC刷卡', '其它'],
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
                    name: '收入',
                    type: 'bar',
                    barWidth: '40%',
                    data: [10, 128900, 118900, 334, 390]
                }
            ]
        })
    }


    generateDynamicData = () => {
         let myChart = echarts.init(document.getElementById('dynamicData'))
        function randomData() {
            now = new Date(+now + oneDay)
            value = value + Math.random() * 21 - 10
            return {
                name: now.toString(),
                value: [
                    [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                    Math.round(value)
                ]
            }
        }

        var data = []
        var now = +new Date(1997, 9, 3)
        var oneDay = 24 * 3600 * 1000
        var value = Math.random() * 1000
        for (var i = 0; i < 1000; i++) {
            data.push(randomData())
        }

        let option = {
            title: {
                text: '动态数据',
                x: 'center'
            },
            tooltip: {
                trigger: 'axis',
                formatter: function (params) {
                    params = params[0]
                    var date = new Date(params.name)
                    return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1]
                },
                axisPointer: {
                    animation: false
                }
            },
            xAxis: {
                type: 'time',
                splitLine: {
                    show: false
                }
            },
            yAxis: {
                type: 'value',
                boundaryGap: [0, '100%'],
                splitLine: {
                    show: false
                }
            },
            series: [{
                name: '模拟数据',
                type: 'line',
                showSymbol: false,
                hoverAnimation: false,
                data: data
            }]
        }

        myChart.setOption(option)

        setInterval(function () {

            for (var i = 0; i < 5; i++) {
                data.shift()
                data.push(randomData())
            }

            myChart.setOption({
                series: [{
                    data: data
                }]
            })
        }, 1000)
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
        return (
            <div className="homeContainer">
               <div>
                  <div style={{borderRight: '5px solid #eee' }}>
                     <div id="machineSituation" className="everyChartsHeight"></div>
                  </div>
                  <div style={{borderLeft: '5px solid #eee' }}>
                       <h4 style={{fontWeight: 'bold'}}>余额</h4>
                      <div id="incomeSituation" className="everyChartsHeight">
                         
                          <div><div>支付宝余额：</div><div>{this.state.aliMoney}</div></div>
                          <div><div>微信余额：</div><div>{this.state.wxMoney}</div></div>
                      </div>
                  </div>
               </div>
               <div>
                  <div className="everyChartsHeight" id = "dynamicData" style={{marginTop: '10px', borderTop: '10px solid #eee'}}>
                      
                  </div>
               </div>
           </div>
        )
    }
}

export default Home
