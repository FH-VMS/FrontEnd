import { Modal} from 'antd'
import React, {Component} from 'react'
import QRCode from 'qrcode.react'

class QrcodeDialog extends Component {
    constructor(props) {
      super(props)
      this.state = {
      }
    }

    componentWillMount() {
    }



    componentDidMount() {

    }


  


    render() {
    // 此为修改
    const { visible, title, qrNowItem} = this.props
    let qrcodeValue = `${location.origin}/p/wechat.html#/pay/${qrNowItem.WaresId}?clientId=${qrNowItem.ClientId}`
    
    
    return (
     
      <Modal
        visible={visible}
        title={title}
        onCancel={this.props.onQrCancel}
        onOk={this.props.onQrCreate}
        maskClosable={false}
        style={{textAlign: 'center'}}
      >
        <QRCode value={qrcodeValue}/>
      </Modal>
     
    )
    }
  }


export default QrcodeDialog
