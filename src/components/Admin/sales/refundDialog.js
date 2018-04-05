import { Modal } from 'antd'
import React, {Component} from 'react'

class RefundDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
        // console.log('iiii', this.props)
    }


 

  componentDidMount() {
  }

    render() {
    const { visible, onCancel, onCreate, title} = this.props
   
    // let userModel = model.User.UserModel
    let payType = this.props.payType
    let refundSource = ''
    let refundStatus = '成功'
    let refundNo = ''
    let refundMoney = ''
    if (payType == 'a') {
        refundSource = '支付宝'
        let obj = this.props.refundDetail
        if (obj.alipay_trade_refund_response.msg == 'Success') {
          refundNo = obj.alipay_trade_refund_response.trade_no
          refundMoney = obj.alipay_trade_refund_response.refund_fee
        }
        
    } else if (payType == 'w') {
      refundSource = '微信'
      refundNo = this.props.refundDetail.out_refund_no
      refundMoney = parseInt(this.props.refundDetail.refund_fee, 0) / 100
    }
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={onCancel}
        onOk={onCreate}
      >
        
          <div className="refundDetail">
            <div>
              <div>商户订单号：</div>
              <div>{this.props.tradeNo}</div>
            </div>
            <div>
              <div>退款来源：</div>
              <div>{refundSource}</div>
            </div>
             <div>
              <div>状态：</div>
              <div>{refundStatus}</div>
            </div>
             <div>
              <div>退款单号：</div>
              <div>{refundNo}</div>
            </div>
             <div>
              <div>退款金额：</div>
              <div>{refundMoney}元</div>
            </div>
          </div>
     
      </Modal>
     
    )
    }
  }


export default RefundDialog
