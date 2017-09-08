import React, { Component } from 'react'
import {hashHistory} from 'react-router'
import { ListView, Stepper, Button, Toast } from 'antd-mobile'
import model from 'STORE/model'


class ListControl extends Component {
    constructor(props) {
        super(props)
        
        let ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2})
        this.state = {
            dataSource: ds.cloneWithRows([]),
            isLoading: true,
            data: [],
            totalCount: 0,
            page: {
              PageSize: 10,
              PageIndex: 1,
              k: ''
            },
            ds: ds,
            totalMoney: 0,
            nowCanChosen: false
        }

        this.moneySum = []
        
    }

   componentWillMount() {
      this.state.page.k = this.props.keyVal
      this.queryData()
   }

   onChange = (data, val, ev) => {
      let hasChosen = false
      let totalMoneyIn = 0
      this.moneySum = []
      this.state.data.map((item, index) => {
        if (item.WaresId == data.WaresId) {
            item.buyNum = val
        }
        if (item.buyNum) {
           hasChosen = true
           totalMoneyIn = totalMoneyIn + parseInt(item.buyNum, 0) * parseFloat(item.APrice)
           this.moneySum.push({tid: item.WaresId, n: item.buyNum})
        }

        
      })
      if (hasChosen) {
        this.setState({dataSource: this.state.ds.cloneWithRows(this.state.data), totalMoney: totalMoneyIn, nowCanChosen: true})
      } else {
        this.setState({dataSource: this.state.ds.cloneWithRows(this.state.data), totalMoney: totalMoneyIn, nowCanChosen: false})
      }
      
   }
   
   queryData = () => {
     
      let {page} = this.state
      let {fetchProductByMachine} = this.props
      
      fetchProductByMachine(page).then(msg => {
              // this.generateProductList(msg.data)
              this.setState({
                  dataSource: this.state.ds.cloneWithRows([...this.state.data, ...msg.data]),
                  isLoading: false,
                  data: [...this.state.data, ...msg.data],
                  totalCount: parseInt(msg.count, 0),
                  page: {
                    ...page,
                    PageIndex: (page.PageIndex + 1)
                  }
              })


      })
     
   }

   // 把货道重复的商品合并
   generateProductList = (datas) => {
     for (let cKey in datas) {
       let cItem = datas[cKey]
        if (this.state.data.length == 0) {
          this.state.data.push(cItem)
          continue
        }
          
        let i = 0
        for (let key of this.state.data) {
            i++
            let item = key
            if (!item.CStocks) {
              item.CStocks = []
              item.CStocks.push(item.CurrStock)
            } 
            if (!item.TIds) {
              item.TIds = []
              item.TIds.push(item.TunnelId)
            }
            if (item.WaredsId == cItem.WaredsId) {
               item.CStocks.push(cItem.CurrStock)
               item.TIds.push(cItem.TunnelId)
               break
            } else if (i == this.state.data.length) {
              
              this.state.data.push(cItem)
            }

           
        }
     }

   }

   onEndReached = (event) => {
      const { isLoading } = this.state
       if (!event) {return null}

      if (isLoading) {return null}

       if (this.state.totalCount <= this.state.data.length) {
            this.setState({
            isLoading: false
        })
       } else {
            this.setState({
                 isLoading: true
            })
            this.queryData()
       }
       
   }

   payPage = (idVal, siteVal, event) => {
    if (this.state.totalMoney <= 0) {
      Toast.fail('点+号选择一个商品', 1)
      return
    }
     if (this.moneySum.length > 0) {
       let kPara = {}
        kPara.t = this.moneySum
        kPara.m = this.props.keyVal
        hashHistory.push('/paybyproduct?k=' + JSON.stringify(kPara))
     } else {
       Toast.fail('请选一个商品', 1)
     }
     
   }

   transformTunnelId = (idVal) => {
     let ret = idVal.substring(1, idVal.length)
     let layer = ret.substr(0, 2)
     let num = ret.substr(2, 2)
     
     return parseInt(layer, 0) + '' + (parseInt(num, 0))
   }

   row = (rowData) => {
      if (!rowData.buyNum) {
        rowData.buyNum = 0
      }
      // 只能选一个
      let canChosen = false
      if (rowData.buyNum) {
        canChosen = false
      } else {
         canChosen = this.state.nowCanChosen
      }

      return (
        <div className="rowStyle" >     
             <div className="row">
                <div style={{ display: 'flex' }}>
                  <div>
                     <img src={model.BaseSetting.Root.replace('api', '') + rowData.PicUrl} />
                  </div>
                  <div className="row-text">
                    <div style={{ fontWeight: 'bold' }}>{rowData.WaresName}</div>
                    <div className="stepperContainer">
                      <div>
                         <div style={{marginBottom: '0.15rem', marginTop: '0.15rem'}}><span style={{ fontSize: '0.4rem', color: '#FF6E27' }}>{rowData.APrice}</span>元/单价</div>
                         <div style={{ fontSize: '0.28rem' }}>库存：{rowData.CurrStock}</div>
                      </div>
                      <div><Stepper
                            style={{ width: '100%', minWidth: '2rem' }}
                            showNumber max={rowData.CurrStock == 0 ? 0 : 1} min={0} value={rowData.buyNum} onChange={this.onChange.bind(this, rowData)}
                            disabled={canChosen}
                            readonly
                          />
                      </div>
                    </div>
                    
                  </div>
                </div>
              </div>
        </div>
      )
    }

    /* **************************Tab Bar*************************/
 

    render() {
      const { isLoading } = this.state
      // list view style
      const listViewStyle = {
        height: document.documentElement.clientHeight * 4 / 4,
        overflow: 'auto',
        border: '1px solid #ddd'
      }
      // footer style
      const footerStyle = {
        padding: '0.3rem',
        textAlign: 'center'
      }
      return (
        <div>
            <ListView 
                dataSource={this.state.dataSource} 
                renderFooter={() => <div style={footerStyle}>{isLoading ? '加载中...' : '加载完毕'} </div>}
                renderRow={this.row.bind(this)} 
                style={listViewStyle}
                scrollRenderAheadDistance={300}
                scrollEventThrottle={20}
                pageSize={10}
                onEndReached={this.onEndReached}
                onEndReachedThreshold={10}
                style={{
                  height: document.documentElement.clientHeight * 3.6 / 4,
                  width: '100%',
                  overflowX: 'hidden'
                }}
            />
            <div className="sumContainer">
               <div>
                  总额：<span className="moneyIcon">￥</span><span className="moneySum">{this.state.totalMoney.toFixed(2) || 0}</span>
               </div>
               <div>
                 <Button className="btn" type="primary" onClick={this.payPage}>去结算</Button>
               </div>
            </div>
        </div>
      )
    }
}

export default ListControl
