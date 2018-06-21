import React, {Component} from 'react'
import {Button, List, Toast, Badge} from 'antd-mobile'
import wechatUtility from 'UTIL/wechatUtility'
import {handleUrlParams} from 'UTIL/mobileUtility'
import {hashHistory} from 'react-router'
import ModalPrivilege from 'COMPONENT/wechat/pay/choosePrivilege'

class Pay extends Component {
	constructor(props) {
        super(props)
        this.state = {
          data: [],
          totalFee: 0,
          privilegeIds: '',
          privilegeData: [],
          chosenPrivilege: [],
          visible: false,
          canOverlay: [],
          cannotOverlay: []

        }
        this.payPara = {}
	}

  componentWillMount() {
    Toast.loading('加载中')
  }

  componentDidMount() {
    let chosenProducts = ''
    let immedite = sessionStorage.getItem('immeditelypay')
    if (immedite) {
      chosenProducts = immedite
    } else {
      chosenProducts = wechatUtility.Cart.getData()
    }
    // let chosenProducts = wechatUtility.Cart.getData()
    if (chosenProducts) {
      let searchPara = handleUrlParams(window.location.href.split('?')[1])
      let openid = wechatUtility.GetMemberId()
      if (!openid) {
        Toast.warning('未登录')
        return
      }
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
    
      this.props.postWechatPay({clientId: searchPara.clientId, openId: openid, privilegeIds: this.state.privilegeIds, lstProductPay: lstProductPay}).then(msg => {
        let {RequestState, RequestData, ProductJson, PrivilegeJson, TotalMoney} = msg
        if (RequestState == '0') {
          // location.href = RequestData
        } else if (RequestState == '1') {
          this.payPara = JSON.parse(RequestData)
          let products = JSON.parse(ProductJson)
          
          /*
          let fee = 0
          products.map((item, index) => {
            fee = fee + item.TradeAmount * item.Number
          })
          */
          if (PrivilegeJson) {
            let privilegeJsonObj = JSON.parse(PrivilegeJson)
            /*
            let finalFee = 0
            if (privilegeJsonObj[0].Money && privilegeJsonObj[0].Money > 0) {
              finalFee = fee - privilegeJsonObj[0].Money
            } else {
              finalFee = (fee * privilegeJsonObj[0].Discount) / 10
            }
            */
            this.setState({data: products, totalFee: TotalMoney, privilegeData: privilegeJsonObj})
          } else {
            this.setState({data: products, totalFee: TotalMoney})
          }
          
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
              // window.WeixinJSBridge.call('closeWindow')
              hashHistory.push('/result' + this.props.location.search)
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


  onClose = () => {
    this.setState({visible: false})
  }


  privilegeClick = () => {
   
    if (this.state.chosenPrivilege.length == 0) {
      let openid = wechatUtility.GetMemberId()
      if (!openid) {
        Toast.warning('未登录')
        return
      }
      this.props.fetchNoneExiprePrivilege({memberId: openid}).then(msg => {
        if (msg) {
          let canOverlay = []
          let cannotOverlay = []
          msg.map((item, index) => {
              if (item.IsOverlay) {
                canOverlay.push(item)
              } else {
                cannotOverlay.push(item)
              }
          })
          this.setState({visible: true, chosenPrivilege: msg, canOverlay: canOverlay, cannotOverlay: cannotOverlay})
        }
         
      })
    } else {
      this.setState({visible: true})
    }
    
  }
 

  render() {
    /*
    let privilegeText = ''
    let {Money, Discount} = this.state.chosenPrivilege
    if (Money && Money > 0) {
      privilegeText = '￥-' + Money
    } else {
      privilegeText = Discount + '折'
    }
    */
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
       {
         this.state.privilegeData.map((item, index) => {
           return <List.Item arrow="horizontal" onClick={this.privilegeClick} extra={<span className="productNum" style={{color: '#f96268'}}>{item.DisplayText}</span>}>
                      <Badge text="红包" style={{ padding: '0 3px', backgroundColor: '#f96268', borderRadius: 2 }} /> {item.PrivilegeName}
                  </List.Item>
         })
       }
          
         <List.Item>
           总额：<span className="productPrice">￥{this.state.totalFee.toFixed(2)}</span>
         </List.Item>
       </List>
       <Button className="btn" type="primary" onClick={this.callPay} style={{margin: 'auto', marginTop: '0.3rem', width: '95%'}}>立即支付</Button>
       <ModalPrivilege canOverlay={this.state.canOverlay} cannotOverlay={this.state.cannotOverlay} visible={this.state.visible} onClose={this.onClose}/>
     </div>
        )
  }
  
}

export default Pay

