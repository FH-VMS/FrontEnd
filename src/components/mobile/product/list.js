import React, { Component } from 'react'
import {hashHistory} from 'react-router'
import { ListView, Stepper, Button } from 'antd-mobile'
import {handleUrlParams} from 'UTIL/mobileUtility'
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
            totalMoney: 0
        }

        this.moneySum = []
        
    }

   componentWillMount() {
      
      let searchPara = handleUrlParams(window.location.href.split('?')[1])
      this.state.page.k = searchPara.k
      this.queryData()
   }

   onChange = (data, val, ev) => {
      let totalMoneyIn = 0
      this.moneySum = []
      this.state.data.map((item, index) => {
        if (item.TunnelId == data.TunnelId) {
            item.buyNum = val
        }
        if (item.buyNum) {
           totalMoneyIn = totalMoneyIn + parseInt(item.buyNum, 0) * parseFloat(item.APrice)
           this.moneySum.push(item)
        }
        
      })
      
      this.setState({dataSource: this.state.ds.cloneWithRows(this.state.data), totalMoney: totalMoneyIn})
   }
   
   queryData = () => {
     
      let {page} = this.state
      let {fetchProductByMachine} = this.props
      
      fetchProductByMachine(page).then(msg => {
              this.setState({
                  dataSource: this.state.ds.cloneWithRows(this.state.data.concat(msg.data)),
                  isLoading: false,
                  data: this.state.data.concat(msg.data),
                  totalCount: parseInt(msg.count, 0),
                  page: {
                    ...page,
                    PageIndex: (page.PageIndex + 1)
                  }
              })
      })
     
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

     sessionStorage.setItem('totalSumProduct', JSON.stringify(this.moneySum))
     hashHistory.push('/')
   }

   row = (rowData) => {
      if (!rowData.buyNum) {
        rowData.buyNum = 0
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
                         <div style={{ fontSize: '0.3rem' }}>库存：{rowData.CurrStock || 0}</div>
                      </div>
                      <div><Stepper
                            style={{ width: '100%', minWidth: '2rem' }}
                            showNumber max={10} min={0} value={rowData.buyNum} onChange={this.onChange.bind(this, rowData)}
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
