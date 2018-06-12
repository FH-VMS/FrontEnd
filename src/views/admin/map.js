import React, {Component} from 'react'
import { Row, Col, Select, InputNumber } from 'antd'

class MapModule extends Component {
    constructor(props) {
		super(props)
        this.state = {
            machineDic: [],
            longitude: '',
            latitude: ''
        }
	}
    

    componentWillMount() {

    }

    componentDidMount() {
        /*
        var map = new window.BMap.Map('allmap')
        var point = new window.BMap.Point(120.19, 30.26)
        map.enableScrollWheelZoom(true)
        map.centerAndZoom(point, 12)

        function myFun (result) {
            var cityName = result.name
            map.setCenter(cityName)
        }
        var myCity = new window.BMap.LocalCity()
        myCity.get(myFun)


        // var myIcon = new window.BMap.Icon('http://developer.baidu.com/map/jsdemo/img/fox.gif', new window.BMap.Size(300, 157))
        var marker2 = new window.BMap.Marker(point)  // 创建标注
        map.addOverlay(marker2)  
        marker2.addEventListener('mouseover', () => {
            // alert('123')
        })
        */
        this.infoWindow = new window.AMap.InfoWindow({
            offset: new window.AMap.Pixel(0, -25)
        })
        this.map = new window.AMap.Map('allmap')
        var marker = new window.AMap.Marker({
            position: [116.39, 39.9],
            map: this.map
        })
        marker.content = '机器id'
        this.map.add(marker); // 添加到地图
        marker.on('click', this.onMarkerClick)
        this.infoWindow.setContent(marker.content);
        this.infoWindow.open(this.map, marker.getPosition())


        // 取机器字典
     this.props.fetchMachineDic().then(msg => {
         this.setState({machineDic: msg})
     })
        
   }

   onMarkerClick = (e) => {
    this.infoWindow.setContent(e.target.content);
    this.infoWindow.open(this.map, e.target.getPosition())
    
   }

    
    render() {

        return (
            <div className="mapContainer">
                <div className="machineArea">
                    <Row>
                        <Col span={6}>选择机器</Col>
                        <Col span={18}>
                            <Select style={{width: '100%'}} showSearch placeholder='选择机器' optionFilterProp="children" filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0} onChange={this.machineChange}>
                             {
                                this.state.machineDic.map((item, index) => {
                                    return (
                                        <Option value={item.Id}>{item.Name}</Option>
                                      )
                                })
                             }  
                            
                            </Select>
                        </Col>
                    </Row>
                    <Row style={{marginTop: '5px'}}>
                      <Col span={6}>经纬度</Col>
                      <Col span={9}><InputNumber placeholder='经度' onChange={(val) => {this.setState({longitude: val})}} /></Col>
                      <Col span={9}><InputNumber placeholder='纬度' onChange={(val) => {this.setState({latitude: val})}} /></Col>
                    </Row>
                    <Row style={{marginTop: '5px'}}>
                    <Col span={6}>详细地址</Col>
                    <Col span={18}><textarea style={{width: '100%', height: '100px'}}></textarea></Col>
                  </Row>
                </div>
                <div id="allmap">
              
                </div>
           </div>
        )
    }
}

export default MapModule
