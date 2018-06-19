import React, {Component} from 'react'
import {hashHistory} from 'react-router'
import {Icon, Result, Button} from 'antd-mobile'
import PropTypes from 'prop-types'

class PayResult extends Component {
	constructor(props) {
		super(props)
    }
    
    static contextTypes = {
        callback: PropTypes.func
      }

  componentWillMount() {
    sessionStorage.removeItem('immeditelypay')
    this.context.callback('clearcart', '')
  }


  render() {
      return (
          <div className="payResultContainer">
             <Result
                img={<Icon type="check-circle" className="payResultSvg" style={{ fill: '#1F90E6' }} />}
                title="支付成功"
            />

            <div style={{textAlign: 'center', marginTop: '1rem'}}> <Button type="primary" inline size="small" onClick={() => {hashHistory.push('/' + this.props.location.search)}}>继续购物--></Button></div>
          </div>
        )
 }
  
}

export default PayResult
