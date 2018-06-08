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
                console.log('00000', this.props)
              this.setState({
                  dataSource: this.props.member.privilegeData, pagination: {
                  total: this.props.member.privilegePager.TotalRows,
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

    onCancel = () => {
        this.state.canLoad = true
        this.props.onCancel()
    }

    onCreate = () => {
        this.state.canLoad = true
        this.props.onCreate()
    }

    render() {
    const { visible, title} = this.props
    if (visible && this.state.canLoad) {
      this.generatePrivilegeList()
    }
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={this.onCancel}
        onOk={this.onCreate}
      >
      <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
          <Column
              title="券名"
              dataIndex="PrivilegeName"
              key="PrivilegeName"
          />
          <Column
              title="状态"
              dataIndex="Status"
              key="Status"
              render={(text, record) => {
               
                if (record.PrivilegeStatus == 2) {
                   return '已使用'
                } else {
                    var ex = new Date(record.ExpireTime)
                    var now = new Date()
                    let isExipire = false
                    if (now.getTime() > ex.getTime()) {
                        isExipire = true
                    }
                    if (isExipire) {
                        return '已过期'
                    } else {
                        return '已领取'
                    }
                }
              }
              }
          />
          <Column
              title="类型"
              dataIndex="PrivilegeTypeText"
              key="PrivilegeTypeText"
          />
          <Column
              title="券额(折扣或赠品)"
              dataIndex="Privielege"
              key="Privielege"
              render={(text, record) => {
                  if (record.Money) {
                      return record.Money + '元'
                  } 
                  if (record.Discount) {
                      return record.Discount + '折'
                  }
                  if (record.BindProductIds) {
                      return record.WaresName
                  }
              }
            }
          />
          <Column
              title="使用限额"
              dataIndex="UseMoneyLimit"
              key="UseMoneyLimit"
              render={(text, record) => {
                  if (text > 0) {
                      return text + '元'
                  } else {
                     return '无'
                  }
              }
            }
          />
          <Column
          title="使用日期"
          dataIndex="HappenDate"
          key="HappenDate"
          render={(text, record) => {
              if (record.PrivilegeStatus != 2) {
                  return '-'
              }
              if (text == '0001-01-01T00:00:00') {
                  return ''
              } else {
                  return text.replace('T', ' ')
              }
          }
        }
      />
          <Column
              title="领取日期"
              dataIndex="GetDate"
              key="GetDate"
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
