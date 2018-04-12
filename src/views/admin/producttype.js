import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Input, Table, message, Spin, Popconfirm } from 'antd'
import Dialog from 'COMPONENT/admin/product/productTypeDialog'

const { Column } = Table

class ProductType extends Component {
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
            savePara: model.Product.ProductTypeModel,
            searchDatasource: [{
                label: '类型名称',
                name: 'WaresTypeName',
                control: <Input placeholder="类型名称" />
            },
            {
                label: '客户',
                name: 'ClientName',
                control: <Input placeholder="客户名称" />
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
       this.props.fetchProductType(val).then((msg) => {
         if (this.props.productType) {
          
           this.setState({dataSource: this.props.productType.data, pagination: {
                total: this.props.productType.pager.TotalRows,
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
          this.searchPara.waresTypeName = value.WaresTypeName
          this.searchPara.clientName = value.ClientName
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: model.Product.ProductTypeModel })
         } else {
            this.setState({ visible: true, savePara: item })
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        if (record.WaresTypeId) {
            this.props.deleteProductType({idList: record.WaresTypeId}).then(msg => {
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
        // 更新
       if (this.state.savePara.WaresTypeId) {
           values.WaresTypeId = this.state.savePara.WaresTypeId
           this.props.updateProductType({productTypeInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addProductType({productTypeInfo: values}).then((msg) => {
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
                        title="名称"
                        dataIndex="WaresTypeName"
                        key="WaresTypeName"
                    />
                    <Column
                        title="排序"
                        dataIndex="Sequence"
                        key="Sequence"
                    />
                    <Column
                        title="所属客户"
                        dataIndex="ClientName"
                        key="ClientName"
                    />
                   {this.DeleteAndModify}
              </Table>
              <Dialog ref={this.saveFormRef}
                        visible={this.state.visible}
                        onCancel={this.handleCancel}
                        onCreate={this.handleCreate}
                        title="商品类型"
                        {...fields}
                 />
                </Spin>
           </div>
        )
    }
}

export default ProductType
