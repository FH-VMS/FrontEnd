import React, {Component} from 'react'
import {List} from 'antd-mobile'
import {hashHistory} from 'react-router'
class EveryLocation extends Component {
    constructor(props) {
        super(props)
        this.state = {
        }
    }


    gotoMap = (item) => {
        sessionStorage.setItem('AroundMap', JSON.stringify(item))
        hashHistory.push('/aroundmap' + this.props.location.search)
    }


    render() {
        let {MachineId, Remark, Address, Distance} = this.props.data
        let displayDistance = ''
        if (Distance) {
            if (parseFloat(Distance) > 1000) {
                displayDistance = (parseFloat(Distance) / 1000).toFixed(2) + '公里'
            } else {
                displayDistance = parseFloat(Distance).toFixed(2) + '米'
            }
        }
        return (
              <div className="everyLocationContainer">
                 <List>
                     <List.Item>名称：{MachineId}{Remark}</List.Item>
                     <List.Item wrap>地址：{Address}</List.Item>
                    <List.Item
                        thumb={require('ASSET/img/wechat/position.png')}
                        arrow="horizontal"
                        extra="查看地图"
                        onClick={this.gotoMap.bind(this, this.props.data)}
                        >约{displayDistance}</List.Item>
                </List>
                   
              </div>
        )
    }
}

export default EveryLocation
