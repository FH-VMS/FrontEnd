import { Modal, Table } from 'antd'
import React, {Component} from 'react'
import model from 'STORE/model'

const { Column } = Table

class PrivilegeDetailDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
          dataSource: [],
          pagination: {
              defaultPageSize: model.BaseSetting.PageSize
          },
          canLoad: true
      }

      this.searchPara = {
          pageIndex: 1,
          pageSize: model.BaseSetting.PageSize
      }
    }

    componentWillMount() {
        // console.log('iiii', this.props)
    }


 

  componentDidMount() {
      
    }

    generatePrivilegeList = () => {
      // let {page} = this.state
      console.log('oooooo', this.props.nowRecord)
      this.searchPara.memberId = this.props.nowRecord.OpenId
    
      let {fetchPrivilegeByMember} = this.props
      this.state.canLoad = false
      fetchPrivilegeByMember(this.searchPara).then(msg => {
              console.log('llllll', msg)
              this.setState({
                  dataSource: msg.data, pagination: {
                  total: msg.pager.TotalRows,
                  showSizeChanger: true,
                  onShowSizeChange: (current, pageSize) => {
                      this.searchPara.pageIndex = current
                      this.searchPara.pageSize = pageSize
                      this.getData(this.searchPara)
                  },
                  onChange: (current) => {
                      this.searchPara.pageIndex = current
                      this.getData(this.searchPara)
                  },
                  canLoad: false
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

    render() {
    const { visible, onCancel, onCreate, title} = this.props
    if (visible && this.state.canLoad) {
      this.generatePrivilegeList()
    }
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={onCancel}
        onOk={onCreate}
      >
      <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
          <Column
              title="昵称"
              dataIndex="NickName"
              key="NickName"
          />
          <Column
              title="性别"
              dataIndex="Sex"
              key="Sex"
              render={(text, record) => {
                  if (text) {
                      return text
                  } else {
                      return '-'
                  }
              }
              }
          />
          <Column
              title="国家"
              dataIndex="Country"
              key="Country"
          />
          <Column
              title="省份"
              dataIndex="Province"
              key="Province"
          />
          <Column
              title="城市"
              dataIndex="City"
              key="City"
            
          />
          <Column
              title="所属客户"
              dataIndex="ClientName"
              key="ClientName"
          
          />
          <Column
              title="创建日期"
              dataIndex="CreateDate"
              key="CreateDate"
              render={(text, record) => {
                  if (text == '0001-01-01T00:00:00') {
                      return ''
                  } else {
                      return text.replace('T', ' ')
                  }
              }
            }
          />
    </Table>
     
      </Modal>
     
    )
    }
  }


export default PrivilegeDetailDialog
