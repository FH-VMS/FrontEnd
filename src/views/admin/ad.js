import React, {Component} from 'react'
import {Spin, message} from 'antd'
import ThreeScreen from 'COMPONENT/admin/ad/threeScreen'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'
import Tools from 'COMPONENT/admin/common/tools'
import Utility from 'UTIL/utility'

class Ad extends Component {
    constructor(props) {
		super(props)
        this.state = {
            loading: false,
            visible: false,
            threeScreenData: {},
            everyModuleData: [],
            auth: {
                CanAdd: 'none',
                CanDelete: 'none',
                CanModify: 'none',
                CanSearch: 'none'
            }
        }

    }

    componentWillMount() {
     // 页面级权限
     this.setState({auth: Utility.Cookie.getAuth()})
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

    showCreatDialog = () => {

    }

    /* *****************数组上下移动及删除操作**************** */
    arrDelete = (index) => {
        let tmpArr = this.state.everyModuleData
        tmpArr.splice(index, 1)
        this.setState({everyModuleData: tmpArr})
    }

    arrUp = (index) => {
       if (index == 0) {
           return
       }
      
       let tmpArr = this.state.everyModuleData
       tmpArr[index] = tmpArr.splice(index - 1, 1, tmpArr[index])[0]
       this.setState({everyModuleData: tmpArr})
    }

    arrDown = (index) => {
       if (index == this.state.everyModuleData.length - 1) {
           return
       }
       let tmpArr = this.state.everyModuleData
       tmpArr[index] = tmpArr.splice(index + 1, 1, tmpArr[index])[0]
       this.setState({everyModuleData: tmpArr})
    }

    render() {
        return (
            <div>
               <Tools searchDatasource={[]} auth={this.state.auth} onCreate={this.showCreatDialog} />
               <Spin size="large" spinning={this.state.loading}>
                <ThreeScreen arrDown={this.arrDown} arrUp={this.arrUp} arrDelete={this.arrDelete} everyModuleData={this.state.everyModuleData} data={this.state.threeScreenData} chooseResource={this.showResource.bind(this)}/>
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
