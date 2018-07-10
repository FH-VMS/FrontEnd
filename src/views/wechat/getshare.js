import React, {Component} from 'react'
import {hashHistory} from 'react-router'
import {Button, Toast, Result, Icon} from 'antd-mobile'

class GetShare extends Component {
	constructor(props) {
        super(props)
        this.state = {
            title: '',
            img: '',
            message: '',
            show: false
        }
	}

  componentWillMount() {
    Toast.loading('加载中')
  }

  componentDidMount() {
    console.log('aaaa', this.props)
     this.props.postExchangeWares({openId: this.props.params.openId, pickupNo: this.props.params.pickupNo}).then(msg => {
         if (msg == 0) {
            this.setState({title: '订单不存在', message: '可能已被其他人领取或不存在', img: <img src={require('ASSET/img/wechat/warning.svg')} className="warningAndWaitingIcon" alt="" />, show: false})
         }
         if (msg == 2) {
            this.setState({title: '宝贝已在囊中', message: '不可重复领取哦', img: <img src={require('ASSET/img/wechat/waiting.svg')} className="warningAndWaitingIcon" alt="" />, show: false})
         }
         if (msg == 1) {
            this.setState({title: '领取宝贝成功', message: 'TA满满的情意，暖暖的', img: <Icon type="check-circle" className="payResultSvg" style={{ fill: '#1F90E6' }} />, show: true})
         }
         Toast.hide()
     })
  }

  render() {

      return (
        <div>
           <div><Result
           img={this.state.img}
           title={this.state.title}
           message={this.state.message}
         /></div>
           <div style={{display: this.state.show ? 'block' : 'none'}}><Button type="warning" inline size="small" onClick={() => {hashHistory.push('/order' + this.props.location.search)}}>去查看--></Button></div>
        </div>
        )
  }
  
}

export default GetShare

