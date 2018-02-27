import React, {Component} from 'react'
import model from 'STORE/model'
import {Pagination} from 'antd'

class ResourceDialog extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            authData: [], // 权限数据
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
            imageUrl: ''
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize
        }
    }

    componentWillMount() {
     
     this.getData(this.searchPara)
    
    }
    
    // 取数据方法
    getData = (val) => {
      this.setState({loading: true})
       this.props.fetchResource(val).then((msg) => {
         if (this.props.resource) {
           this.setState({dataSource: this.props.resource.data, pagination: {
                total: this.props.resource.pager.TotalRows,
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

   
    
   
    
    


     /* ****************************对弹出框form的操作方法********************************** */

  

     updateDialog = (typ, item) => {
        
    }
     

    
    

    render() {
      

        return (
            <div>
              <div className="resourceContainer">
                  <div className="everyResource newUpload">
                  </div>
              {
                             this.state.dataSource.map((cItem, cIndex) => {
                                 return (
                                    <img src={cItem.PicUrl} />
                                 )
                             })
                         }
                 
              </div>
              <Pagination showSizeChanger onChange={this.state.pagination.onChange} onShowSizeChange={this.state.pagination.onShowSizeChange} defaultPageSize={this.state.pagination.defaultPageSize} defaultCurrent={1} total={this.state.pagination.total} />
             
           </div>
        )
    }
}

export default ResourceDialog
