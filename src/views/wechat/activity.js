import React, {Component} from 'react'
import 'ASSET/csslib/GB-canvas-turntable.less'
import gbTurntable from 'UTIL/lottery'
import {Toast, Button, Modal} from 'antd-mobile'
import {hashHistory} from 'react-router'
import wechatUtility from 'UTIL/wechatUtility'
import $ from 'jquery'


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
            money: 0,
            message: ''
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
    let clientWidth = document.documentElement.clientWidth;
    // jquery('#' + opts.id).width(canvasWidth + 'px')
    if (this.props.location.query.clientId) {
        var jsonUser = wechatUtility.getWechatInfo()
        Toast.loading('加载中')
       
        this.props.fetchActivityList({clientId: this.props.location.query.clientId, activityType: 1}).then(msg => {
            
            let obj = {
                id: 'turntable',
                config: (callback) => {
                    // 获取奖品信息
                    callback && callback(msg)  
                },
                getPrize: (callback) => {
                 
                    // msg.map
                    // 获取中奖信息
                    let rateArr = []
                    let totalRate = 0
                    msg.map((item, index) => {
                        totalRate = totalRate + item.Rate
                        rateArr.push(item.Rate)
                    })
                    
                    let randomRate = Math.random() * totalRate
                    let num = -1
                    let nowIndex = 0
                    for (let i = 0; i < rateArr.length; i++) {
                        nowIndex = nowIndex + rateArr[i]
                        let lessVal = 0
                        if (i > 0) {
                            lessVal = nowIndex - rateArr[i]
                        }
                        if (randomRate > lessVal && randomRate <= nowIndex) {
                            num = i
                            break 
                        }
                        
                    }
                    
                     // let num = Math.floor(random * msg.length) // >>> 0   // 奖品ID
                    // let chances = num  // 可抽奖次数
                    
                    if (num == -1) {
                        let data = [num, 0]
                        callback && callback(data) 
                    } else {
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
                        tmpObj.BindProductIds = data.BindProductIds
                        tmpObj.DisplayText = data.DisplayText
                        this.props.getTicket({privilegeMemberInfo: tmpObj}).then(result => {
                            // console.log('aaaa', result)
                            if (result && this.state.chance) {
                                this.setState({chance: this.state.chance - 1, modal: true, money: data.Money})
                                switch (data.PrincipleType) {
                                    case '1':
                                    this.setState({message: `恭喜你，领到${data.Money}元满减券`})
                                    break
                                    case '2':
                                    this.setState({message: `恭喜你，领到${data.Discount}折打折券`})
                                    break
                                    case '3':
                                    this.setState({message: `恭喜你，领到一张赠品券`})
                                    break
                                    case '4':
                                    this.setState({message: '谢谢惠顾，下次记得努力哦'})
                                    break
                                }
                             }
                        })
                     }
                     
                },
                width: clientWidth * 0.7
            }
            gbTurntable.init(obj)
            setTimeout(() => {
                Toast.hide()
            }, 1000)
            
        })
    }
    

    $('body').css('background', '#ff5242')
  }

  render() {
    let clientWidth = document.documentElement.clientWidth;
    let size = clientWidth * 0.7 + 'px'
    // $('#turntable').height(clientWidth * 0.7)
    // $('#turntable').width(clientWidth * 0.7)
      return (
        <div className="lotteryContainer">
          <div><img className="lotteryTitle" src={require('ASSET/img/wechat/lottery/title.png')}/></div>
          <section id="turntable" className="gb-turntable lotteryContent" style={{width: size, height: size}}>
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
            {
                this.state.message
            }
          </Modal>
        </div>
        )
  }
  
}

export default Activity

