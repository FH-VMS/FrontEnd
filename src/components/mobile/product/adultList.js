import React, { Component } from 'react'
import {hashHistory} from 'react-router'
import { ListView } from 'antd-mobile'
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
              PageSize: model.BaseSetting.NoPage,
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

   payPage = (rowData) => {
     this.moneySum.push({tid: rowData.WaresId, n: 1})
     
       let kPara = {}
        kPara.t = this.moneySum
        kPara.m = this.props.keyVal
        hashHistory.push('/paybyproduct?k=' + JSON.stringify(kPara))
     
   }

   gotoAdmin = () => {
     location.href = 'h5.html'
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

      return (
        <div className="rowStyle" onClick = {this.payPage.bind(this, rowData)}>     
             <div className="row">
                <div style={{ display: 'flex' }}>
                  <div>
                     <img src={rowData.PicUrl} />
                  </div>
                  <div className="row-text">
                    <div style={{ fontWeight: 'bold' }}>{rowData.WaresName}</div>
                    <div className="stepperContainer">
                      <div>
                         <div style={{marginBottom: '0.15rem', marginTop: '0.15rem'}}><span style={{ fontSize: '0.4rem', color: '#FF6E27' }}>{rowData.APrice}</span>元/单价</div>
                         <div style={{ fontSize: '0.28rem' }}>库存：{rowData.CurrStock}</div>
                      </div>
                      <div>

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
      return (
        <div>
            <ListView 
                dataSource={this.state.dataSource} 
                renderFooter={() => <div className='adultFooterStyle'>
                     <div>
                       <div><span className="fa fa-home" aria-hidden="true">&nbsp;上海夕半实业有限公司</span></div>
                       <div><span className="fa fa-map-marker" aria-hidden="true">&nbsp;上海市闵行区联航路1188号</span></div>
                       <div><span className="fa fa-phone" aria-hidden="true">&nbsp;400-855-7772</span><a onClick={this.gotoAdmin.bind(this)}>管理</a></div>
                     </div>
                     <div></div>
                  </div>}
                renderRow={this.row.bind(this)} 
                scrollRenderAheadDistance={300}
                scrollEventThrottle={20}
                pageSize={10}
                style={{
                  height: document.documentElement.clientHeight * 2.75 / 4,
                  width: '100%',
                  overflowX: 'hidden',
                  border: '1px solid #ddd'
                }}
            />
        </div>
      )
    }
}

export default ListControl
