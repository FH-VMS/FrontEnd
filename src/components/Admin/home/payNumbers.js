import React, {Component} from 'react'
import { Chart, Geom, Tooltip } from 'bizcharts'




class PayNumbers extends Component {
    constructor(props) {
        super(props)
        this.state = {
            payTotalNumbers: 0,
            successReate: '100%',
            payEveryData: [{ year: '2018/02/28', sales: 38 },
            { year: '2018/03/01', sales: 52 },
            { year: '2018/03/02', sales: 61 },
            { year: '2018/03/03', sales: 145 },
            { year: '2018/03/04', sales: 48 },
            { year: '2018/03/05', sales: 38 },
            { year: '2018/03/06', sales: 38 },
            { year: '2018/03/07', sales: 38 }]
        }
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {
        this.generateTotalPayNumbers()
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

    render() {
       return (
            <div>
                <div className="homeSecondTitle">
                    总支付笔数
                </div>
                <div className="totalNumberSize">{this.state.payTotalNumbers}</div>
                <Chart padding={[ 0, 0, 0, 0]} height={178} data={this.state.payEveryData} forceFit>
                    <Tooltip crosshairs={{type: 'y'}}/>
                    <Geom type="interval" position="year*sales" />
                </Chart>
                <div className="homeFooter">
                    <span>成功转化率</span><span>{this.state.successReate}</span>
                </div>
           </div>
        )
    }
}

export default PayNumbers
