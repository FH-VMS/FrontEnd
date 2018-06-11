import React, {Component} from 'react'
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
                
            })
        }
        wx.config({
            debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId: '', // 必填，企业号的唯一标识，此处填写企业号corpid
            timestamp: '', // 必填，生成签名的时间戳
            nonceStr: '', // 必填，生成签名的随机串
            signature: '', // 必填，签名，见附录1
            jsApiList: [] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
        });
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
            <div>
              
            </div>
        )
    }
}

export default Around