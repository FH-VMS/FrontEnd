import React, {Component} from 'react'
import EveryProduct from 'COMPONENT/wechat/mall/everyProduct'

class EveryTab extends Component {
	constructor(props) {
        super(props)
        this.state = {
            data: ''
        }
	}

  componentWillMount() {
    
  }

  componentDidMount() {
   // this.getProductById()
  }

  getProductById = () => {
      if (!this.state.data && this.state.data.length == 0) {
        this.props.fetchProduct({typeId: this.props.tabSource.WaresTypeId, clientId: this.props.tabSource.ClientId}).then(msg => {
            if (this.props.wechat.productData) {
              this.setState({data: this.props.wechat.productData})
            }
         })
      }
     
    
    
  }

  render() {
      return (
        <div className="tabItem">
            {
                this.props.data && this.props.data.map((item, index) => {
                    return <EveryProduct onClick={this.props.chooseProduct.bind(this, item)} dataItem = {item} />
                })
            }
        </div>
        )
  }
  
}

export default EveryTab

