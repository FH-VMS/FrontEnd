import React, {Component} from 'react'
import ListConrol from 'COMPONENT/mobile/product/list'

class Frame extends Component {
	constructor(props) {
		super(props)

	}

  componentWillMount() {
   
  }

  render() {

      return (
        <div>
          <ListConrol fetchProductByMachine={this.props.fetchProductByMachine}/>
        </div>
        )
 }
  
}

export default Frame
