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
            shareWords: [{value: 1, content: '海内存知己，天涯若比邻'}, {value: 2, content: '夏日朗朗，记忆中的片片美好'}, {value: 3, content: '睡XX，起来嗨'}, {value: 4, content: '自定义'}]
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
              wx.onMenuShareAppMessage({
                  title: `请您享用${this.state.nowShareItem.WaresName}`, // 分享标题
                  desc: des, // 分享描述
                  link: `${location.origin}/p/wechat.html#/mall/${openIdVal}/${this.state.nowShareItem.PickupNo}?clientId=${this.props.location.query.clientId}`, // 分享链接
                  imgUrl: `http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E6%91%84%E5%BD%B1%E5%B8%88%E5%90%B4%E7%A7%8B%E7%85%8C&step_word=&hs=0&pn=22&spn=0&di=0&pi=51669677295&rn=1&tn=baiduimagedetail&is=0%2C0&istype=2&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=-1&cs=914852326%2C2946927230&os=&simid=&adpicid=0&lpn=0&ln=210&fr=&fmq=1531103237105_R&fm=&ic=0&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&ist=&jit=&cg=&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F94cad1c8a786c917908aa70ec53d70cf3bc75778.jpg&fromurl=&gsm=0&rpstart=0&rpnum=0&islist=&querylist=`, // 分享图标
                  type: 'link', // 分享类型,music、video或link，不填默认为link
                  dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                  success: function () {
                      // 用户确认分享后执行的回调函数
                  },
                  cancel: function () {
                      // 用户取消分享后执行的回调函数
                  }
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
        $('.shareGuide').show()
    })
}
}

guideMaskClick = () => {
  $('.shareGuide').hide()
}

onChange = (value) => {
  console.log('checkbox', value);
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
          <List.Item extra={<Radio checked={this.state.rdValue == i.value}/>} onClick={this.onChange.bind(this, i.value)}>
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
        count={100}
        value={this.state.diyDes}
        onChange={(val) => {this.setState({diyDes: val})}}
      />
        <List.Item>
          <Button type="primary" onClick={this.doShare}>分享</Button>
        </List.Item>
      </List>
        </Modal>
        <div className="shareGuide" onClick={this.guideMaskClick}><img src={require('ASSET/img/wechat/share-arrow.png')} /></div>
      </div>
        )
  }
  
})

export default ShareForm

