import React, {Component} from 'react'
import {Modal, Select} from 'antd'

class EditDialog extends Component {
    constructor(props) {
        super(props)
        
    }

    componentWillMount() {
        this.nowTyp = ''
    }

    belongChange = (val) => {
        this.nowTyp = val
    }

    handleOk = () => {
        this.props.handleOk(this.nowTyp)
    }

    handleCancel = () => {
        this.nowTyp = ''
        this.props.handleCancel()
    }
    render() {
        let typSelect = this.props.typDic.map((item, index) => {
            return (
                <Option value={item.Value}>{item.BookChinese}</Option>
              )
        })
        this.nowTyp = this.props.nowItem.Belong
        return (
            <Modal
            maskClosable={false}
            closable = {false}
            visible={this.props.visible}
            onOk={this.handleOk}
            onCancel={this.handleCancel}
            >
             <div className="resourceModal">
               <div><img src={this.props.nowItem.PicUrl} style={{width: '180px', height: '180px'}} /></div>
               <div><Select onChange={this.belongChange} defaultValue={this.props.nowItem.Belong} placeholder="选择属于" style={{width: '80%'}}>
                  {typSelect}
               </Select></div>
               </div>
            </Modal>
            
        )
    }
}

export default EditDialog
