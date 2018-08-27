import React, {Component} from 'react'
import {hashHistory} from 'react-router'
import wechatUtility from 'UTIL/wechatUtility'

class EveryPrivilege extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
  }

  componentDidMount() {

  }

  gotoUse = (item) => {
    if (item.PrincipleType == '3') { // 赠品券直接跳到结算页面
      
      hashHistory.push(`/pay?clientId=${wechatUtility.Cart.GetClientId()}&waresId=${item.BindProductIds}`)
    } else {
      hashHistory.push('/' + this.props.location.search)
    }
    
  }

  render() {
      let {ExpireTime, PrivilegeInstru, PrivilegeStatus, Money, Discount, DisplayText} = this.props.data
      let privilegeMoney = ''
      if (Money && Money > 0) {
        privilegeMoney = '¥' + Money
      } else {
        privilegeMoney = Discount + '折'
      }
      var ex = new Date(ExpireTime)
      var now = new Date()
      let isExipire = false
      if (now.getTime() > ex.getTime()) {
        isExipire = true
      }
      let tmpHtml = []
      let style = 'notExpireStyle'
      if (PrivilegeStatus == 2) {
        tmpHtml.push(<div>已使用</div>)
      } else {
          if (PrivilegeStatus == 1 && !isExipire) {
            tmpHtml.push(<div>已领取</div>)
            tmpHtml.push(<div onClick={this.gotoUse.bind(this, this.props.data)} className="gotoUse">去使用</div>)
          } else {
            style = 'expireStyle'
            tmpHtml.push(<div>已过期</div>)
          }
      }
      
      return (
        <div>
            <div className="everyTicket">
                <div className={style}>{privilegeMoney}</div>
                <div>
                    <div>
                        <div style={{color: (PrivilegeStatus == 1 && !isExipire) ? '#ff6867' : 'inherit', marginBottom: '5px', fontSize: '0.25rem'}}>{DisplayText}</div>
                        <div>失效时间: {ExpireTime.replace('T', ' ')} </div>
                        <div>使用规则：{PrivilegeInstru}</div>
                    </div>
                  </div>
                <div>
                    <div>
                        {tmpHtml}
                   </div>
                </div>
            </div>
        </div>
        )
  }
  
}

export default EveryPrivilege

