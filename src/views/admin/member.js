import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, Spin, Input } from 'antd'
import DetailDialog from 'COMPONENT/admin/member/privilegeDetailDialog'

const { Column } = Table

class Member extends Component {
    constructor(props) {
		super(props)
        this.state = {
            detailVisible: false,
            dataSource: [],
            dialogTitle: '添加优惠券',
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
            nowRecord: '',
            searchDatasource: [{
                label: '昵称',
                name: 'nickName',
                control: <Input placeholder="昵称" />
            }]
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
       this.props.fetchMemberList(val).then((msg) => {
         if (this.props.member) {
           this.setState({dataSource: this.props.member.data, pagination: {
                total: this.props.member.pager.TotalRows,
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
         this.searchPara.NickName = value.nickName
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
           this.setState({ detailVisible: true, nowRecord: item, dialogTitle: '赠送优惠券' })
    }
    
    

    

    
    
    /* ****************************对弹出框form的操作方法********************************** */
  

    handleCancel = () => {
        this.setState({ detailVisible: false })
    }

    handleCreate = () => {
        /*
        const form = this.form
        form.validateFields((err, values) => {
        if (err) {
            
            return
        }
        values.ExpireTime = Utility.timeFormaterString(values.ExpireTime)
        // 更新
       if (this.state.savePara.PrivilegeId) {
           values.PrivilegeId = this.state.savePara.PrivilegeId
           this.props.givePrivilege({privilegeMemberInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.givePrivilege({privilegeMemberInfo: values}).then((msg) => {
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
        */
        this.setState({ detailVisible: false })
    }

     /* ****************************对弹出框form的操作方法********************************** */
     
     // 修改和删除的权限控制
     getAuth = () =>{
        if (this.state.auth.CanModify != 'none') {
            this.DeleteAndModify = <Column
                        title="操作"
                        key="action"
                        render={(text, record) => (
                        <span>
                             <a>赠券</a>
                             <span className="ant-divider" />
                             <a onClick={this.showDialog.bind(this, '优惠券详情', record)}>优惠券详情</a>
                        </span>
                        )}
                    />
        } else {
            this.DeleteAndModify = <Column
            title="操作"
            key="action"
            render={(text, record) => (
            <span>
                  <a onClick={this.showDialog.bind(this, '优惠券详情', record)}>优惠券详情</a>
            </span>
            )}
        />
        }
    }
    

    render() {
        this.getAuth()
        
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={this.state.searchDatasource} onSearch={this.onSearch} onCreate={this.showDialog} />
              
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
                            if (text == '1') {
                                return '男'
                            } else {
                                return '女'
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
                   {this.DeleteAndModify}
              </Table>
              
              <DetailDialog
                    visible={this.state.detailVisible}
                    onCancel={this.handleCancel}
                    onCreate={this.handleCreate}
                    title={this.state.dialogTitle}
                    nowRecord={this.state.nowRecord}
                    {...this.props}
                 />
                </Spin>
           </div>
        )
    }
}

export default Member
