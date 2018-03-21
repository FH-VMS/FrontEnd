import React, {Component} from 'react'
import {Spin, message} from 'antd'
import ThreeScreen from 'COMPONENT/admin/ad/threeScreen'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'
import Tools from 'COMPONENT/admin/common/tools'
import Utility from 'UTIL/utility'
import model from 'STORE/model'

class Ad extends Component {
    constructor(props) {
		super(props)
        this.state = {
            loading: false,
            visible: false,
            screenData: [],
            everyModuleData: [],
            auth: {
                CanAdd: 'none',
                CanDelete: 'none',
                CanModify: 'none',
                CanSearch: 'none'
            }
        }

        this.adTemplateData = model.Ad.AdModel
        this.adTemplateData.Relations = {}
        this.adTemplateData.Resources = {}
        this.nowPosition = 1
    }

    componentWillMount() {
     // 页面级权限
     this.setState({auth: Utility.Cookie.getAuth()})
    }

    componentDidMount() {
        this.setState({loading: true})
        this.props.fetchAd().then(msg => {
            if (this.props.ad.data && this.props.ad.data.length > 0) {
                this.setState({screenData: this.props.ad.data, loading: false})
            } else {
                this.setState({screenData: [this.adTemplateData], loading: false})
            }
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
            this.generateAdData(this.state.everyModuleData)
        }
    }

    generateAdData = (data) => {
        /*
        let tmp = []
        data.each((item, index) => {
            let tmpItem = {}
            tmpItem.AdId = this.adTemplateData.Id
            tmpItem.SourceId = item.PicId
            tmpItem.Sequence = index + 1
            tmpItem.AdType = this.nowPosition
            tmp.push(tmpItem)
        })
        */
        this.adTemplateData.Resources[this.nowPosition] = data
    }

    showCreatDialog = () => {

    }

    saveAdTemplate = (data) => {
        // let storage = localStorage.getItem('adTemplateData')
        if (data) {
            this.adTemplateData.Id = data.Id
            this.adTemplateData.Name = data.Name
        }
        if (!this.adTemplateData.Name) {
            message.warning('模板名称不能为空')
            return
        }
        this.setState({loading: true})
        let tmp = []
        for (let key in this.adTemplateData.Resources) {
            this.adTemplateData.Resources[key].map((item, index) => {
                let tmpItem = {}
                tmpItem.AdId = this.adTemplateData.Id
                tmpItem.SourceId = item.PicId
                tmpItem.Sequence = index + 1
                tmpItem.AdType = key
                tmp.push(tmpItem)
            })
        }
        this.adTemplateData.Relations = tmp
        this.adTemplateData.Resources = ''
        this.props.addAd({adInfo: this.adTemplateData}).then(msg => {
            if (msg) {
                this.adTemplateData = model.Ad.AdModel
                this.adTemplateData.Resources = {}
            }
            this.setState({loading: false})
        })
    }

    templateNameChange = (val) =>{
        this.adTemplateData.Name = val.target.value
    }

    
    chooseModule = (txt, item, ev) => {
        
        // txt: 1(上)，2(中)，3(下)
        this.nowPosition = txt
        if (ev) {
            $(ev.currentTarget).siblings().css('background-color', '#fff')
            $(ev.currentTarget).css('background-color', '#ccc')
        }
        
        if (this.adTemplateData.Resources[this.nowPosition]) {
            this.setState({everyModuleData: this.adTemplateData.Resources[this.nowPosition]})
        } else if (item.Id) {
            this.props.fetchAdById({adId: item.Id, adType: txt}).then(msg => {
                this.adTemplateData.Resources[this.nowPosition] = msg
                this.setState({everyModuleData: this.adTemplateData.Resources[this.nowPosition]})
            })
        } else {
            this.setState({everyModuleData: []})
        }
     }

    /* *****************数组上下移动及删除操作**************** */
    arrDelete = (index) => {
        let tmpArr = this.state.everyModuleData
        tmpArr.splice(index, 1)
        this.setState({everyModuleData: tmpArr})
        this.generateAdData(tmpArr)
    }

    arrUp = (index) => {
       if (index == 0) {
           return
       }
      
       let tmpArr = this.state.everyModuleData
       tmpArr[index] = tmpArr.splice(index - 1, 1, tmpArr[index])[0]
       this.setState({everyModuleData: tmpArr})
       this.generateAdData(tmpArr)
    }

    arrDown = (index) => {
       if (index == this.state.everyModuleData.length - 1) {
           return
       }
       let tmpArr = this.state.everyModuleData
       tmpArr[index] = tmpArr.splice(index + 1, 1, tmpArr[index])[0]
       this.setState({everyModuleData: tmpArr})
       this.generateAdData(tmpArr)
    }

    render() {
        return (
            <div>
               <Tools searchDatasource={[]} auth={this.state.auth} onCreate={this.showCreatDialog} />
               <Spin size="large" spinning={this.state.loading}>
                 {
                     this.state.screenData.map((item, index) => {
                           return (<ThreeScreen templateNameChange={this.templateNameChange} chooseModule={this.chooseModule} saveAdTemplate={this.saveAdTemplate} arrDown={this.arrDown} arrUp={this.arrUp} arrDelete={this.arrDelete} everyModuleData={this.state.everyModuleData} data={item} chooseResource={this.showResource.bind(this)}/>)
                      })
                 }
                
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
