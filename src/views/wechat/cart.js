import React, {Component} from 'react'
import {hashHistory} from 'react-router'
import {Button, Stepper, Badge} from 'antd-mobile'
import PropTypes from 'prop-types'
import wechatUtility from 'UTIL/wechatUtility'
class Cart extends Component {
	constructor(props) {
     super(props)
     this.state = {
       data: [],
       totalMoneyIn: 0.00
     }
  }
  
  static contextTypes = {
    callback: PropTypes.func
  }

  componentWillMount() {
    let chosenProducts = wechatUtility.Cart.getData()
    if (chosenProducts) {
      this.setState({data: JSON.parse(chosenProducts)})
    }
  }

  componentDidMount() {

  }

  onChange = (record, val, ev) => {
    let totalMoneyIn = 0
    this.moneySum = []
    this.state.data.map((item, index) => {
      if (item.WaresId == record.WaresId) {
          item.chosenNum = val
      }
      if (item.chosenNum) {
         totalMoneyIn = totalMoneyIn + parseInt(item.chosenNum, 0) * parseFloat(item.WaresUnitPrice)
         this.moneySum.push({tid: item.WaresId, n: item.chosenNum})
      }

      
    })
    this.setState({data: this.state.data, totalMoney: totalMoneyIn})
    wechatUtility.Cart.setData(this.state.data)
 }

 deleteCartProduct = (record) => {
    this.state.data.splice(this.state.data.indexOf(record), 1)
    this.setState({data: this.state.data})
    if (this.state.data.length == 0) {
      wechatUtility.Cart.clearData()
    } else {
      wechatUtility.Cart.setData(this.state.data)
    }
   
    this.context.callback('deletecartproduct', '')
 }

 sumPay = () => {
  sessionStorage.removeItem('immeditelypay')
  hashHistory.push('pay' + this.props.location.search)
 }


  render() {
      return (
        <div className="wechatCart">
          <div className="noOrder" style={{display: this.state.data.length == 0 ? 'block' : 'none'}}>
            <div><img src={require('ASSET/img/wechat/cat.png')}/></div>
            <div>暂无宝贝</div>
            <div> <Button type="warning" inline size="small" onClick={() => {hashHistory.push('' + this.props.location.search)}}>去商城逛逛--></Button></div>
          </div>
          <div style={{display: this.state.data.length == 0 ? 'none' : 'block'}}>
           {
            this.state.data.map((rowData, index) => {
              return (
                <div className="rowStyle" >     
                     <div className="row">
                        <div style={{ display: 'flex' }}>
                          <div>
                             <img src={rowData.PicUrl} />
                          </div>
                          <div className="row-text">
                            <div style={{ fontWeight: 'bold' }}>{rowData.WaresName}</div>
                            <div className="stepperContainer">
                              <div>
                                 <div style={{marginBottom: '0.15rem', marginTop: '0.15rem'}}><span style={{ fontSize: '0.4rem', color: '#FF6E27' }}>{rowData.WaresUnitPrice}</span>元/单价</div>
                                 <div style={{ fontSize: '0.28rem' }}>
                                 </div>
                              </div>
                              <div>
                                <Stepper
                                style={{ width: '100%', minWidth: '2rem' }}
                                showNumber max={10} min={1} value={rowData.chosenNum} onChange={this.onChange.bind(this, rowData)}
                                readonly
                              />
                              </div>
                              <div> <Badge style={{color: '#fff', backgroundColor: '#ff5b05'}} text={'删'} onClick={this.deleteCartProduct.bind(this, rowData)}/></div>
                            </div>
                            
                          </div>
                        </div>
                      </div>
                </div>
              )
            })
           }
             <div style={{textAlign: 'center'}}><Button style={{width: '90%', margin: 'auto'}} type="primary" onClick={this.sumPay.bind(this)}>去结算</Button></div>
          </div>
        </div>
        )
  }
  
}

export default Cart

