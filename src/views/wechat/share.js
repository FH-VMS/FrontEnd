import React, {Component} from 'react'
import {Button, List, ActionSheet, Toast} from 'antd-mobile'
import wechatUtility from 'UTIL/wechatUtility'
import {hashHistory} from 'react-router'
import ReactDOM from 'react-dom'
let wx = require('weixin-js-sdk')

class Share extends Component {
	constructor(props) {
        super(props)
        this.state = {
            dataSource: [],
            isLoading: true,
            data: [],
            waitingData: []
        }
	}

  componentWillMount() {
  }

  componentDidMount() {
    this.queryWaitingData()
  }

  queryWaitingData = () => {
   
      let openIdVal = wechatUtility.GetMemberId()
      openIdVal = 'o20iGwtoUzSrJiugFilbiDLhmFnc'
      if (!openIdVal) {
        return
      }
    
      this.props.fetchWaitingSalesList({openId: openIdVal}).then(msg => {
          if (this.props.wechat && this.props.wechat.waitingList) {
            this.setState({waitingData: this.props.wechat.waitingList})
          }
      })
  }


  showShareActionSheet = (item) => {
    ActionSheet.showShareActionSheetWithOptions({
      options: [{icon: <img src = {require('ASSET/img/wechat/wechat.png')} />, title: '微信好友'}],
      // title: 'title',
      message: '分享给微信好友'
    },
    (buttonIndex) => {
       if (buttonIndex > -1) {
        if (this.props.location.query.clientId) {
            Toast.loading('加载中')
            this.props.getWeixinConfig({clientId: this.props.location.query.clientId}).then(msg => {
                let {RequestState, RequestData} = msg
                if (RequestState == '1') {
                    let config = JSON.parse(RequestData)
                    config.debug = false
                    config.jsApiList = ['getLocation']
                    wx.config(config)
                    wx.onMenuShareAppMessage({
                        title: `请你享用${item.WaresName}`, // 分享标题
                        desc: '海内存知己，天涯若比邻', // 分享描述
                        link: '', // 分享链接
                        imgUrl: '', // 分享图标
                        type: '', // 分享类型,music、video或link，不填默认为link
                        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                        success: function () {
                            // 用户确认分享后执行的回调函数
                        },
                        cancel: function () {
                            // 用户取消分享后执行的回调函数
                        }
                    })
                }
                Toast.hide()
            })
        }
       
       }
      // also support Promise
      
    });
  }



  render() {
      return (
        <div className="wechatOrder">
         <List style={{display: this.state.waitingData.length == 0 ? 'none' : 'block'}}>
         {
            this.state.waitingData.map((item, index) => {
              return <List.Item onClick={this.showShareActionSheet.bind(this, item)} extra={item.WaresName} arrow="horizontal"><div style={{textAlign: 'left'}} className="pickUpCode">
              {item.PickupNo}
            </div></List.Item>
            })
          }
         </List>
        
          
          <div className="noOrder" style={{display: this.state.waitingData.length == 0 ? 'block' : 'none'}}>
            <div><img src={require('ASSET/img/wechat/cat.png')}/></div>
            <div>暂无订单</div>
            <div> <Button type="warning" inline size="small" onClick={() => {hashHistory.push('/' + this.props.location.search)}}>去商城逛逛--></Button></div>
          </div>
      </div>
        )
  }
  
}

export default Share

