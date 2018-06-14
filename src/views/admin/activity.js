import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, Popconfirm, Input, Select } from 'antd'
import Dialog from 'COMPONENT/admin/privilege/activityDialog'

const { Column } = Table

class Activity extends Component {
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
            loading: false,
            savePara: {},
            searchDatasource: [],
            privilegeGroupDic: [],
            timeRuleDic: []
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
     
     // 查询条件
        let searchDatasource = [{
            label: '活动名称',
            name: 'waresName',
            control: <Input placeholder="活动名称" />
        }]
        this.props.fetchDic({id: 'privilegegroup'}).then(msg => {
            if (msg) {
              let typeDicSelect = msg.map((item, index) => {
                return (
                  <Option value={item.Value}>{item.BookChinese}</Option>
                )
              })
  
              searchDatasource.push({
                  label: '类型',
                  name: 'activityType',
                  control: <Select>
                      {typeDicSelect}
                  </Select>
              })
  
              this.setState({searchDatasource: searchDatasource, loading: false, privilegeGroupDic: msg})
            }
        })
        this.props.fetchDic({id: 'timerule'}).then(msg => {
          if (msg) {
            this.setState({loading: false, timeRuleDic: msg})
          }
      })
     
    
     
      
    }

    
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchActivity(val).then((msg) => {
         if (this.props.activity) {
           this.setState({dataSource: this.props.activity.data, pagination: {
                total: this.props.activity.pager.TotalRows,
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
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: {}})
         } else {
            this.props.fetchActivityRelationById({activityId: item.Id}).then(msg => {
                let {relationData} = this.props.activity
                if (relationData) {
                    item.RelationData = []
                    $.each(relationData, (index, eItem) => {
                       item.RelationData.push({key: eItem.PrivilegeId, rate: eItem.Rate})
                    })
                }
                this.setState({ visible: true, savePara: item})
            })
            
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        
        if (record.WaresId) {
            this.props.deleteActivity({idList: record.Id}).then(msg => {
                if (msg) {
                    message.success('删除成功')
                    this.getData(this.searchPara)
                }
            })
        }
    }
    
    /* ****************************对弹出框form的操作方法********************************** */
    saveFormRef = (form) => {
        this.form = form
    }

    handleCancel = () => {
        this.setState({ visible: false })
    }

    handleCreate = () => {
        const form = this.form
        form.validateFields((err, values) => {
        if (err) {
            return
        }
       
        if (values.RelationData && values.RelationData.length > 0) {
            values.RelationData = []
            $.each(values.RelationData, (index, item) => {
                values.lstProductRelation.push({PrivilegeId: item.key, Rate: values[item.key]})
            })
        }
        // 更新
       if (this.state.savePara.Id) {
           values.Id = this.state.savePara.Id
           this.props.updateActivity({activityInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addActivity({activityInfo: values}).then((msg) => {
             if (msg) {
                message.success('保存成功')
                this.getData(this.searchPara)
             } else {
                message.warning('保存失败')
             }
              
        })
       }
        
     
        form.resetFields()
        this.setState({ visible: false })
        })
    }

     /* ****************************对弹出框form的操作方法********************************** */
     
     // 修改和删除的权限控制
    getAuth = () =>{
        if (this.state.auth.CanDelete == 'none' && this.state.auth.CanModify == 'none') {
            this.DeleteAndModify = ''
        } else if (this.state.auth.CanDelete == 'none') {
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                            <a onClick={this.showDialog.bind(this, '修改', record)}>修改</a>
                        </span>
                        )}
                    />
        } else if (this.state.auth.CanModify == 'none') {
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                             <Popconfirm title="确认删除吗?" onConfirm={this.handleDelete.bind(this, record)} okText="确定" cancelText="取消">
                                <a style={{display: this.state.auth.CanDelete}}>删除</a>
                            </Popconfirm>
                        </span>
                        )}
                    />
        } else {
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                             <Popconfirm title="确认删除吗?" onConfirm={this.handleDelete.bind(this, record)} okText="确定" cancelText="取消">
                                <a style={{display: this.state.auth.CanDelete}}>删除</a>
                            </Popconfirm>
                            <span className="ant-divider" />
                            <a onClick={this.showDialog.bind(this, '修改', record)}>修改</a>
                        </span>
                        )}
                    />
        }
    }
    

    render() {
        this.getAuth()
        
        

        // 修改时直接绑定参数
        const fields = this.state.savePara
        
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={this.state.searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              <Table dataSource={this.state.dataSource} pagination={this.state.pagination}>
                    <Column
                        title="活动名称"
                        dataIndex="Name"
                        key="Name"
                    />
                    <Column
                        title="类型"
                        dataIndex="ActivityTypeText"
                        key="ActivityTypeText"
                    />
                    <Column
                        title="时间规则"
                        dataIndex="TimeRuleText"
                        key="TimeRuleText"
                    />
                   
                     <Column
                        title="活动开始"
                        dataIndex="StartTime"
                        key="StartTime"
                        render={(text, record) => {
                            if (text == '0001-01-01T00:00:00') {
                                return ''
                            } else {
                                return text.replace('T', ' ')
                            }
                        }
                      }
                    />
                    <Column
                    title="活动结束时间"
                    dataIndex="EndTime"
                    key="EndTime"
                    render={(text, record) => {
                        if (text == '0001-01-01T00:00:00') {
                            return ''
                        } else {
                            return text.replace('T', ' ')
                        }
                    }
                  }
                />
                <Column
                title="活动创建时间"
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
                   {this.DeleteAndModify}
              </Table>
              <Dialog ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="添加活动"
                        {...fields}
                        privilegeGroupDic={this.state.privilegeGroupDic}
                        timeRuleDic={this.state.timeRuleDic}
                 />
                </Spin>
           </div>
        )
    }
}

export default Activity
