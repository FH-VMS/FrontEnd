import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import { ListView, List, NavBar } from 'antd-mobile'
import {hashHistory} from 'react-router'

const { Item } = List
class ChooseMachine extends Component {
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
            ds: ds,
            totalMoney: 0,
            nowCanChosen: false
        }

        
    }


    componentWillMount() {
      this.queryData()
   }

   componentDidMount() {
    
    
   }

   queryData = () => {
      let {page} = this.state
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

   chooseMachine = (rowData, ev) => {
       localStorage.setItem('ChooseMachineDeviceId', rowData.DeviceId)
      hashHistory.push('h5main')
   }

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

    /* **************************Tab Bar*************************/
 

    render() {
      const { isLoading } = this.state
      // list view style
      // footer style
      const footerStyle = {
        padding: '0.3rem',
        textAlign: 'center'
      }
      return (
        <div>
            <NavBar
          mode="dark"
          onLeftClick={() => hashHistory.push('h5main')}
          leftContent="返回"
          rightContent={[
            <span onClick={() => hashHistory.push('')}>退出</span>
          ]}
          >选择机器</NavBar>
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
      )
    }
}

export default ChooseMachine
