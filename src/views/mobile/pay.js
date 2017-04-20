import React, {Component} from 'react'
import {Button, List, Toast} from 'antd-mobile'
import {handleUrlParams} from 'UTIL/mobileUtility'

class Frame extends Component {
	constructor(props) {
		super(props)
    this.payPara = {}
    this.state = {
      first: '',
      second: ''
    }
	}

  componentWillMount() {
     // this.setState({second: location.href})
     Toast.loading('加载中...', 0, () => {}, true)
    let searchPara = handleUrlParams(window.location.href.split('?')[1])
    if (searchPara && searchPara.k) {
      if (!searchPara.code) {
          searchPara.code = '-1'
      }
      
      this.props.fetchPayInfo({k: searchPara.k, code: searchPara.code}).then((msg) => {
            let {RequestState, RequestData} = this.props.mobile.data
            
            if (RequestState == '0') {
              // this.setState({first: RequestData})
              location.href = RequestData
            } else if (RequestState == '1') {
              // this.setState({second: RequestData})
              this.payPara = JSON.parse(RequestData)
              Toast.hide()
            }
      })
    }
    
  }
  
  /* ******************************微信支付前端方法******************************** */
  onBridgeReady = () => {
     
      window.WeixinJSBridge.invoke(
        'getBrandWCPayRequest', this.payPara,
        function (res) {   
            alert(res.err_msg)  
            if (res.err_msg == 'get_brand_wcpay_request:ok') {

            }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
        }
    )
  }

  callPay = () => {
    
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

  render() {

      return (
      
        <div className="payContainer">
         <List>
           
            <List.Item>
              商品：测试商品
             
            </List.Item>
            <List.Item>
              数量：
              <span className="productNum">1</span>
              
            </List.Item>
            <List.Item>
              价格：<span className="productPrice">￥0.01</span>
            </List.Item>
          </List>
          <Button className="btn" type="primary" onClick={this.callPay}>立即支付</Button>
        </div>
        )
 }
  
}

export default Frame
