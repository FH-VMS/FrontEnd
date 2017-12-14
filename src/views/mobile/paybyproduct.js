import React, {Component} from 'react'
import {Button, List, Toast} from 'antd-mobile'
import {handleUrlParams} from 'UTIL/mobileUtility'

class PayByProduct extends Component {
	constructor(props) {
		super(props)
    this.payPara = {}  // 微信回过来的支付链接
    this.payParaA = '' // 支付宝回过来的支付链接
    this.state = {
       productList: [], // 要购买商品的详情列表
       totalFee: 0      // 总额
    }
	}

  componentWillMount() {
    // 清除cookie
    document.title = '支付'
    Toast.loading('加载中...', 0, () => {}, true)
     
    let searchPara = handleUrlParams(window.location.href.split('?')[1])
    if (searchPara && searchPara.k) {
      
      if (!searchPara.code) {
          searchPara.code = '-1'
         
      }
      
      if (this.isWeiXin()) {
          this.props.fetchPayInfo({k: searchPara.k, code: searchPara.code, isPayByTunnel: 'false'}).then((msg) => {
              let {RequestState, RequestData, ProductJson} = this.props.mobile.data
              if (RequestState == '0') {
                location.href = RequestData
              } else if (RequestState == '1') {
                this.payPara = JSON.parse(RequestData)
                this.handleProductJson(ProductJson, 'w')
                Toast.hide()
              } else if (RequestState == '2') {
                // 请求商品错误
              } else {
              }
        })
      } else {
      
        this.props.fetchPayInfoA({k: searchPara.k, isPayByTunnel: 'false'}).then((msg) => {
              let {RequestState, RequestData, ProductJson} = this.props.mobile.data
              if (RequestState == '1') {
                  this.payParaA = RequestData
                  this.handleProductJson(ProductJson, 'a')
                  Toast.hide()
              } else if (RequestState == '2') {
                // 请求商品错误
              }
             
        })
      }
      
    }
    
  }

  handleProductJson = (jsn, wora) => {
     let obj = JSON.parse(jsn)
     let totalFeeVal = 0
     if (wora == 'w') {
        obj.map((item, index) => {
         totalFeeVal = totalFeeVal + parseFloat(item.UnitW) * parseInt(item.Num, 0)
       })
     } else {
        obj.map((item, index) => {
         totalFeeVal = totalFeeVal + parseFloat(item.UnitA) * parseInt(item.Num, 0)
       })
     }

     this.setState({productList: obj, totalFee: totalFeeVal})
     
  }
  
  /* ******************************微信支付前端方法******************************** */
  // 判断是否为微信
  isWeiXin =() =>{
    
      var ua = window.navigator.userAgent.toLowerCase()
      
      if (ua.match(/MicroMessenger/i) == 'micromessenger') {
          return true
      } else {
          return false
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
    if (this.isWeiXin()) {
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
    } else {
      if (this.payParaA) {
        // location.href = this.payParaA
        $('#aliForm').empty()
        $('#aliForm').append(this.payParaA)
        $('#aliForm').find('form').submit()
        // document.write(this.payParaA)
      }
    }
     
  }

  renderList = () => {
    this.listHtml = this.state.productList.map((item) => {
      if (this.isWeiXin()) {
         return (
          <List.Item extra={<span className="productNum">￥{item.UnitW} X {item.Num}</span>}>
                {item.WaresName}
          </List.Item>
        )
      } else {
        return (
          <List.Item extra={<span>￥{item.UnitA} X {item.Num}</span>}>
                {item.WaresName}
          </List.Item>
        )
      }
      
    })
  }

  render() {
      this.renderList()
      return (
      
        <div className="payContainer">
          <div id="aliForm" style={{display: 'none'}}></div>
         <List>
           
           {this.listHtml}
            <List.Item>
              总额：<span className="productPrice">￥{this.state.totalFee.toFixed(2)}</span>
            </List.Item>
          </List>
          <Button className="btn" type="primary" onClick={this.callPay} style={{marginTop: '0.3rem', width: '95%', marginLeft: '2.5%'}}>立即支付</Button>
        </div>
        )
 }
  
}

export default PayByProduct
