import React, {Component} from 'react'
import ListConrol from 'COMPONENT/mobile/product/list'

class Product extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    document.title = this.props.params.id
    sessionStorage.setItem('ParamMachineId', this.props.params.id)
  }

  render() {
      return (
          <div>
            <ListConrol {...this.props} keyVal={this.props.params.id} fetchProductByMachine={this.props.fetchProductByMachine}/>
          </div>
        )
 }
  
}

export default Product
