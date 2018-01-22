import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import {hashHistory} from 'react-router'
import { Table, Spin, Popconfirm, Input } from 'antd'

const { Column } = Table

class MachineOperation extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: [],
            auth: {
                CanAdd: 'none',
                CanDelete: 'none',
                CanModify: 'none',
                CanSearch: 'none'
            },
            pagination: {
                defaultPageSize: model.BaseSetting.PageSize
            },
            loading: false
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize
        }
    }

    componentWillMount() {
     
      this.getData(this.searchPara)
       // 页面级权限
       this.setState({auth: Utility.Cookie.getAuth()})
    }

    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchMachines(val).then((msg) => {
         if (this.props.machineOperation) {
           this.setState({dataSource: this.props.machineOperation.data, pagination: {
                total: this.props.machineOperation.pager.TotalRows,
                showSizeChanger: true,
                onShowSizeChange: (current, pageSize) => {
                    this.searchPara.pageIndex = current
                    this.searchPara.pageSize = pageSize
                    this.getData(this.searchPara)
                },
                onChange: (current) => {
                    this.searchPara.pageIndex = current
                    this.getData(this.searchPara)
                }
           },
           loading: false})
         }
      })
    }
    
    // 查询
    onSearch = (value) => {
          this.searchPara.name = value.name
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }

    handleFullfilByOneKey = (record, e) => {

    }

    // 现金价格下推
    cashPush = (item, ev) => {
        hashHistory.push(`cash/${item.Id}`)
    }
  


    render() {
        
        let searchDatasource = [{
            label: '机器',
            name: 'name',
            control: <Input placeholder="机器编号或名字" />
        }]
        
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={searchDatasource} onSearch={this.onSearch} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="机器"
                        dataIndex="Name"
                        key="Name"
                    />
                    
                    <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                             <Popconfirm title="确认补满吗?" okText="确定" onConfirm={this.handleFullfilByOneKey.bind(this, record)} cancelText="取消">
                                <a>一键补货</a>
                            </Popconfirm>
                            <span className="ant-divider" />
                            <a>详细补货</a>
                            <span className="ant-divider" />
                            <a>最大库存</a>
                            <span className="ant-divider" />
                            <a onClick = {this.cashPush.bind(this, record)}>现金价格</a>
                        </span>
                        )}
                    />
              </Table>
                </Spin>
           </div>
        )
    }
}

export default MachineOperation
