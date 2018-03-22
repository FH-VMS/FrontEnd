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
            },
            templateHtml: ''
        }

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
        this.setState({loading: true})
        this.props.fetchAd().then(msg => {
            if (this.props.ad.data && this.props.ad.data.length > 0) {
                this.state.screenData = this.props.ad.data
            } else {
                this.state.screenData = []
                let emptyModel = {...model.Ad.AdModel}
                emptyModel.Relations = {}
                emptyModel.Resources = {}
                this.state.screenData.push(emptyModel)
            }
           
            this.generateTemplate(this.state.screenData)
        })
    }


    generateTemplate = (gData) => {
        let templateHtmlLet = gData.map((pItem, pIndex) => {
            return (
                    <ThreeScreen {...this.props} deleteTemplate={this.deleteTemplate} saveAdTemplate={this.saveAdTemplate} data={pItem} />
                  )
        })

        this.setState({templateHtml: templateHtmlLet, loading: false})
    }
   
   
 

    showCreatDialog = () => {
        let emptyModel = {...model.Ad.AdModel}
        emptyModel.Relations = {}
        emptyModel.Resources = {}
        this.state.screenData.push(emptyModel)
        this.generateTemplate(this.state.screenData)
        // this.setState({screenData: this.state.screenData})
    }
    
    // 保存模板
    saveAdTemplate = (data) => {
        if (!data.Name) {
            message.warning('模板名称不能为空')
            return
        }
        this.setState({loading: true})
        let tmp = []
        for (let key in data.Resources) {
            data.Resources[key].map((item, index) => {
                let tmpItem = {}
                tmpItem.AdId = data.Id
                tmpItem.SourceId = item.PicId
                tmpItem.Sequence = index + 1
                tmpItem.AdType = key
                tmp.push(tmpItem)
            })
        }
        data.Relations = tmp
        data.Resources = ''
        this.props.addAd({adInfo: data}).then(msg => {
            if (msg) {
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

    judgeNotSaved = () => {
        this.setState({screenData: this.state.screenData})
    }

    

    render() {
        return (
            <div>
               <Tools searchDatasource={[]} auth={this.state.auth} onCreate={this.showCreatDialog} />
               <Spin size="large" spinning={this.state.loading}>
                 {
                     this.state.templateHtml
                 }
                
               </Spin>
              
           </div>
        )
    }
}

export default Ad
