import React, {Component} from 'react'
import ListConrol from 'COMPONENT/mobile/product/list'

class Frame extends Component {
	constructor(props) {
		super(props)

	}

  componentWillMount() {
    document.title = this.props.params.id
  }

  render() {
      return (
          <div>
            <ListConrol keyVal={this.props.params.id} fetchProductByMachine={this.props.fetchProductByMachine}/>
          </div>
        )
 }
  
}

export default Frame
