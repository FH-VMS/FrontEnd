import React, {Component} from 'react'
import { Map } from 'react-amap'
let wx = require('weixin-js-sdk')

class Around extends Component {
    constructor(props) {
        super(props)
        this.state = {
        }
    }


    componentWillMount() {
        if (this.props.location.query.clientId) {
            this.props.getWeixinConfig({clientId: this.props.location.query.clientId}).then(msg => {
                let {RequestState, RequestData} = msg
                if (RequestState == '1') {
                    let config = JSON.parse(RequestData)
                    config.debug = true
                    config.jsApiList = ['getLocation']
                    wx.config(config)
                    wx.getLocation({
                        type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                        success: function (res) {
                            alert(res.latitude)
                            // var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                            // var longitude = res.longitude ; // 经度，浮点数，范围为180 ~ -180。
                            // var speed = res.speed; // 速度，以米/每秒计
                            // var accuracy = res.accuracy; // 位置精度
                        }
                    })
                }
            })
        }
       
    }


    componentDidMount() {
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
              <Map amapkey={'9015a8600408fdc7cb39d8cb1b83155a'} version={'1.4.7'} />
            </div>
        )
    }
}

export default Around
