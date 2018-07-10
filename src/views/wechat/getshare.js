import React, {Component} from 'react'

class GetShare extends Component {
	constructor(props) {
        super(props)
        this.state = {
        }
	}

  componentWillMount() {
     
  }

  componentDidMount() {

  }

  render() {

      return (
        <div>
           <div>{this.props.params.openId}</div>
           <div>{this.props.params.pickupNo}</div>
        </div>
        )
  }
  
}

export default GetShare

