import React, {Component} from 'react'
import {Spin} from 'antd'
import ThreeScreen from 'COMPONENT/admin/ad/threeScreen'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'

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
              <ResourceDialog 
              visible={this.state.visible} 
              handleOk={this.handleOk} 
              handleCancel={this.handleCancel}
              {...this.props}
              />
           </div>
        )
    }
}

export default Ad
