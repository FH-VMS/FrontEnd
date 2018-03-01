import React, {Component} from 'react'
import {Spin, message} from 'antd'
import ThreeScreen from 'COMPONENT/admin/ad/threeScreen'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'

class Ad extends Component {
    constructor(props) {
		super(props)
        this.state = {
            loading: false,
            visible: false,
            threeScreenData: {},
            everyModuleData: []
        }

    }

    componentWillMount() {
     
    }

    componentDidMount() {
        this.props.fetchAd().then(msg => {
            // console.log('aaaaaa', this.props.ad)
        })
    }

    showResource = () => {
       this.setState({visible: true})
    }

    handleOk = () => {

    }
    
    handleCancel = () => {
      this.setState({visible: false})
    }
    
    resourceClick = (resourceItem, ev) => {
        console.log('aaaaa', resourceItem)
        if (this.state.everyModuleData.length == 5) {
            message.warning('资源不能大于五个！')
            return
        }
        let canPush = true
        for (var i = 0; i < this.state.everyModuleData.length; i++) {
            if (this.state.everyModuleData[i].PicId == resourceItem.PicId) {
                canPush = false
               
            }
        }

        if (canPush) {
            this.state.everyModuleData.push(resourceItem)
            this.setState({everyModuleData: this.state.everyModuleData})
        }
    }

    render() {
        return (
            <div>
               <Spin size="large" spinning={this.state.loading}>
                <ThreeScreen everyModuleData={this.state.everyModuleData} data={this.state.threeScreenData} chooseResource={this.showResource.bind(this)}/>
               </Spin>
              <ResourceDialog 
              visible={this.state.visible} 
              handleOk={this.handleOk} 
              handleCancel={this.handleCancel}
              resourceClick={this.resourceClick}
              {...this.props}
              />
           </div>
        )
    }
}

export default Ad
