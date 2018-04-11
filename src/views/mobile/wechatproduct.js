import React, {Component} from 'react'
import ListConrol from 'COMPONENT/mobile/product/list'
import {handleUrlParams} from 'UTIL/mobileUtility'

class WechatProduct extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    document.title = this.props.params.id
    console.log('aaaaa', this.props.params.id)
    
    if (this.isWeiXin()) {
       
        let searchPara = handleUrlParams(window.location.href.split('?')[1])
        if (!searchPara.code) {
            searchPara.code = '-1'
           
        }
        this.props.fetchWechatAuth({m: this.props.params.id, code: searchPara.code}).then((msg) => {
            let {RequestState, RequestData, ProductJson} = msg
            if (RequestState == '0') {
              location.href = RequestData
            } else if (RequestState == '1') {
              this.payPara = JSON.parse(RequestData)
              this.handleProductJson(ProductJson, 'w')
            } else if (RequestState == '2') {
              // 请求商品错误
            } else {
            }
      })
      
    }
    
  }

   // 判断是否为微信

   isWeiXin =() =>{
    
      var ua = window.navigator.userAgent.toLowerCase()
      
      if (ua.match(/MicroMessenger/i) == 'micromessenger') {
          return true
      } else {
          return false
      }
  }

  

  render() {
      return (
            <div>
                <ListConrol {...this.props} keyVal={this.props.params.id} fetchProductByMachine={this.props.fetchProductByMachine}/>
            </div>
            )
    }
  
}

export default WechatProduct
