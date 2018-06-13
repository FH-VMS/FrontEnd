import React, {Component} from 'react'
import { Row, Col, Select, InputNumber, Button, message } from 'antd'

// const RadioGroup = Radio.Group
const ButtonGroup = Button.Group

class MapModule extends Component {
    constructor(props) {
		super(props)
        this.state = {
            machineDic: [],
            longitude: '',
            latitude: '',
            radioValue: 1,
            closestCross: '',
            closetRoad: '',
            closetPoi: '',
            machineId: '',
            nowRecord: {}
        }
	}
    

    componentWillMount() {

    }

    // 初始化定位
    initPosition = () => {
        this.map.plugin('AMap.Geolocation', function() {
            var geolocation = new window.AMap.Geolocation({
              // 是否使用高精度定位，默认：true
              enableHighAccuracy: true,
              // 设置定位超时时间，默认：无穷大
              timeout: 10000,
              // 定位按钮的停靠位置的偏移量，默认：Pixel(10, 20)
              buttonOffset: new window.AMap.Pixel(10, 20),
              //  定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
              zoomToAccuracy: false,     
              //  定位按钮的排放位置,  RB表示右下
              buttonPosition: 'RB'
            })
          
            geolocation.getCurrentPosition()
            window.AMap.event.addListener(geolocation, 'complete', onComplete)
            window.AMap.event.addListener(geolocation, 'error', onError)
          
            function onComplete (data) {
              // data是具体的定位信息
            }
          
            function onError (data) {
              // 定位出错
            }
          })
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
        this.map = new window.AMap.Map('allmap', {
            zoom: 11,
            scrollWheel: true
        })

        this.initPosition()
        /*
        
       */
        this.mapComplete()

        window.AMapUI.loadUI(['misc/PositionPicker'], (PositionPicker) => {
            
            this.positionPicker = new PositionPicker({
                mode: 'dragMap', // 设定为拖拽地图模式，可选'dragMap'、'dragMarker'，默认为'dragMap'
                map: this.map, // 依赖地图对象
                iconStyle: { // 自定义外观
                   url: 'http://webapi.amap.com/ui/1.0/assets/position-picker2.png', // 图片地址
                   size: [48, 48],  // 要显示的点大小，将缩放图片
                   ancher: [24, 40] // 锚点的位置，即被size缩放之后，图片的什么位置作为选中的位置
                }
            })
            /*
            map.addControl(new window.AMap.ToolBar({
                liteStyle: true
            }))
            */
            this.positionPicker.on('success', (positionResult) => {
                let {position, address, nearestJunction, nearestRoad, nearestPOI} = positionResult

                this.setState({longitude: position.lng, latitude: position.lat, address: address, closestCross: nearestJunction, closetRoad: nearestRoad, closetPoi: nearestPOI})
                /*
                document.getElementById('lnglat').innerHTML = positionResult.position;
                document.getElementById('address').innerHTML = positionResult.address;
                document.getElementById('nearestJunction').innerHTML = positionResult.nearestJunction;
                document.getElementById('nearestRoad').innerHTML = positionResult.nearestRoad;
                document.getElementById('nearestPOI').innerHTML = positionResult.nearestPOI;
                */
            })
            // this.positionPicker.start([120.153576, 30.287478]);
            this.map.panBy(0, 1);
            // TODO:事件绑定、结果处理等
        })
        // 取机器字典
     this.props.fetchMachineDic().then(msg => {
         this.setState({machineDic: msg})
     })
        
   }

   // 地图加载完成
   mapComplete = () => {
        this.map.on('complete', () => {
            this.getData()
            // document.getElementById('tip').innerHTML = "地图图块加载完毕！当前地图中心点为：" + map.getCenter();
        })
   }

   // 移动事件
   mapMoveEnd = () => {
    this.map.on('moveend', () => {
        this.getData()
        // document.getElementById('tip').innerHTML = "地图图块加载完毕！当前地图中心点为：" + map.getCenter();
    })
   }

   // 容器大小改变
   containerResize = () => {
    this.map.on('resize', () => {
        this.getData()
        // document.getElementById('tip').innerHTML = "地图图块加载完毕！当前地图中心点为：" + map.getCenter();
    })
   }

   onMarkerClick = (e) => {
    this.infoWindow.setContent(e.target.content);
    this.infoWindow.open(this.map, e.target.getPosition())
    
   }

   mapDragMethod = (e) => {
      this.setState({radioValue: e.target.value})
      if (e.target.value == 1) {
        
      } else {

      }
   }

   // 根据经纬度范围加载数据
   getData = () => {
       let {southwest, northeast} = this.map.getBounds()
       if (southwest && northeast) {
           
           this.props.fetchMachineLocation({startLong: southwest.lng, endLong: northeast.lng, startLati: southwest.lat, endLati: northeast.lat}).then(msg => {
             if (this.props.machineMap) {
                 let {data} = this.props.machineMap
                 if (data) {
                     data.map((item, index) => {
                        this.drawPoint(item)
                     })
                 }
             }
            
           })
       }
   }

   // 绘制猫点
   drawPoint = (item) => {
        
        let marker = new window.AMap.Marker({
            position: [item.Longitude, item.Latitude],
            map: this.map,
            title: item.MachineId
        })
        marker.content = item.MachineId
        this.map.add(marker); // 添加到地图
        marker.on('click', this.onMarkerClick)
        /*
        infoWindow.setContent(marker.content);
        infoWindow.open(this.map, marker.getPosition())
        */
   }
   
   startOrStopChoose = (val) => {
    if (val == 'start') {
        if (!this.state.machineId) {
            message.warning('请先选择机器')
            return
        }
        this.positionPicker.start(this.map.getCenter())
    } else if (val == 'stop') {
        this.positionPicker.stop()
    }
   }

   machineChange = (val) => {
       this.state.machineId = val
       this.props.fetchLocationByMachine({machineId: val}).then(msg => {
           if (msg && msg.Id) {
               let {Longitude, Latitude, Address, MachineId} = msg
               this.setState({longitude: Longitude, latitude: Latitude, address: Address, machineId: MachineId, nowRecord: msg})
            var position = new window.AMap.LngLat(msg.Longitude, msg.Latitude)
              this.map.setCenter(position)
           }
       })
   }
   
   // 保存地址
   saveLocation = () => {
      if (!this.state.machineId) {
          message.warning('请选择机器')
          return
      }

      if (!this.state.longitude) {
         message.warning('经度不能为空')
         return
      }

      if (!this.state.latitude) {
        message.warning('纬度不能为空')
        return
     }

     if (!this.state.address) {
        message.warning('地址不能为空')
        return
     }
     let saveParam = {}
     
     saveParam.Address = this.state.address
     saveParam.Longitude = this.state.longitude
     saveParam.Latitude = this.state.latitude
     if (this.state.nowRecord.Id) {
        saveParam.MachineId = this.state.nowRecord.MachineId
        saveParam.Id = this.state.nowRecord.Id
        this.props.updateMachineLocation({machineLocationInfo: saveParam}).then(msg => {
            if (msg) {
                message.success('更新地址成功')
                this.positionPicker.stop()
            }
        })
     } else {
        saveParam.MachineId = this.state.machineId
        this.props.addMachineLocation({machineLocationInfo: saveParam}).then(msg => {
          if (msg) {
              message.success('保存成功')
              this.positionPicker.stop()
          }
        })
     }
    
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
                      <Col span={9}><InputNumber placeholder='经度' value={this.state.longitude} onChange={(val) => {this.setState({longitude: val})}} /></Col>
                      <Col span={9}><InputNumber placeholder='纬度' value={this.state.latitude} onChange={(val) => {this.setState({latitude: val})}} /></Col>
                    </Row>
                    <Row style={{marginTop: '5px'}}>
                    <Col span={6}>详细地址</Col>
                    <Col span={18}><textarea style={{width: '100%', height: '100px'}} onChange={(e) => {this.setState({address: e.target.value})}} value={this.state.address}></textarea></Col>
                  </Row>
                  <Row style={{marginTop: '5px'}}>
                  <Col span={24} style={{textAlign: 'center'}}><Button onClick={this.saveLocation.bind(this)} type="primary">保存位置</Button></Col></Row>
                  <div> 
                    <div className="mapPanelContainer">
                        <div>
                            <div className="panelTitle">选择模式</div>
                            {
                            /*
                            
                            <div>
                            <RadioGroup onChange={this.mapDragMethod} value={this.state.radioValue}>
                            <Radio value={1}>拖曳地图模式</Radio>
                            <Radio value={2}>拖拽Marker模式</Radio>
                            </RadioGroup>
                            </div>
                            */
                        }
                            <div style={{paddingTop: '10px'}}>
                                <ButtonGroup>
                                    <Button onClick={this.startOrStopChoose.bind(this, 'start')}>开始选点</Button>
                                    <Button onClick={this.startOrStopChoose.bind(this, 'stop')}>关闭选点</Button>
                                </ButtonGroup>
                            </div>
                        </div>
                        <div>
                            <div className="panelTitle">选址结果</div>
                            <div className="resultArea">
                                <div className="secondTitle">经纬度:</div>
                                <div>{this.state.longitude}, {this.state.latitude}</div>
                            </div>

                            <div className="resultArea">
                                <div className="secondTitle">地址:</div>
                                <div>{this.state.address}</div>
                            </div>

                            <div className="resultArea">
                                <div className="secondTitle">最近路口:</div>
                                <div>{this.state.closestCross}</div>
                            </div>
                            <div className="resultArea">
                                <div className="secondTitle">最近的路:</div>
                                <div>{this.state.closetRoad}</div>
                            </div>
                            <div className="resultArea">
                                <div className="secondTitle">最近的POI:</div>
                                <div>{this.state.closetPoi}</div>
                            </div>
                        </div>
                    </div>
               </div>
                </div>
               
                <div id="allmap">
              
                </div>
           </div>
        )
    }
}

export default MapModule
