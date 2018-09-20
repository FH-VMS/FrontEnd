import React, {Component} from 'react'
import { Modal, Table } from 'antd'
import model from 'STORE/model'

const { Column } = Table

class SelectPanel extends Component {
    constructor(props) {
       super(props)
       this.state = {
            dataSource: [],
            pagination: {
                defaultPageSize: model.BaseSetting.PageSize
            }
        }

        this.searchPara = {
            pageIndex: 1,
            pageSize: model.BaseSetting.PageSize
        }
    }

    componentWillMount() {
      // this.props.fetch()
    
      this.getData(this.searchPara)
    }

    getData = (val) => {
        this.props.fetch().then((msg) => {
              this.setState({dataSource: this.props.tunnelInfo.machineDic, pagination: {
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
              }
            })
          
         })
    }

    render() {
        let {visible, panelClose} = this.props
        return (
            <Modal
            visible={visible}
            footer={null}
            closable={false}
            maskClosable = {true}
            onCancel={panelClose}
            >
            <Table dataSource={this.state.dataSource} pagination={this.state.pagination} showHeader={false}>
                    <Column
                        title="设备编号"
                        dataIndex="DeviceId"
                        key="DeviceId"
                    />
              </Table>
            </Modal>
        )
        
    }
}

export default SelectPanel
