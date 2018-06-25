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
      let {PicUrl, WaresName, WaresUnitPrice, WaresDiscountUnitPrice, WaresWeight, WaresSpecifications} = this.props.dataItem
      let orginPriceText = '活动价：'
      if (!WaresDiscountUnitPrice) {
        WaresDiscountUnitPrice = WaresUnitPrice
      }
      if (WaresUnitPrice == WaresDiscountUnitPrice) {
        orginPriceText = '价格：'
      }
      
      return (
        <div className="everyProduct" onClick={this.props.onClick}>
            <div className="productImgArea" style={{backgroundImage: `url('${PicUrl}')`}}></div>
            <div className="productDescription">
              <div>
                <div className="waresName">{WaresName}</div>
                <div className="waresSpecification" style={{display: WaresWeight && WaresSpecifications ? 'block' : 'none'}}>{WaresWeight} {WaresSpecifications}</div>
              </div>
              <div>
                <div style={{display: orginPriceText == '活动价：' ? 'block' : 'none'}} className="originPrice">原价：¥{WaresUnitPrice}</div>
                <div className="activityPrice">{orginPriceText}¥<span>{WaresDiscountUnitPrice}</span></div>
              </div>
              
              
            </div>
        </div>
        )
  }
  
}

export default EveryProduct

