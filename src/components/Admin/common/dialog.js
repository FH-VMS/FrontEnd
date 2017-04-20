import React, {Component} from 'react'
import { Modal } from 'antd'

class DialogControl extends Component {
    constructor(props) {
       super(props)
    }

    render() {
        let {visible, title, style, onOk, onCancel, content} = this.props
        return (
            <div>
            <Modal width={style.width} title={title}
            visible={visible}
            onOk={onOk}
            onCancel={onCancel}>
            <p>{content}</p>
            </Modal>
          </div>
        )
        
    }
}

export default DialogControl
