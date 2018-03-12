import React, {Component} from 'react'
import { Chart, Geom, Tooltip, Axis, Coord, Label } from 'bizcharts'
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


class MachineSituation extends Component {
    constructor(props) {
        super(props)
        this.state = {
            machineSituationData: [],
            totalMachine: 0
        }
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {
        this.generateMachineSituation()
    }

    generateMachineSituation = () => {
        
         this.props.fetchTotalMachineCount().then(msg => {
             if (this.props.data.totalMachine) {
                 let countData = JSON.parse(this.props.data.totalMachine)
                 this.setState({machineSituationData: [
                     { item: '在线', count: parseInt(countData[2].VALS, 0) },
                     { item: '离线', count: parseInt(countData[1].VALS, 0) },
                     { item: '未启用', count: parseInt(countData[0].VALS, 0) }
                   ], totalMachine: parseInt(countData[2].VALS, 0) + parseInt(countData[1].VALS, 0) + parseInt(countData[0].VALS, 0)})
             }
         })
        
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
        )
    }
}

export default MachineSituation
