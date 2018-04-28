import React, {Component} from 'react'
import {Carousel, Tabs, Badge} from 'antd-mobile'
import EveryProduct from 'COMPONENT/wechat/mall/everyProduct'

class Mall extends Component {
	constructor(props) {
    super(props)
    this.state = {
      productType: [],
      tabTitles: [],
      tabContents: [],
      nowTabContent: {

      }
    }
	}

  componentWillMount() {
  }

  componentDidMount() {
    if (this.props.location.query.clientId) {
      this.props.fetchProductType({clientId: this.props.location.query.clientId}).then(msg => {
        if (this.props.wechat.productTypeData.length > 0) {
          let tabTitles = []
          let tabContents = []
          this.props.wechat.productTypeData.map((item, index) => {
            tabTitles.push({ title: <Badge>{item.WaresTypeName}</Badge> })
            tabContents.push(<div className="tabItem">{this.state.nowTabContent[index]}</div>)
          })
          this.setState({productType: this.props.wechat.productTypeData, tabTitles: tabTitles, tabContents: tabContents})
          this.getProductById(0)
        }
      })
    }
    
  }


  tabChange = (tab, index) => {
    this.getProductById(index)
  }

  getProductById = (index) => {
   
    if (!this.state.nowTabContent[index]) {
      let nowContent = []
      this.props.fetchProduct({typeId: this.state.productType[index].WaresTypeId, clientId: this.props.location.query.clientId}).then(msg => {
        console.log('aaaaa', this.props)
        if (this.props.wechat.productData) {
          this.props.wechat.productData.map((item, index) => {
            nowContent.push(<EveryProduct data={item} />)
          })
          this.state.nowTabContent[index] = nowContent
          this.setState({nowTabContent: this.state.nowTabContent})
        }
     })
    }
    
  }


  render() {
     
     

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
            <Tabs tabs={this.state.tabTitles}
              initialPage={0}
              onChange={this.tabChange.bind(this)}
              onTabClick={(tab, index) => { console.log('onTabClick', index, tab) }}
            >
              {this.state.tabContents}
            </Tabs>
          </div>
        )
 }
  
}

export default Mall
