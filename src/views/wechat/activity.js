import React, {Component} from 'react'
import 'ASSET/csslib/GB-canvas-turntable.less'
import gbTurntable from 'UTIL/lottery'
import {Toast} from 'antd-mobile'

class Activity extends Component {
	constructor(props) {
        super(props)
        this.state = {
            chance: 1
        }
	}

  componentWillMount() {
    
  }

  componentDidMount() {
    if (this.props.location.query.clientId) {
        Toast.loading('加载中')
        this.props.fetchActivityList({clientId: this.props.location.query.clientId, principleType: 2}).then(msg => {
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
                    let data = [num, this.state.chance]
                    callback && callback(data) 
                },
                gotBack: (data) => {
                    
                    let tmpObj = {}
                    
                    var jsonUser = sessionStorage.getItem('wechatInfo')
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
                        })
                     }
                },
                width: clientWidth * 0.7
            }
            gbTurntable.init(obj)
            Toast.hide()
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
        </div>
        )
  }
  
}

export default Activity

