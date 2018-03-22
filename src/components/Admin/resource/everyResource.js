import React, {Component} from 'react'
import {Popconfirm} from 'antd'

class EveryResource extends Component {
    constructor(props) {
		super(props)
    }

    componentWillMount() {
    }

    render() {
        let rHmtl = ''
        if (this.props.data && this.props.data.FileType == '1') {
            rHmtl = <img src={this.props.data.PicUrl} title={this.props.data.PicName} />
        } else if (this.props.data && this.props.data.FileType == '2') {
            rHmtl = <video src={this.props.data.PicUrl} title={this.props.data.PicName}></video>
        }
        return (
            <div className="everyResource">
               <div>{rHmtl}</div>
               
               <div>
               <Popconfirm title="确认删除吗?" onConfirm={this.props.handleDelete.bind(this, this.props.data)} okText="确定" cancelText="取消">
                                <a style={{display: this.props.auth.CanDelete}}>删除</a>
                            </Popconfirm>
                            <span className="ant-divider" />
                            <a style={{display: this.props.auth.CanUpdate}} onClick={this.props.updateDialog.bind(this, '修改', this.props.data)}>编辑</a>
               </div>
           </div>
        )
    }
}

export default EveryResource
