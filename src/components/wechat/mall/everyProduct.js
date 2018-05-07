import React, {Component} from 'react'

class EveryProduct extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
  }

  componentDidMount() {
    
  }

  render() {
      let {PicUrl, WaresName} = this.props.dataItem
      return (
        <div className="everyProduct" onClick={this.props.onClick}>
            <div className="productImgArea" style={{backgroundImage: `url(${PicUrl})`}}></div>
            <div className="productDescription">{WaresName}</div>
        </div>
        )
  }
  
}

export default EveryProduct

