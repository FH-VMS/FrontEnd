import React, {Component} from 'react'
import {Carousel, Tabs, Badge, Modal} from 'antd-mobile'

import EveryTab from 'COMPONENT/wechat/mall/everyTab'

const alert = Modal.alert
class Mall extends Component {
	constructor(props) {
    super(props)
    this.state = {
      productType: [],
      tabTitles: [],
      tabContents: []
    }
	}

  componentWillMount() {
  }

  chooseProduct = (item, ev) => {
    alert('Much Buttons', <div>More than two buttons</div>, [
      { text: 'Button1', onPress: () => console.log('第0个按钮被点击了') },
      { text: 'Button2', onPress: () => console.log('第1个按钮被点击了') },
      { text: 'Button3', onPress: () => console.log('第2个按钮被点击了') }
    ])
  }

  componentDidMount() {
    if (this.props.location.query.clientId) {
      this.props.fetchProductType({clientId: this.props.location.query.clientId}).then(msg => {
        if (this.props.wechat.productTypeData.length > 0) {
          let tabTitles = []
          let tabContents = []
          this.props.wechat.productTypeData.map((item, index) => {
            tabTitles.push({ title: <Badge>{item.WaresTypeName}</Badge> })
            tabContents.push(<EveryTab chooseProduct={this.chooseProduct} tabSource = {item} {...this.props} />)
          })
          this.setState({productType: this.props.wechat.productTypeData, tabTitles: tabTitles, tabContents: tabContents})
          // this.getProductById(0)
        }
      })
    }
    
  }


  tabChange = (tab, index) => {
    
  }

  


  render() {
     
      return (
          <div>
            <Carousel
                autoplay={true}
                infinite
                beforeChange={(from, to) => {}}
                afterChange={index => {}}
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
