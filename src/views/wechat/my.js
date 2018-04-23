import React, {Component} from 'react'
import {List, WhiteSpace, Flex} from 'antd-mobile'
const Item = List.Item
class My extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
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
            <Flex.Item style={{textAlign: 'center'}}><img className="portrait" src='http://www.qqzhi.com/uploadpic/2014-09-23/000247589.jpg'/></Flex.Item>
            <Flex.Item>
               <div className="nickName">昵称：小七的一天</div>
               <div className="memberCode">会员号：wx908989sfddf</div>
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
            onClick={() => {}}
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

