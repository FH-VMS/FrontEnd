import React, {Component} from 'react'
import {Button, List, Toast} from 'antd-mobile'
import wechatUtility from 'UTIL/wechatUtility'
import {handleUrlParams} from 'UTIL/mobileUtility'

class Pay extends Component {
	constructor(props) {
        super(props)
        this.state = {
          data: [],
          totalFee: 0
        }
        this.payPara = {}
	}

  componentWillMount() {
    Toast.loading('加载中')
  }

  componentDidMount() {
    let chosenProducts = wechatUtility.Cart.getData()
    if (chosenProducts) {
      let searchPara = handleUrlParams(window.location.href.split('?')[1])
      let wechatInfo = sessionStorage.getItem('wechatInfo')
      if (!sessionStorage) {
        Toast.warning('未登录')
        return
      }
      let openid = JSON.parse(wechatInfo).openid
      let lstProductPay = []
      JSON.parse(chosenProducts).map((item, index) => {
         let tmpObj = {}
         tmpObj.TradeAmount = item.WaresUnitPrice
         tmpObj.Number = item.chosenNum
         tmpObj.WaresId = item.WaresId
         tmpObj.WaresName = item.WaresName
         tmpObj.IsGroup = item.IsGroup
         lstProductPay.push(tmpObj)
      })
      this.props.postWechatPay({clientId: searchPara.clientId, openId: openid, lstProductPay: lstProductPay}).then(msg => {
        let {RequestState, RequestData, ProductJson} = msg
        if (RequestState == '0') {
          location.href = RequestData
        } else if (RequestState == '1') {
          this.payPara = JSON.parse(RequestData)
          let products = JSON.parse(ProductJson)
          let fee = 0
          products.map((item, index) => {
            fee = fee + item.TradeAmount * item.Number
          })
          this.setState({data: products, totalFee: fee})
          // this.handleProductJson(ProductJson, 'w')
          // Toast.hide()
        } else if (RequestState == '2') {
          // 请求商品错误
        }
        Toast.hide()
      })
    }
    
  }

  onBridgeReady = () => {
    
     window.WeixinJSBridge.invoke(
       'getBrandWCPayRequest', this.payPara,
       (res) => {   
           if (res.err_msg == 'get_brand_wcpay_request:ok') {
              window.WeixinJSBridge.call('closeWindow')
                // 支付成功 调用支付成功接口
           }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
       }
   )
 }

  callPay = () => {
    if (wechatUtility.isWeiXin()) {
       if (typeof window.WeixinJSBridge == 'undefined') {
        if (document.addEventListener) {
            document.addEventListener('WeixinJSBridgeReady', this.onBridgeReady, false)
        } else if (document.attachEvent) {
            document.attachEvent('WeixinJSBridgeReady', this.onBridgeReady)
            document.attachEvent('onWeixinJSBridgeReady', this.onBridgeReady)
        }
      } else {
        this.onBridgeReady()
      }
    }
  }


 

  render() {
      return (
        <div className="payContainer">
        <div id="aliForm" style={{display: 'none'}}></div>
      <List>
        
       {
         this.state.data.map((item, index) => {
           return <List.Item extra={<span className="productNum">￥{item.TradeAmount} X {item.Number}</span>}>
                      {item.WaresName}
                </List.Item>
         })
       }
         <List.Item>
           总额：<span className="productPrice">￥{this.state.totalFee.toFixed(2)}</span>
         </List.Item>
       </List>
       <Button className="btn" type="primary" onClick={this.callPay} style={{margin: 'auto', marginTop: '0.3rem', width: '95%'}}>立即支付</Button>
     </div>
        )
  }
  
}

export default Pay

