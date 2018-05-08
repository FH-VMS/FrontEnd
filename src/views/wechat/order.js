import React, {Component} from 'react'
import {Tabs, Badge, Button, ListView} from 'antd-mobile'
import {hashHistory} from 'react-router'

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
              PageSize: 15,
              PageIndex: 1
            },
            ds: ds
        }
	}

  componentWillMount() {
  }

  componentDidMount() {

  }


  queryData = () => {
    // let {page} = this.state
    /*
    let {fetchMachineList} = this.props
    
    fetchMachineList(page).then(msg => {
            this.setState({
                dataSource: this.state.ds.cloneWithRows([...this.state.data, ...this.props.chooseMachine.data]),
                isLoading: false,
                data: [...this.state.data, ...this.props.chooseMachine.data],
                totalCount: parseInt(this.props.chooseMachine.pager.TotalRows, 0),
                page: {
                  ...page,
                  PageIndex: (page.PageIndex + 1)
                }
            })
            const heiGap = document.documentElement.clientHeight - ReactDOM.findDOMNode(this.lv).getElementsByClassName('am-list-body')[0].offsetHeight
            if (heiGap > 30 && this.state.data.length < this.state.totalCount) {
                
                this.queryData()
            }

    })
    */
   
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
  // 历史订单
  row = (rowData) => {
    let machineStatus = '未启用'
    if (rowData.LatestOnline) {
        if (parseInt(rowData.LatestOnline, 0) > 900) {
          machineStatus = <span style={{color: 'red'}}>离线</span>
        } else {
          machineStatus = <span style={{color: 'green'}}>在线</span>
        }
        
    }
    return (
       <Item arrow="horizontal" onClick={this.chooseMachine.bind(this, rowData)} extra={rowData.ClientText}>{rowData.DeviceId} <Item.Brief>{rowData.Remark}({machineStatus})</Item.Brief></Item>
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
        onChange={(tab, index) => { }}
        onTabClick={(tab, index) => { }}
      >
        <div className="tabItem">
          <div className="noOrder">
            <div><img src={require('ASSET/img/wechat/cat.png')}/></div>
            <div>暂无订单</div>
            <div> <Button type="warning" inline size="small" onClick={() => {hashHistory.push('' + this.props.location.search)}}>去商城逛逛--></Button></div>
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
              height: document.documentElement.clientHeight * 3.8 / 4,
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

