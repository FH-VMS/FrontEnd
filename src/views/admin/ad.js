import React, {Component} from 'react'
import {Spin, Modal} from 'antd'
import ThreeScreen from 'COMPONENT/admin/ad/threeScreen'

class Ad extends Component {
    constructor(props) {
		super(props)
        this.state = {
            loading: false,
            visible: false
        }

    }

    componentWillMount() {
     
    }

    showResource = () => {
       this.setState({visible: true})
    }

    handleOk = () => {

    }
    
    handleCancel = () => {
      this.setState({visible: false})
    }
    

    render() {
       

        return (
            <div>
               <Spin size="large" spinning={this.state.loading}>
                <ThreeScreen chooseResource={this.showResource.bind(this)}/>
               </Spin>
               <Modal
                maskClosable={false}
                closable = {false}
                visible={this.state.visible}
                onOk={this.handleOk}
                onCancel={this.handleCancel}
                >
                <p>Some contents...</p>
                <p>Some contents...</p>
                <p>Some contents...</p>
                </Modal>
           </div>
        )
    }
}

export default Ad
