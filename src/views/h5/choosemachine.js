import React, { Component } from 'react'
import { ListView, List } from 'antd-mobile'
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
              PageSize: 10,
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

   queryData = () => {
     
      let {page} = this.state
      let {fetchMachineList} = this.props
      
      fetchMachineList(page).then(msg => {
               console.log('999999', this.props)
              this.setState({
                  dataSource: this.state.ds.cloneWithRows([...this.state.data, ...this.props.chooseMachine.data]),
                  isLoading: false,
                  data: [...this.state.data, ...this.props.chooseMachine.data],
                  totalCount: parseInt(this.props.chooseMachine.count, 0),
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

   chooseMachine = (rowData, ev) => {
       localStorage.setItem('ChooseMachineDeviceId', rowData.DeviceId)
      hashHistory.push('h5main')
   }

   row = (rowData) => {
     

      return (
         <Item arrow="horizontal" onClick={this.chooseMachine.bind(this, rowData)} extra={rowData.ClientText}>{rowData.DeviceId}</Item>
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
        </div>
      )
    }
}

export default ChooseMachine
