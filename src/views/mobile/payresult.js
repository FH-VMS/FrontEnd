import React, {Component} from 'react'
import {Icon, Result, Button} from 'antd-mobile'

class PayResult extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    
  }

  gotoMall = (machineId) => {
    location.href = location.origin + '/p/m.html#/p/' + machineId
  }


  render() {
      let machineId = sessionStorage.getItem('ParamMachineId')
      let show = false
      if (machineId) {
        show = true
      }
      return (
          <div className="payResultContainer">
             <Result
                img={<Icon type="check-circle" className="payResultSvg" style={{ fill: '#1F90E6' }} />}
                title="支付成功"
            />
            <Button onClick={this.gotoMall.bind(this, machineId)} style={{display: show ? 'block' : 'none', marginTop: '30px', marginLeft: 'auto', marginRight: 'auto', width: '95%'}} type="primary">继续购物</Button>
          </div>
        )
 }
  
}

export default PayResult
