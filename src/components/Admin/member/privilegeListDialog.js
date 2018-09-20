import { Modal, Table, message } from 'antd'
import React, {Component} from 'react'
import model from 'STORE/model'

const { Column } = Table

class PrivilegeListDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
          dataSource: [],
          pagination: {
              defaultPageSize: model.BaseSetting.PageSize
          },
          canLoad: true,
          selectedRowKeys: []
      }

      this.searchPara = {
          pageIndex: 1,
          pageSize: model.BaseSetting.PageSize
      }
    }

    componentWillMount() {
        this.rowData = ''
    }


 

  componentDidMount() {
      
 }

    generatePrivilegeList = () => {
      // let {page} = this.state
    
      let {fetchPrivilegeList} = this.props
      this.state.canLoad = false
      fetchPrivilegeList(this.searchPara).then(msg => {
              this.setState({
                  dataSource: this.props.member.privilegeListData, pagination: {
                  total: this.props.member.privilegeListPager.TotalRows,
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
        if (!this.rowData) {
            message.warning('请选择一个优惠券')
            return
        }
        Modal.confirm({
            title: '确认框',
            content: '确定赠送吗?',
            onOk: () => {
                this.props.onCreate(this.rowData)
                this.state.canLoad = true
            },
            onCancel: () => {}
          })
        
        
    }

    onSelectChange = (selectedRowKeys, rows) => {
        this.rowData = rows[0]
        this.setState({ selectedRowKeys })
    }

    render() {
    const { visible, title} = this.props
    if (visible && this.state.canLoad) {
      this.generatePrivilegeList()
    }
    const { selectedRowKeys } = this.state
    const rowSelection = {
      selectedRowKeys,
      onChange: this.onSelectChange,
      type: 'radio'
    }
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={this.onCancel}
        onOk={this.onCreate}
        style={{minWidth: '800px'}}
       
      >
      <Table rowSelection={rowSelection} dataSource={this.state.dataSource} pagination={this.state.pagination}>
          <Column
              title="券名"
              dataIndex="PrivilegeName"
              key="PrivilegeName"
          />
          <Column
              title="类型"
              dataIndex="PrincipleTypeText"
              key="PrincipleTypeText"
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
                title="数量"
                dataIndex="Numbers"
                key="Numbers"
            />
            <Column
                title="过期规则"
                dataIndex="TimeRuleText"
                key="TimeRuleText"
            />
            <Column
                title="是否可叠加"
                dataIndex="IsOverlay"
                key="IsOverlay"
                render={(text, record) => {
                    if (text) {
                        return '是'
                    } else {
                        return '否'
                    }
                  }
                }
            />
            <Column
                title="是否绑定商品"
                dataIndex="IsBind"
                key="IsBind"
                render={(text, record) => {
                    if (text) {
                        return '是'
                    } else {
                        return '否'
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
          title="开始时间"
          dataIndex="StartTime"
          key="StartTime"
          render={(text, record) => {
              if (text == '0001-01-01T00:00:00') {
                  return '立即'
              } else {
                  return text.replace('T', ' ')
              }
          }
        }
      />
          <Column
          title="过期时间"
          dataIndex="ExpireTime"
          key="ExpireTime"
          render={(text, record) => {
              if (text == '0001-01-01T00:00:00') {
                  return '-'
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


export default PrivilegeListDialog
