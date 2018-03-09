import React, {Component} from 'react'
import { Chart, Geom, Tooltip, Coord, Shape } from 'bizcharts'
import DataSet from '@antv/data-set'
const { View } = DataSet

function getTextAttrs(cfg) {
    return Object.assign({}, {
        fillOpacity: cfg.opacity,
        fontSize: cfg.origin._origin.size,
        rotate: cfg.origin._origin.rotate,
        text: cfg.origin._origin.text,
        textAlign: 'center',
        fontFamily: cfg.origin._origin.font,
        fill: cfg.color,
        textBaseline: 'Alphabetic'
    }, cfg.style)
}

// 给point注册一个词云的shape
Shape.registerShape('point', 'cloud', {
    drawShape(cfg, container) {
        const attrs = getTextAttrs(cfg)
        return container.addShape('text', {
            attrs: Object.assign(attrs, {
                x: cfg.x,
                y: cfg.y
            })
        })
    }
})

const scale = {
    x: {nice: false},
    y: {nice: false}
  }
class ProductCloud extends Component {
    constructor(props) {
		super(props)
	}
    

    componentWillMount() {
       

    }

    componentDidMount() {

    }
    
    showGroupProduct = (arr) => {
       
       
    }

    render() {
        let dv = new View().source(this.props.data)
       
         let range = dv.range('Data')
         
         let min = range[0]
         let max = range[1]
         dv.transform({
             type: 'tag-cloud',
             fields: ['Name', 'Data'],
             font: 'Verdana',
             padding: 0,
             timeInterval: 5000, // max execute time
             rotate() {
                 let random = ~~(Math.random() * 4) % 4
                 if (random == 2) {
                     random = 0
                 }
                 return random * 90 // 0, 90, 270
             },
             fontSize(d) {
                 if (d.value) {
                     return ((d.value - min) / (max - min)) * (80 - 70) + 5
                 }
                 return 0
             }
         })
        
      
        return (

            <div>
                <div className="homeSecondTitle">
                    近三月商品销量热度
                </div>
                <Chart height={215} data={dv} scale={scale} padding={[ 0 ]} forceFit>
                <Tooltip showTitle={false}/>
                <Coord reflect="y" />
                <Geom type='point' position="x*y" color="Name" shape='cloud' tooltip='Data*Name'/>
              </Chart>
                <div className="homeFooter">
                    <span>Top 1</span>
                    <span>{this.props.data[0] ? this.props.data[0].Name : ''}</span><span>{this.props.data[0] ? this.props.data[0].Data : ''}</span>
                </div>
           </div>
        )
    }
}

export default ProductCloud
