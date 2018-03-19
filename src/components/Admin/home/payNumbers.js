import React, {Component} from 'react'
import { Chart, Geom, Tooltip } from 'bizcharts'




class PayNumbers extends Component {
    constructor(props) {
        super(props)
        this.state = {
            payTotalNumbers: 0,
            successReate: '100%',
            payEveryData: []
        }
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {
        this.generateTotalPayNumbers()
        this.generatePayNumberByDate()
    }

    generateTotalPayNumbers = () => {
        this.props.fetchPayNumbers().then(msg => {
            let numbers = this.props.data.payNumbers
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


    generatePayNumberByDate = () => {
        let date = new Date()
        let year = date.getFullYear()
        let month = date.getMonth() + 1
        let day = date.getDate()
        let hour = date.getHours()
        let minute = date.getMinutes()
        let second = date.getSeconds()

        let endDate = year + '/' + month + '/' + day + ' ' + hour + ':' + minute + ':' + second
        let date2 = new Date(date)
        date2.setDate(date2.getDate() - 7)
        let startDate = date2.getFullYear() + '/' + (date2.getMonth() + 1) + '/' + date2.getDate() + ' 00:00:00'
        this.props.fetchPayNumbersByDate({salesDateStart: startDate, salesDateEnd: endDate, type: 'day'}).then(msg => {
            if (this.props.data.payNumbersByDate) {
                let data = this.props.data.payNumbersByDate
                data.map((item, index) => {
                    item.Data = parseInt(item.Data, 0)
                })
               this.setState({payEveryData: data})
            }
        })
    }

    render() {
       return (
            <div>
                <div className="homeSecondTitle">
                    总支付笔数
                </div>
                <div className="totalNumberSize">{this.state.payTotalNumbers}</div>
                <Chart padding={[ 0, 10, 0, 10]} height={178} data={this.state.payEveryData} forceFit>
                    <Tooltip crosshairs={{type: 'y'}}/>
                    <Geom type="interval" position="Name1*Data" />
                </Chart>
                <div className="homeFooter">
                    <span>成功转化率</span><span>{this.state.successReate}</span>
                </div>
           </div>
        )
    }
}

export default PayNumbers
