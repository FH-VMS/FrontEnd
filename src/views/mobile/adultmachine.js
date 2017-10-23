import React, {Component} from 'react'
import AdultList from 'COMPONENT/mobile/product/adultList'
import {Carousel} from 'antd-mobile'
import 'ASSET/less/adult-machine.less'
class AdultMachine extends Component {
	constructor(props) {
		super(props)

	}

  componentWillMount() {
    document.title = this.props.params.id
  }

  render() {
      return (
        <div> <Carousel 
        autoplay = {true}
        infinite>
        <img
          src={`https://zos.alipayobjects.com/rmsportal/QcWDkUhvYIVEcvtosxMF.png`}
          alt="icon"
          style = {{width: '100%'}}
          onLoad={() => {
          }}
        />
       </Carousel>
          <div>
            
             <AdultList keyVal={this.props.params.id} fetchProductByMachine={this.props.fetchProductByMachine}/>
          </div>
          </div>
        )
 }
  
}

export default AdultMachine
