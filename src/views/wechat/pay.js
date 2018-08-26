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
          selfChosen: '',
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
    let searchPara = handleUrlParams(window.location.href.split('?')[1])
    if (searchPara.waresId) {
       this.props.fetchWaresByWaresId({waresId: searchPara.waresId}).then(msg => {
        if (this.props.wechat.waresInfo) {
          this.props.wechat.waresInfo.chosenNum = 1
          this.computeSum(JSON.stringify([this.props.wechat.waresInfo]))
        }
       })
    } else {
      this.computeSum()
    }
    
  }

  computeSum = (products) => {
    let chosenProducts = ''
    if (products) {
      chosenProducts = products
    } else {
      let immedite = sessionStorage.getItem('immeditelypay')
      if (immedite) {
        chosenProducts = immedite
      } else {
        chosenProducts = wechatUtility.Cart.getData()
      }
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
         tmpObj.TradeAmount = item.WaresDiscountUnitPrice
         tmpObj.Number = item.chosenNum
         tmpObj.WaresId = item.WaresId
         tmpObj.WaresName = item.WaresName
         tmpObj.IsGroup = item.IsGroup
         lstProductPay.push(tmpObj)
      })
    
      this.props.postWechatPay({clientId: searchPara.clientId, openId: openid, privilegeIds: this.state.privilegeIds, selfChosen: this.state.selfChosen, lstProductPay: lstProductPay}).then(msg => {
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
            this.setState({data: products, totalFee: TotalMoney, privilegeData: []})
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

  onOk = (data) => {
    this.setState({visible: false})
     if (data.length == 0) {
       this.state.privilegeIds = ''
       this.state.selfChosen = 'y'
       this.computeSum()
       return
     }
     let ids = data.map((item, index) => {
            return item.Id
     })
     /*
     let canReload = false
     if (ids.length == this.state.privilegeData.length) {
        for (let i = 0; i < this.state.privilegeData.length; i++) {
            if (ids.indexOf(this.state.privilegeData[i].Id) == -1) {
              canReload = true
            }
        }
     }

     if (canReload) {
     */
      this.state.selfChosen = 'y'
       this.state.privilegeIds = ids.join(',')
       this.computeSum()
     // }
     
  }


  privilegeClick = () => {
    // 检查结算商品中是否有套餐，若有套餐，则优惠券不能用
    let canUsePrivilege = true
    for (let i = 0; i < this.state.data.length; i++) {
      if (this.state.data[i].IsGroup == 1) {
        canUsePrivilege = false
        break
      }
    }
    if (!canUsePrivilege) {
      Toast.warning('套餐商品不参加优惠券活动')
      return
    }
    if (this.state.chosenPrivilege.length == 0) {
      let openid = wechatUtility.GetMemberId()
      if (!openid) {
        Toast.warning('未登录')
        return
      }
       // 查询出所有未过期的优惠券
      this.props.fetchNoneExiprePrivilege({memberId: openid}).then(msg => {
        if (msg) {
          /*
          let canOverlay = []
          let cannotOverlay = []
          msg.map((item, index) => {
              if (this.privilegeDataId.indexOf(item.Id) > -1) {
                item.Chosen = true
              }
              if (item.IsOverlay) {
                canOverlay.push(item)
              } else {
                cannotOverlay.push(item)
              }
          })
          */
          this.setState({visible: true, chosenPrivilege: msg})
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
          
         <List.Item arrow="horizontal" onClick={this.privilegeClick}>
           总额：<span className="productPrice">￥{this.state.totalFee.toFixed(2)}</span>
         </List.Item>
       </List>
       <Button className="btn" type="primary" onClick={this.callPay} style={{margin: 'auto', marginTop: '0.3rem', width: '95%'}}>立即支付</Button>
       <ModalPrivilege products={this.state.data} chosenPrivilege={this.state.chosenPrivilege} privilegeData={this.state.privilegeData} visible={this.state.visible} onClose={this.onClose} onOk={this.onOk}/>
     </div>
        )
  }
  
}

export default Pay

