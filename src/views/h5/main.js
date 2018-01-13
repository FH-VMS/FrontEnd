import React, {Component} from 'react'
import {Icon, Grid, Modal, Toast, NavBar} from 'antd-mobile'
import {hashHistory} from 'react-router'


class Main extends Component {
	constructor(props) {
		super(props)
    
  }
  

  componentWillMount() {
     this.data = [{
        icon: require('ASSET/img/h5/stock.png'),
        text: '库存管理',
        url: 'stockmanageh5'
     },
     {
      icon: require('ASSET/img/h5/key.png'),
      text: '一键补货',
      url: ''
   },
   {
    icon: require('ASSET/img/h5/max.png'),
    text: '最大库存',
    url: 'maxstock'
 }]
    
  }

  chosenModule = (_el, index) => {
     if (localStorage.getItem('ChooseMachineDeviceId')) {
         switch (this.data[index].text) {
           case '一键补货':
           this.fullfilByOnekey(localStorage.getItem('ChooseMachineDeviceId'))
           break
           default:
           hashHistory.push(`${this.data[index].url}/${localStorage.getItem('ChooseMachineDeviceId')}`)
           break
         }
         
     } else {
       
     }
  }
  
  // 一键补货
  fullfilByOnekey = (machineIdVal) => {
    Modal.alert('一键补货', '确定吗???', [
      { text: '取消', onPress: () => {
        
      } 
    },
      { text: '确认', onPress: () => {
        this.props.fullfilOneyKey({machineId: machineIdVal}).then(msg => {
          if (msg == 1) {
            Toast.success('补货成功', 1)
          } else {
            Toast.fail('补货失败', 1)
          }
        })
      } 
    }
    ])
  }

  render() {
      let nowMachine = '选择机器'
      if (localStorage.getItem('ChooseMachineDeviceId')) {
        nowMachine = localStorage.getItem('ChooseMachineDeviceId')
      }
      return (
        <div>
          <NavBar
          mode="dark"
          leftContent="返回"
          rightContent={[
            <span onClick={() => hashHistory.push('')}>退出</span>
          ]}
          >主页</NavBar>
          <div className="chosenMachine"><span onClick={() => {hashHistory.push('choosemachine')}}>{nowMachine} <Icon type='down' /></span></div>
          <Grid data={this.data} columnNum={3} hasLine={false} onClick={this.chosenModule}/>
        </div>
        )
 }
  
}

export default Main
