import React, {Component} from 'react'
import {Icon} from 'antd-mobile'

class PayResult extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    
  }


  render() {
      return (
          <div className="payResultContainer">
            <div> <Icon type="check-circle" className="icon" /></div>
            <div>支付成功</div>
          </div>
        )
 }
  
}

export default PayResult
