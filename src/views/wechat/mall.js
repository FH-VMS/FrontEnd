import React, {Component} from 'react'
import {Carousel, Tabs, Badge} from 'antd-mobile'
import EveryProduct from 'COMPONENT/wechat/mall/everyProduct'

class Mall extends Component {
	constructor(props) {
    super(props)
    this.state = {
      productType: []
    }
	}

  componentWillMount() {
  }

  componentDidMount() {
    if (this.props.location.query.clientId) {
      this.props.fetchProductType({clientId: this.props.location.query.clientId}).then(msg => {
        if (this.props.wechat.productTypeData.length > 0) {
          this.setState({productType: this.props.wechat.productTypeData})
        }
      })
    }
    
  }


  tabChange = (tab, index) => {

  }

  getProductById = (typeIdVal) => {
    this.props.fetchProduct({typeId: typeIdVal, clientId: this.props.location.query.clientId}).then(msg => {
     
    })
  }


  render() {
      let tabTitles = []
      let tabContents = []
      this.state.productType.map((item, index) => {
        tabTitles.push({ title: <Badge>{item.WaresTypeName}</Badge> })
        tabContents.push(<div className="tabItem"><EveryProduct /></div>)
      })

      return (
          <div>
            <Carousel
                autoplay={true}
                infinite
                beforeChange={(from, to) => console.log(`slide from ${from} to ${to}`)}
                afterChange={index => console.log('slide to', index)}
            >
              <img
                src={`https://zos.alipayobjects.com/rmsportal/AiyWuByWklrrUDlFignR.png`}
                alt=""
                style={{ width: '100%', verticalAlign: 'top' }}
                onLoad={() => {
                  // fire window resize event to change height
                  window.dispatchEvent(new Event('resize'))
                }}
              />
              <img
                src={`https://zos.alipayobjects.com/rmsportal/TekJlZRVCjLFexlOCuWn.png`}
                alt=""
                style={{ width: '100%', verticalAlign: 'top' }}
                onLoad={() => {
                  // fire window resize event to change height
                  window.dispatchEvent(new Event('resize'))
                }}
              />
              <img
                src={`https://zos.alipayobjects.com/rmsportal/IJOtIlfsYdTyaDTRVrLI.png`}
                alt=""
                style={{ width: '100%', verticalAlign: 'top' }}
                onLoad={() => {
                  // fire window resize event to change height
                  window.dispatchEvent(new Event('resize'))
                }}
              />
            </Carousel>
            <Tabs tabs={tabTitles}
              initialPage={0}
              onChange={this.tabChange.bind(this)}
              onTabClick={(tab, index) => { console.log('onTabClick', index, tab) }}
            >
              {tabContents}
            </Tabs>
          </div>
        )
 }
  
}

export default Mall
