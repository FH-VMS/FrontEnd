import React, {Component} from 'react'
import {Tabs, Badge, Button, ListView} from 'antd-mobile'
import wechatUtility from 'UTIL/wechatUtility'
import {hashHistory} from 'react-router'
import ReactDOM from 'react-dom'



class Order extends Component {
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
              PageIndex: 1
            },
            ds: ds,
            waitingData: []
        }
	}

  componentWillMount() {
  }

  componentDidMount() {
    this.queryWaitingData()
  }

  queryWaitingData = () => {
   
      let openIdVal = wechatUtility.GetMemberId()
      if (!openIdVal) {
        return
      }
    
      this.props.fetchWaitingSalesList({openId: openIdVal}).then(msg => {
          if (this.props.wechat && this.props.wechat.waitingList) {
            this.setState({waitingData: this.props.wechat.waitingList})
          }
      })
  }

  tabChange = (tab, index) => {
    if (index == 1) {
       if (this.state.data.length == 0) {
         this.queryData()
       }
    } else {
      if (this.state.waitingData.length == 0) {
        this.queryWaitingData()
      }
    }
  }


  queryData = () => {
    let openId = wechatUtility.GetMemberId()
    if (!openId) {
      return
    }
    let {page} = this.state
    page.openId = openId
  
    let {fetchHistorySalesList} = this.props
    
    fetchHistorySalesList(page).then(msg => {
            this.setState({
                dataSource: this.state.ds.cloneWithRows([...this.state.data, ...this.props.wechat.historyList]),
                isLoading: false,
                data: [...this.state.data, ...this.props.wechat.historyList],
                page: {
                  ...page,
                  PageIndex: (page.PageIndex + 1)
                }
            })
            /*
            const heiGap = document.documentElement.clientHeight - ReactDOM.findDOMNode(this.lv).getElementsByClassName('am-list-body')[0].offsetHeight
            if (heiGap > 30 && this.state.data.length < this.state.totalCount) {
                
                this.queryData()
            }
            */

    })
    
   
 }

  onEndReached = (event) => {
    
       const { isLoading } = this.state
        if (!event) {return null}
 
       if (isLoading) {return null}
        /*
        if (this.state.totalCount <= this.state.data.length) {
             this.setState({
             isLoading: false
         })
        } else {
          */
             this.setState({
                  isLoading: true
             })
             this.queryData()
       // }
        
    }
  // 历史订单
  row = (rowData) => {
    let tStatus = '其它'
    switch (rowData.TradeStatus) {
      case '1':
         tStatus = '待出货'
      break
      case '2':
        tStatus = '已出货'
      break
      case '8':
        tStatus = '已提货'
      break
    }
    let txtDate = rowData.SalesDate
      if (txtDate == '0001-01-01T00:00:00') {
        txtDate = ''
      } else {
        txtDate = txtDate.replace('T', ' ')
      }
  
    return (
       <div className="historyOrderRow">
          <div>
             <div>{rowData.WaresName}*{rowData.SalesNumber}</div>
             <div>{rowData.TradeNo}</div>
          </div>
          <div>
            <div>{tStatus} <Badge text={`¥${rowData.TradeAmount}`} style={{ padding: '0 3px', borderRadius: 0 }} /></div>
            <div>{txtDate}</div>
          </div>
       </div>
    )
  }

  render() {
    const { isLoading } = this.state
    // list view style
    // footer style
    const footerStyle = {
      padding: '0.3rem',
      textAlign: 'center'
    }
      return (
        <div className="wechatOrder">
        <Tabs tabs={[
          { title: <Badge>待提货</Badge> },
          { title: <Badge>历史订单</Badge> }
        ]}
        initialPage={0}
        onChange={this.tabChange}
        onTabClick={(tab, index) => { }}
      >
        <div className="tabItem">
          {
            this.state.waitingData.map((item, index) => {
              return <div className="historyOrderRow">
                      <div>
                        <div>{item.WaresName}</div>
                        <div>{item.TradeNo}</div>
                      </div>
                      <div className="pickUpCode">
                        {item.PickupNo}
                      </div>
                  </div>
            })
          }
          <div className="noOrder" style={{display: this.state.waitingData.length == 0 ? 'block' : 'none'}}>
            <div><img src={require('ASSET/img/wechat/cat.png')}/></div>
            <div>暂无订单</div>
            <div> <Button type="warning" inline size="small" onClick={() => {hashHistory.push('/' + this.props.location.search)}}>去商城逛逛--></Button></div>
          </div>
        </div>
        <div className="tabItem">
        <ListView 
            ref={el => this.lv = el}
            dataSource={this.state.dataSource} 
            renderFooter={() => <div style={footerStyle}>{isLoading ? '加载中...' : '加载完毕'} </div>}
            renderRow={this.row.bind(this)} 
            scrollRenderAheadDistance={300}
            scrollEventThrottle={1}
            initialListSize={100}
            onEndReached={this.onEndReached}
            onEndReachedThreshold={30}
            style={{
              height: document.documentElement.clientHeight * 3.2 / 4,
              width: '100%',
              overflow: 'auto',
              border: '1px solid #ddd'
            }}
        />
        </div>
      </Tabs>
      </div>
        )
  }
  
}

export default Order

