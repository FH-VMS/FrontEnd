import React, {Component} from 'react'
import {Badge} from 'antd-mobile'

class EveryProduct extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
  }

  componentDidMount() {
    
  }

  render() {
      let {PicUrl, WaresName, WaresUnitPrice} = this.props.dataItem
      return (
        <div className="everyProduct" onClick={this.props.onClick}>
            <div className="productImgArea" style={{backgroundImage: `url(${PicUrl})`}}></div>
            <div className="productDescription">
            <Badge text={`¥${WaresUnitPrice}`} style={{ padding: '0 3px', borderRadius: 0 }} className="productPrice" /><Badge text={WaresName.length > 6 ? WaresName.substr(0, 6) + '...' : WaresName} style={{
              padding: '0 3px',
              backgroundColor: '#fff',
              borderRadius: 2,
              color: '#ff5b05'
            }} /> 
            
          </div>
        </div>
        )
  }
  
}

export default EveryProduct

