import React, {Component} from 'react'
import {Pagination, Modal, Radio} from 'antd'

const RadioGroup = Radio.Group

class ResourceDialog extends Component {
    constructor(props) {
		super(props)
        this.state = {
            dataSource: [],
            pagination: {
                defaultPageSize: 10
            },
            loading: false,
            value: 2
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: 10,
            fileType: 2
        }
    }

    componentWillMount() {
     
      
    
    }

    componentDidMount() {
        this.getDataReource(this.searchPara)
    }
    
    // 取数据方法
    getDataReource = (val) => {
      this.setState({loading: true})
       this.props.fetchResource(val).then((msg) => {
         if (msg) {
           this.setState({dataSource: msg.data, pagination: {
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
                }
           },
           loading: false})
         }
      })
    }

   
    
   
    
    


     /* ****************************对弹出框form的操作方法********************************** */

  


    radioChange = (e) => {
        this.setState({
            value: e.target.value
          })

          this.searchPara.fileType = e.target.value
          this.getDataReource(this.searchPara)
    }
     

    
    

    render() {
      
       console.log('aaaa', this.state.dataSource)
        return (
            <Modal
            maskClosable={false}
            closable = {false}
            visible={this.props.visible}
            onOk={this.props.handleOk}
            onCancel={this.props.handleCancel}
            >
            <div>
                <div>
                <RadioGroup onChange={this.radioChange} value={this.state.value}>
                    <Radio value={1}>图片</Radio>
                    <Radio value={2}>视频</Radio>
                </RadioGroup>
                </div>
            <div className="imgContainer">
            {
                           this.state.dataSource.map((cItem, cIndex) => {
                               if (cItem.FileType == '1') {
                                    return (
                                        <img src={cItem.PicUrl} title={cItem.PicName} onClick={this.props.resourceClick.bind(this, cItem)}/>
                                    )
                               } else {
                                    return (
                                        <video src={cItem.PicUrl} title={cItem.PicName} onClick={this.props.resourceClick.bind(this, cItem)}/>
                                    )
                               }
                               
                           })
                       }
               
            </div>
            <Pagination showSizeChanger onChange={this.state.pagination.onChange} onShowSizeChange={this.state.pagination.onShowSizeChange} defaultPageSize={this.state.pagination.defaultPageSize} defaultCurrent={1} total={this.state.pagination.total} />
         </div>
            </Modal>
            
        )
    }
}

export default ResourceDialog
