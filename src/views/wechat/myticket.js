import React, {Component} from 'react'
import {ListView} from 'antd-mobile'
import EveryPrivilege from 'COMPONENT/wechat/my/everyPrivilege'
import $ from 'jquery'

class MyTicket extends Component {
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
          ds: ds
        }
	}

  componentWillMount() {
    
  }

  componentDidMount() {
    this.queryData()
  }

  queryData = () => {
    let memberInfo = sessionStorage.getItem('wechatInfo')
    if (!memberInfo) {
      return
    }
    let objMember = JSON.parse(memberInfo)
    if (!objMember.openid) {
      return
    }
    let {page} = this.state
    page.memberId = objMember.openid
  
    let {fetchPrivilegeByMember} = this.props
    
    fetchPrivilegeByMember(page).then(msg => {
            this.setState({
                dataSource: this.state.ds.cloneWithRows([...this.state.data, ...this.props.wechat.privilegeData]),
                isLoading: false,
                data: [...this.state.data, ...this.props.wechat.privilegeData],
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

  row = (rowData) => {
  
    return (
      <EveryPrivilege location={this.props.location} data={rowData} />
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
        <div>
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
              height: document.documentElement.clientHeight - $('.globalTabBar').height(),
              width: '100%',
              overflow: 'auto',
              border: '1px solid #ddd'
            }}
        />
           
        </div>
        )
  }
  
}

export default MyTicket

