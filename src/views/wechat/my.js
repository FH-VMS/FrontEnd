import React, {Component} from 'react'
import {List, WhiteSpace, Flex} from 'antd-mobile'
import {hashHistory} from 'react-router'
const Item = List.Item
class My extends Component {
	constructor(props) {
        super(props)
        this.state = {
          nickName: '',
          memberCode: '',
          portrait: ''
        }
	}

  componentWillMount() {
     var jsonUser = sessionStorage.getItem('wechatInfo')
     if (jsonUser) {
        let obj = JSON.parse(jsonUser)
        this.setState({nickName: obj.nickname, memberCode: obj.openid, portrait: obj.headimgurl})
     }
     
  }

  componentDidMount() {

  }

  render() {

      return (
        <div className="wechatMy">
        <WhiteSpace size="lg" />
          <List>
            <List.Item>
            <Flex className="portraitArea">
            <Flex.Item style={{textAlign: 'center'}}><img className="portrait" src={this.state.portrait}/></Flex.Item>
            <Flex.Item>
               <div className="nickName">昵称：{this.state.nickName}</div>
               <div className="memberCode">会员号：{this.state.memberCode}</div>
            </Flex.Item>
          </Flex>
            </List.Item>
          </List>
          <WhiteSpace size="lg" />
          <List>
          <Item
            thumb="https://zos.alipayobjects.com/rmsportal/dNuvNrtqUztHCwM.png"
            arrow="horizontal"
            extra="查看列表"
            onClick={() => {hashHistory.push('order' + this.props.location.search)}}
          >我的订单</Item>
          <Item
            thumb="https://zos.alipayobjects.com/rmsportal/UmbJMbWOejVOpxe.png"
            onClick={() => {}}
            extra="查看优惠券"
            arrow="horizontal"
          >
            我的优惠券
          </Item>
          <Item
          thumb="https://zos.alipayobjects.com/rmsportal/UmbJMbWOejVOpxe.png"
          onClick={() => {}}
          arrow="horizontal"
        >
          联系客服
        </Item>
        <Item
        thumb="https://zos.alipayobjects.com/rmsportal/UmbJMbWOejVOpxe.png"
        onClick={() => {}}
        arrow="horizontal"
      >
        附近咖啡机
      </Item>
        </List>
        </div>
        )
  }
  
}

export default My
