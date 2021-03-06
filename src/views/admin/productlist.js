import React, {Component} from 'react'
import model from 'STORE/model'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import { Table, message, Spin, Popconfirm, Input, Tooltip } from 'antd'
import Dialog from 'COMPONENT/admin/product/productListDialog'
import QrDialog from 'COMPONENT/admin/product/qrcodeDialog'

const { Column } = Table

class ProductList extends Component {
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
            savePara: model.Product.ProductListModel,
            searchDatasource: [],
            qrVisible: false,
            qrNowItem: ''
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
            label: '商品名称',
            name: 'waresName',
            control: <Input placeholder="商品名称" />
        },
        {
            label: '商品类型',
            name: 'waresType',
            control: <Input placeholder="商品类型" />
        }]

        this.setState({searchDatasource: searchDatasource})
     
    
     
      
    }

    
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchProductList(val).then((msg) => {
         if (this.props.productList) {
           this.setState({dataSource: this.props.productList.data, pagination: {
                total: this.props.productList.pager.TotalRows,
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
          this.searchPara.waresName = value.waresName
        

          this.searchPara.waresTypeId = value.waresTypeId
         
         
         this.searchPara.pageIndex = 1
         this.getData(this.searchPara)
    }
    
    // 新增或修改
    showDialog = (txt, item, e) => {
         if (txt == '创建') {
           this.setState({ visible: true, savePara: model.Product.ProductListModel })
         } else {
            this.setState({ visible: true, savePara: item })
         }
         
    }

    // 删除
    handleDelete = (record, e) => {
        
        if (record.WaresId) {
            this.props.deleteProductList({idList: record.WaresId}).then(msg => {
                if (msg) {
                    message.success('删除成功')
                    this.getData(this.searchPara)
                }
            })
        }
    }

    showQrcode = (item) => {
        this.setState({qrVisible: true, qrNowItem: item})
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
       if (this.state.savePara.WaresId) {
           values.WaresId = this.state.savePara.WaresId
           values.WaresManufactureDate = Utility.dateFormaterString(values.WaresManufactureDate)
           values.WaresQualityPeriod = Utility.dateFormaterString(values.WaresQualityPeriod)
          
           this.props.updateProductList({productListInfo: values}).then((msg) => {
               if (msg) {
                  message.success('更新成功')
                  this.getData(this.searchPara)
               } else {
                  message.warning('更新失败')
               }
           })
          
       } else {
           this.props.addProductList({productListInfo: values}).then((msg) => {
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
                        title="商品名称"
                        dataIndex="WaresName"
                        key="WaresName"
                    />
                    <Column
                        title="原价"
                        dataIndex="WaresUnitPrice"
                        key="WaresUnitPrice"
                    />
                    <Column
                        title="活动价"
                        dataIndex="WaresDiscountUnitPrice"
                        key="WaresDiscountUnitPrice"
                    />
                    <Column
                        title="容量"
                        dataIndex="WaresWeight"
                        key="WaresWeight"
                    />
                    <Column
                        title="规格"
                        dataIndex="WaresSpecifications"
                        key="WaresSpecifications"
                    />
                    <Column
                        title="生产日期"
                        dataIndex="WaresManufactureDate"
                        key="WaresManufactureDate"
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
                        title="保质期"
                        dataIndex="WaresQualityPeriod"
                        key="WaresQualityPeriod"
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
                        title="所属客户"
                        dataIndex="ClientName"
                        key="ClientName"
                    />
                     <Column
                        title="图片"
                        dataIndex="PicUrl"
                        key="PicUrl"
                    />
                    <Column
                        title="商品类型"
                        dataIndex="WaresTypeText"
                        key="WaresTypeText"
                    />
                    <Column
                        title="状态"
                        dataIndex="WaresStatusText"
                        key="WaresStatusText"
                        render={(text, record) => {
                            if (record.WaresStatus == '1') {
                                return <span style={{color: 'green'}}>上架</span>
                                
                            } else if (record.WaresStatus == '2') {
                                return <span style={{color: 'red'}}>下架</span>
                            } else if (record.WaresStatus == '3') {
                                return <Tooltip placement="top" title={'生成二维码'}><div onClick={this.showQrcode.bind(this, record)} style={{cursor: 'pointer'}}><span style={{color: 'blue'}}>线下</span><i className="fa fa-qrcode"></i></div></Tooltip>
                            } else {
                                return ''
                            }
                        }
                    }
                    />
                     <Column
                        title="供应商"
                        dataIndex="Supplier"
                        key="Supplier"
                    />
                     <Column
                        title="更新日期"
                        dataIndex="UpdateDate"
                        key="UpdateDate"
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
                        title="添加商品"
                        {...fields}
                        fetchPictureDic={this.props.fetchPictureDic}
                        fetchProductTypeDic={this.props.fetchProductTypeDic}
                        fetchDic={this.props.fetchDic}
                 />
                 <QrDialog 
                    visible={this.state.qrVisible}
                    onQrCreate = {() => {this.setState({qrVisible: false})}}
                    onQrCancel = {() => {this.setState({qrVisible: false})}}
                    qrNowItem = {this.state.qrNowItem}
                    title='生成二维码'
                 />
                </Spin>
           </div>
        )
    }
}

export default ProductList
