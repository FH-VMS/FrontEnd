import React, {Component} from 'react'
import 'ASSET/csslib/GB-canvas-turntable.less'
import gbTurntable from 'UTIL/lottery'

class Activity extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
  }

  componentDidMount() {
    let clientWidth = document.documentElement.clientWidth;
      gbTurntable.init({
        id: 'turntable',
        config: function(callback) {
            // 获取奖品信息
            callback && callback(['1元红包', '2元红包', '3元红包', '4元红包', '5元红包', '6元红包'])  
        },
        getPrize: function(callback) {
            // 获取中奖信息
            let num = Math.random() * 6 >>> 0   // 奖品ID
            let chances = num  // 可抽奖次数
             callback && callback([num, chances]) 
        },
        gotBack: function(data) {
            alert('恭喜抽中' + data)
        },
        width: clientWidth * 0.7
    })
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

