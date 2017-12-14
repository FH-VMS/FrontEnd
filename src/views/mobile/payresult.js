import React, {Component} from 'react'
import {Icon, Result} from 'antd-mobile'

class PayResult extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    
  }


  render() {
      return (
          <div className="payResultContainer">
             <Result
                img={<Icon type="check-circle" className="payResultSvg" style={{ fill: '#1F90E6' }} />}
                title="支付成功"
            />
          </div>
        )
 }
  
}

export default PayResult
