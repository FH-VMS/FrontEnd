import React, {Component} from 'react'
import {Carousel, Tabs, Modal, Stepper, Badge} from 'antd-mobile'
import {hashHistory} from 'react-router'
import PropTypes from 'prop-types'
import $ from 'jquery'

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
      nowProduct: {},
      carouselData: [],
      nowPage: 0
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

  adapterTab = () => {
    $('#wechatTabs').height(document.documentElement.clientHeight - $('.globalTabBar').height() - $('#wechatCarousel').height())
  }

  componentDidMount() {
    if (this.props.location.query.clientId) {
      // this.props.fetchProductType({clientId: this.props.location.query.clientId}).then(msg => {
        // if (this.props.wechat.productTypeData.length > 0) {
          this.props.fetchProduct({typeId: '', clientId: this.props.location.query.clientId}).then(msg => {
            let productObj = {}
            let productTypeArr = []
            if (this.props.wechat.productData) {
              
              this.props.wechat.productData.map((item, index) => {
                 if (!productObj[item.WaresTypeId]) {
                    productTypeArr.push({productTypeId: item.WaresTypeId, productTypeName: item.WaresTypeText})
                    productObj[item.WaresTypeId] = []
                    productObj[item.WaresTypeId].push(item)
                   
                 } else {
                   productObj[item.WaresTypeId].push(item)
                 }

                 
              })
              let tabs = []
              let tabContents = []
              productTypeArr.map((item, index) => {
                tabs.push({ title: <Badge>{item.productTypeName}</Badge> })
                tabContents.push(<EveryTab chooseProduct={this.chooseProduct} data={productObj[item.productTypeId]} />)
               })
               this.setState({productType: this.props.wechat.productTypeData, tabTitles: tabs, tabContents: tabContents})
              
            }
            if (/iPhone|iPod|iPad/i.test(navigator.userAgent)) {
              setTimeout(() => {
                  this.setState({nowPage: 1})
                  this.setState({nowPage: 0})
              }, 200)
            }
         })
          /*
          let tabTitles = []
          let tabContents = []
          this.props.wechat.productTypeData.map((item, index) => {
            tabTitles.push({ title: <Badge>{item.WaresTypeName}</Badge> })
            tabContents.push(<EveryTab chooseProduct={this.chooseProduct} tabSource = {item} {...this.props} />)
          })
          this.setState({productType: this.props.wechat.productTypeData, tabTitles: tabTitles, tabContents: tabContents})
          */
          // this.getProductById(0)
        // }
      // })
    }

    this.getCarousel()
    this.adapterTab()
    
  }

  getCarousel = () => {
    if (this.props.location.query.clientId) {
       this.props.fetchWechatSetting({clientId: this.props.location.query.clientId}).then(msg => {
         if (this.props.wechat && this.props.wechat.wechatSettingData && this.props.wechat.wechatSettingData.CarouselJson) {
           this.setState({carouselData: JSON.parse(this.props.wechat.wechatSettingData.CarouselJson)})
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
    this.setState({nowPage: index})
  }

  stepChange = (val) => {
    this.state.nowProduct.chosenNum = val
    this.setState({nowProduct: this.state.nowProduct})
  }

  // 去结算
  gotoPay = () => {
     if (!this.state.nowProduct.chosenNum) {
        this.state.nowProduct.chosenNum = 1
     }
     sessionStorage.setItem('immeditelypay', JSON.stringify([this.state.nowProduct]))
     hashHistory.push('pay' + this.props.location.search)
  }

  addToCart = () => {
    this.context.callback('addcart', this.state.nowProduct)
    this.setState({nowProduct: {}, modal: false})
  }

  render() {
    const tabs = this.state.tabTitles
      return (
          <div>
            <div id="wechatCarousel">
            <Carousel
                autoplay={true}
                infinite
                beforeChange={(from, to) => {}}
                afterChange={index => {}}
                style={{height: '3rem'}}
            >
              {
                this.state.carouselData.map((item, index) => {
                  return <img
                        src={item.PicUrl}
                        alt=""
                        style={{ width: '100%', height: '3.5rem', verticalAlign: 'top', objectFit: 'cover' }}
                        onLoad={() => {
                          // fire window resize event to change height
                          window.dispatchEvent(new Event('resize'))
                        }}
                      />
                })
              }
              
            </Carousel>
            </div>
            <div id='wechatTabs'>
            <Tabs tabs={tabs}
              initialPage={0}
              onChange={this.tabChange.bind(this)}
              onTabClick={(tab, index) => { this.setState({nowPage: index}) }}
              renderTabBar={props => <Tabs.DefaultTabBar {...props} page={4} />}
              page={this.state.nowPage}
              renderTab={tab => <span>{tab.title}</span>}
            >
              {this.state.tabContents}
            </Tabs>
            </div>
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
                              <div style={{marginBottom: '0.15rem', marginTop: '0.15rem'}}><span style={{ fontSize: '0.4rem', color: '#FF6E27' }}>{this.state.nowProduct.WaresDiscountUnitPrice}</span>元/单价</div>
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
