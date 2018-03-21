import React, {Component} from 'react'
import {Spin, message} from 'antd'
import ThreeScreen from 'COMPONENT/admin/ad/threeScreen'

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
        this.nowItem = {}
    }

    componentWillMount() {
     // 页面级权限
     this.setState({auth: Utility.Cookie.getAuth()})
    }

    componentDidMount() {
        this.getData()
    }

    // 取数据
    getData = () => {
        this.adTemplateData = model.Ad.AdModel
        this.adTemplateData.Relations = {}
        this.adTemplateData.Resources = {}
        this.setState({loading: true})
        this.props.fetchAd().then(msg => {
            if (this.props.ad.data && this.props.ad.data.length > 0) {
                this.setState({screenData: this.props.ad.data, loading: false})
            } else {
                this.setState({screenData: [this.adTemplateData], loading: false})
            }
        })
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
    
    // 保存模板
    saveAdTemplate = (data) => {
        // let storage = localStorage.getItem('adTemplateData')
        if (data) {
            this.adTemplateData.Id = data.Id
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
                this.adTemplateData.Relations = {}
                message.success('保存成功')
            }
            this.setState({loading: false})
        })
    }

    // 删除模板
    deleteTemplate = (item) => {
        this.props.deleteAd({idList: item.Id}).then(msg => {
            this.setState({loading: false})
            if (msg) {
                message.success('删除成功')
                this.getData()
            }
            
        })
    }

    

    

    render() {
        return (
            <div>
               <Tools searchDatasource={[]} auth={this.state.auth} onCreate={this.showCreatDialog} />
               <Spin size="large" spinning={this.state.loading}>
                 {
                     this.state.screenData.map((item, index) => {
                           return (<ThreeScreen {...this.props} deleteTemplate={this.deleteTemplate} saveAdTemplate={this.saveAdTemplate} data={item} />)
                      })
                 }
                
               </Spin>
              
           </div>
        )
    }
}

export default Ad
