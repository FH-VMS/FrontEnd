import React, {Component} from 'react'


import 'ASSET/less/mobile.less'

class Frame extends Component {
	constructor(props) {
		super(props)

	}

  componentWillMount() {
    
  }

  render() {

      return (
        <div className="mobileGlobalStyle">
           {this.props.children}
        </div>
        )
 }
  
}

export default Frame
