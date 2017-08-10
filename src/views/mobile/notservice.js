import React, {Component} from 'react'
import {Icon} from 'antd-mobile'

class NotService extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    
  }


  render() {
      return (
          <div className="payResultContainer">
            <div> <Icon type="cross-circle" style={{color: 'red'}} className="icon" /></div>
            <div>机器不在线</div>
          </div>
        )
 }
  
}

export default NotService
