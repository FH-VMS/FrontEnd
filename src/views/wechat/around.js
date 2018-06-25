import React, {Component} from 'react'
import EveryLocation from 'COMPONENT/wechat/around/everyLocation'
import {Toast} from 'antd-mobile'
/*
import { Map } from 'react-amap'
<Map amapkey={'9015a8600408fdc7cb39d8cb1b83155a'} version={'1.4.7'} />
*/
let wx = require('weixin-js-sdk')

class Around extends Component {
    constructor(props) {
        super(props)
        this.state = {
            aroundData: []
        }
    }


    componentWillMount() {
        if (this.props.location.query.clientId) {
            Toast.loading('加载中')
            this.props.getWeixinConfig({clientId: this.props.location.query.clientId}).then(msg => {
                let {RequestState, RequestData} = msg
                if (RequestState == '1') {
                    let config = JSON.parse(RequestData)
                    config.debug = false
                    config.jsApiList = ['getLocation']
                    wx.config(config)
                    wx.getLocation({
                        type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                        success: (res) => {
                            this.getLocations(res.longitude, res.latitude)
                            // var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                            // var longitude = res.longitude ; // 经度，浮点数，范围为180 ~ -180。
                            // var speed = res.speed; // 速度，以米/每秒计
                            // var accuracy = res.accuracy; // 位置精度
                        }
                    })
                }
                Toast.hide()
            })
        }
       
    }

    getLocations = (lng, lat) => {
        if (this.props.location.query.clientId) {
            this.props.fetchLocations({longitude: lng, latitude: lat, clientId: this.props.location.query.clientId}).then(msg => {
            if (this.props.wechat && this.props.wechat.locationData) {
                this.setState({aroundData: this.props.wechat.locationData})
            }
            })
        }
    }


    componentDidMount() {
        // this.getLocations('120.1648200000', '30.2435500000')
        wx.ready(() => {
            
                // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
        })

        wx.ready(() => {
            
                // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
        })
    }
  


    render() {
        return (
            <div className="aroundContainer">
              {
                  this.state.aroundData.map((item, index) => {
                      return (
                      <EveryLocation location={this.props.location} data={item}/>
                      )
                  })
              }
              
            </div>
        )
    }
}

export default Around
