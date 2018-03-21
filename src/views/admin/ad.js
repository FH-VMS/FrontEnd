import React, {Component} from 'react'
import {Spin} from 'antd'
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
                this.setState({screenData: this.props.ad.data, loading: false})
            } else {
                this.setState({screenData: [this.adTemplateData], loading: false})
            }
        })
    }

    

    showCreatDialog = () => {
       this.state.screenData.push(this.adTemplateData)
       this.setState({screenData: this.state.screenData})
    }
    
    

    render() {
        return (
            <div>
               <Tools searchDatasource={[]} auth={this.state.auth} onCreate={this.showCreatDialog} />
               <Spin size="large" spinning={this.state.loading}>
                 {
                     this.state.screenData.map((item, index) => {
                           return (<ThreeScreen {...this.props} getData={this.getData} data={item}/>)
                      })
                 }
               </Spin>
              
           </div>
        )
    }
}

export default Ad
