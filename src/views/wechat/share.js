import React, {Component} from 'react'
import {Button, List, Modal, Radio, TextareaItem, Toast } from 'antd-mobile'
import wechatUtility from 'UTIL/wechatUtility'
import {hashHistory} from 'react-router'
import ReactDOM from 'react-dom'
import $ from 'jquery'
import { createForm } from 'rc-form'
let wx = require('weixin-js-sdk')

const ShareForm = createForm()(class Share extends Component {
	constructor(props) {
        super(props)
        this.state = {
            dataSource: [],
            isLoading: true,
            data: [],
            waitingData: [],
            rdValue: 0,
            nowShareItem: '',
            diyDes: '',
            shareWords: [{value: 1, content: '海内存知己，天涯若比邻'}, 
            {value: 2, content: '夏日朗朗，记忆中的片片美好'}, 
            {value: 3, content: '昨夜小寐，忽疑君到，却是琉璃火，未央天。'}, 
            {value: 5, content: '所谓深情挚爱，就是你心中有我，我心中有你，原来，一个人吃饭没有两个人吃饭开心。'}, 
            {value: 4, content: '自定义'}]
        }
	}

  componentWillMount() {
  }

  componentDidMount() {
    this.queryWaitingData()
    this.adapterTab()
  }

  adapterTab = () => {
    $('.wechatOrder').height(document.documentElement.clientHeight - $('.globalTabBar').height())
  }

  queryWaitingData = () => {
   
      let openIdVal = wechatUtility.GetMemberId()
      // openIdVal = 'o20iGwtoUzSrJiugFilbiDLhmFnc'
      if (!openIdVal) {
        return
      }
    
      this.props.fetchWaitingSalesList({openId: openIdVal}).then(msg => {
          if (this.props.wechat && this.props.wechat.waitingList) {
            this.setState({waitingData: this.props.wechat.waitingList})
          }
      })
  }

/*
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
*/

showShareModal = (item) => {
  this.setState({modalVisible: true, nowShareItem: item})
}

doShare = () => {
  if (this.props.location.query.clientId) {
    Toast.loading('加载中')
    this.props.getWeixinConfig({clientId: this.props.location.query.clientId}).then(msg => {
      
        let {RequestState, RequestData} = msg
        if (RequestState == '1') {
            let config = JSON.parse(RequestData)
            config.debug = false
            config.jsApiList = ['onMenuShareAppMessage', 'getLocation', 'showMenuItems', 'hideMenuItems']
            wx.config(config)
            let des = ''
            if (this.state.rdValue == 4) {
              des = this.state.diyDes
            } else {
              for (let i = 0; i < this.state.shareWords.length; i++) {
                if (this.state.shareWords[i].value == this.state.rdValue) {
                  des = this.state.shareWords[i].content
                  break
                }
             }
            }
            let openIdVal = wechatUtility.GetMemberId()
            wx.ready(() => {
              wx.checkJsApi({
                jsApiList: [
                  'getLocation',
                      'onMenuShareAppMessage',
                       'showMenuItems', 
                       'hideMenuItems'
                ],
                success: function (res) {
                  // alert(res.errMsg);
                }
              })
              
              this.props.fetchPicUrlByWaresId({waresId: this.state.nowShareItem.WaresId}).then(url => {
                
                $('.shareGuide').show()
                wx.onMenuShareAppMessage({
                    title: `请您享用${this.state.nowShareItem.WaresName}`, // 分享标题
                    desc: des, // 分享描述
                    link: `${location.origin}/p/wechat.html?clientId=${this.props.location.query.clientId}&openId=${openIdVal}&pickupNo=${this.state.nowShareItem.PickupNo}&from=singlemessage`, // 分享链接
                    imgUrl: url, // 分享图标
                    type: 'link', // 分享类型,music、video或link，不填默认为link
                    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                    success: function () {
                        // 用户确认分享后执行的回调函数
                        $('.shareGuide').hide()
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                        $('.shareGuide').hide()
                    }
                })
              })
              

              wx.hideMenuItems({
                menuList: ['menuItem:share:timeline', 
                'menuItem:share:qq', 
                'menuItem:share:weiboApp', 
                'menuItem:favorite', 
                'menuItem:share:facebook', 
                'menuItem:share:QZone', 
                'menuItem:editTag', 
                'menuItem:delete', 
                'menuItem:copyUrl', 
                'menuItem:originPage', 
                'menuItem:readMode', 
                'menuItem:openWithQQBrowser', 
                'menuItem:openWithSafari', 
                'menuItem:share:email'] // 要显示的菜单项，所有menu项见附录3
              })
            })
            
        }
        Toast.hide()
        this.setState({modalVisible: false, rdValue: 0})
        
    })
}
}

guideMaskClick = () => {
  $('.shareGuide').hide()
}

onChange = (value) => {
  this.setState({
    rdValue: value
  });
}


  render() {
    const { getFieldProps } = this.props.form
      return (
        <div className="wechatOrder">
         <List style={{display: this.state.waitingData.length == 0 ? 'none' : 'block'}}>
         {
            this.state.waitingData.map((item, index) => {
              return <List.Item onClick={this.showShareModal.bind(this, item)} extra={item.WaresName} arrow="horizontal"><div style={{textAlign: 'left'}} className="pickUpCode">
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
          
          <Modal
          popup
          visible={this.state.modalVisible}
          onClose={() => {this.setState({modalVisible: false})}}
          animationType="slide-up"
          closable={true}
        >
        <List renderHeader={() => <div>选择寄语</div>}>
        {this.state.shareWords.map(i => (
          <List.Item multipleLine align="top" wrap extra={<Radio checked={this.state.rdValue == i.value}/>} onClick={this.onChange.bind(this, i.value)}>
          {i.content}
        </List.Item>
        ))}
        <TextareaItem
        placeholder='请输入自定义寄语'
        style={{display: this.state.rdValue == '4' ? 'block' : 'none'}}
        ref={el => this.autoFocusInst = el}
        {...getFieldProps('count', {
          initialValue: ''
        })}
        rows={5}
        count={200}
        value={this.state.diyDes}
        onChange={(val) => {this.setState({diyDes: val})}}
      />
        <List.Item>
          <Button type="primary" onClick={this.doShare}>确定</Button>
        </List.Item>
      </List>
        </Modal>
        <div className="shareGuide" onClick={this.guideMaskClick}><img src={require('ASSET/img/wechat/share-arrow.png')} /></div>
      </div>
        )
  }
  
})

export default ShareForm

