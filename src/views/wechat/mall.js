import React, {Component} from 'react'
import {Carousel, Tabs, Badge, Modal, Stepper} from 'antd-mobile'
import PropTypes from 'prop-types'

import EveryTab from 'COMPONENT/wechat/mall/everyTab'

function closest(el, selector) {
  const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector
  while (el) {
    if (matchesSelector.call(el, selector)) {
      return el
    }
    el = el.parentElement
  }
  return null
}

class Mall extends Component {
	constructor(props) {
    super(props)
    this.state = {
      productType: [],
      tabTitles: [],
      tabContents: [],
      modal: false,
      nowProduct: {}
    }
  }
  
  static contextTypes = {
    callback: PropTypes.func
  }

  componentWillMount() {
  }

  chooseProduct = (item, ev) => {
    this.setState({nowProduct: item, modal: true})
  }

  onClose = key => () => {
    this.setState({
      [key]: false
    })
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

  onWrapTouchStart = (e) => {
    // fix touch to scroll background page on iOS
    if (!/iPhone|iPod|iPad/i.test(navigator.userAgent)) {
      return
    }
    const pNode = closest(e.target, '.am-modal-content')
    if (!pNode) {
      e.preventDefault()
    }
  }



  tabChange = (tab, index) => {
    
  }

  stepChange = (val) => {
    this.state.nowProduct.chosenNum = val
    this.setState({nowProduct: this.state.nowProduct})
  }

  // 去结算
  gotoPay = () => {

  }

  addToCart = () => {
    this.context.callback('addcart', this.state.nowProduct)
    this.setState({nowProduct: {}, modal: false})
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
            <Modal
            visible={this.state.modal}
            transparent
            closable={true}
            onClose ={this.onClose('modal')}
            footer={[
              { text: '去结算', onPress: () => {this.gotoPay()} },
              { text: '加入购物车', onPress: () => {this.addToCart()} }
            ]}
            wrapProps={{ onTouchStart: this.onWrapTouchStart }}
            style = {{width: '98%'}}
            >
            <div className="wechatCart">
                <div className="rowStyle" style={{borderBottom: 'none'}}>     
                  <div className="row" style={{padding: 0}}>
                    <div style={{ display: 'flex' }}>
                      <div>
                          <img style={{ height: '150px', marginRight: '15px' }} src={this.state.nowProduct.PicUrl} />
                      </div>
                      <div className="row-text">
                        <div style={{ fontWeight: 'bold', textAlign: 'left' }}>{this.state.nowProduct.WaresName}</div>
                        <div className="stepperContainer" style={{textAlign: 'left' }}>
                          <div>
                              <div style={{marginBottom: '0.15rem', marginTop: '0.15rem'}}><span style={{ fontSize: '0.4rem', color: '#FF6E27' }}>{this.state.nowProduct.WaresUnitPrice}</span>元/单价</div>
                              <div style={{ fontSize: '0.28rem' }}>
                              </div>
                          </div>
                          <div>
                            <Stepper
                              style={{ width: '100%', minWidth: '2rem' }}
                              showNumber
                              max={10}
                              min={1}
                              readonly
                              value={this.state.nowProduct.chosenNum ? this.state.nowProduct.chosenNum : 1}
                              onChange={this.stepChange}
                            />
                          </div>
                        </div>
                        
                      </div>
                    </div>
                  </div>
            </div>
            </div>
          <div className="productDescriptArea">
             <div>商品描述</div>
             <div>{this.state.nowProduct.WaresDescription}</div>
          </div>
            </Modal>
          </div>
        )
 }
  
}

export default Mall
