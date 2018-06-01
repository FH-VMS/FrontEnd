import React, {Component} from 'react'
import 'ASSET/csslib/GB-canvas-turntable.less'
import gbTurntable from 'UTIL/lottery'
import {Toast, Button, Modal} from 'antd-mobile'
import {hashHistory} from 'react-router'

function closest(el, selector) {
    const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector
    while (el) {
      if (matchesSelector.call(el, selector)) {
        return el
      }
      el = el.parentElement
    }
    return null
  }

class Activity extends Component {
	constructor(props) {
        super(props)
        this.state = {
            chance: 0,
            modal: false,
            money: 0
        }
	}

  componentWillMount() {
    
  }

  gotoCheck = () => {
    hashHistory.push('/myticket' + this.props.location.search)
 }


  onWrapTouchStart = (e) => {
    // fix touch to scroll background page on iOS
    if (!/iPhone|iPod|iPad/i.test(navigator.userAgent)) {
      return
    }
    const pNode = closest(e.target, '.am-modal-content')
    if (!pNode) {
      e.preventDefault()
    }
  }

  componentDidMount() {
    if (this.props.location.query.clientId) {
        var jsonUser = sessionStorage.getItem('wechatInfo')
        Toast.loading('加载中')
        this.props.fetchActivityList({clientId: this.props.location.query.clientId, principleType: 1}).then(msg => {
            let clientWidth = document.documentElement.clientWidth;
            let obj = {
                id: 'turntable',
                config: (callback) => {
                    // 获取奖品信息
                    callback && callback(msg)  
                },
                getPrize: (callback) => {
                    // 获取中奖信息
                    let num = Math.random() * msg.length >>> 0   // 奖品ID
                    // let chances = num  // 可抽奖次数
                    
                  
                    if (jsonUser) {
                        this.props.getCanTicketCount({memberId: JSON.parse(jsonUser).openid, clientId: this.props.location.query.clientId, principleType: 2}).then(count => {
                            
                            this.setState({chance: count})
                            let data = [num, count]
                            callback && callback(data) 
                        })
                    } else {
                        let data = [num, 0]
                        callback && callback(data) 
                    }
                    
                   
                },
                gotBack: (data) => {
                    
                    let tmpObj = {}
                    
                    if (jsonUser) {
                        let userObj = JSON.parse(jsonUser)
                
                        tmpObj.MemberId = userObj.openid
                        tmpObj.PrivilegeId = data.PrivilegeId
                        tmpObj.PrivilegeName = data.PrivilegeName
                        tmpObj.ExpireTime = data.ExpireTime
                        tmpObj.PrincipleType = data.PrincipleType
                        tmpObj.UseMoneyLimit = data.UseMoneyLimit
                        tmpObj.IsBind = data.IsBind
                        tmpObj.ClientId = data.ClientId
                        tmpObj.IsOverlay = data.IsOverlay
                        tmpObj.SourceId = data.SourceId
                        tmpObj.PrivilegeInstru = data.PrivilegeInstru
                        tmpObj.Money = data.Money
                        tmpObj.Discount = data.Discount
                        tmpObj.ComeFrom = '转盘自摇'
                        tmpObj.TimeRule = data.TimeRule
                        this.props.getTicket({privilegeMemberInfo: tmpObj}).then(result => {
                            // console.log('aaaa', result)
                            if (result && this.state.chance) {
                                this.setState({chance: this.state.chance - 1, modal: true, money: data.Money})
                             }
                        })
                     }
                     
                },
                width: clientWidth * 0.7
            }
            gbTurntable.init(obj)
            setTimeout(() => {
                Toast.hide()
            }, 5000)
            
        })
    }
    
  }

  render() {

      return (
        <div className="lotteryContainer">
          <div><img className="lotteryTitle" src={require('ASSET/img/wechat/lottery/title.png')}/></div>
          <section id="turntable" className="gb-turntable lotteryContent">
              <div className="gb-turntable-container">
                  <canvas className="gb-turntable-canvas" width="400" height="400">抱歉！浏览器不支持。</canvas> 
              </div>
               
              <a className="gb-turntable-btn" href="javascript:;"><span className="aSpan"></span>抽奖</a>    
          </section>
          <div className="lotteryText">
            <div>今天还能抽{this.state.chance}次</div>
            <div><Button type="ghost" size="small" inline onClick={() => {hashHistory.push('myticket' + this.props.location.search)}}>我的幸运</Button></div>
          </div>

          <Modal
          visible={this.state.modal}
          transparent
          closable={true}
          onClose ={() => {this.setState({modal: false})}}
          footer={[
            { text: '取消', onPress: () => {this.setState({modal: false})} },
            { text: '查看', onPress: () => {this.gotoCheck()} }
          ]}
          wrapProps={{ onTouchStart: this.onWrapTouchStart }}
          style = {{width: '98%'}}
          >
           恭喜你，领取{this.state.money}元红包
          </Modal>
        </div>
        )
  }
  
}

export default Activity

