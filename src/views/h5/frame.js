import React, {Component} from 'react'
import {hashHistory} from 'react-router'
import Utility from 'UTIL/utility'
import 'ASSET/less/h5.less'

class Frame extends Component {
	constructor(props) {
		super(props)
    this.state = {
      name: '',
      showBar: false
    }
	}

  componentWillMount() {
    
     let userInfo = Utility.Cookie.getValue('UserInfo')
     
    if (userInfo && userInfo.UserAccount) {
      this.setState({name: userInfo.UserAccount})
       // hashHistory.push('h5main')
    } else {
        hashHistory.push('')
    }
  }

  logOut = () => {
    Utility.Cookie.clear('UserInfo')
    hashHistory.push('')
  }



  render() {

      return (
          <div className="hfiveGlobalStyle">
            {this.props.children}
          </div>
        )
 }
  
}

export default Frame
