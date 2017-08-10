import React, {Component} from 'react'
import {Icon, Grid} from 'antd-mobile'
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
     }]
    
  }

  chosenModule = (_el, index) => {
     if (localStorage.getItem('ChooseMachineDeviceId')) {
         hashHistory.push(`${this.data[index].url}/${localStorage.getItem('ChooseMachineDeviceId')}`)
     } else {
       
     }
  }

  render() {
      let nowMachine = '选择机器'
      if (localStorage.getItem('ChooseMachineDeviceId')) {
        nowMachine = localStorage.getItem('ChooseMachineDeviceId')
      }
      return (
        <div>
          <div className="chosenMachine"><span onClick={() => {hashHistory.push('choosemachine')}}>{nowMachine} <Icon type='down' /></span></div>
          <Grid data={this.data} columnNum={3} hasLine={false} onClick={this.chosenModule}/>
        </div>
        )
 }
  
}

export default Main
