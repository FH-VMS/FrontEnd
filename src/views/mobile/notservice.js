import React, {Component} from 'react'
import {Icon, Result} from 'antd-mobile'

class NotService extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    
  }


  render() {
      return (
          <div className="payResultContainer">
            <Result
            img={<Icon type="cross-circle" className="payResultSvg" style={{ fill: 'red' }} />}
            title="机器不在线"
        />
          </div>
        )
 }
  
}

export default NotService
