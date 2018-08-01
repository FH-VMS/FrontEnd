import React, {Component} from 'react'
import { Spin, Tabs, Row, Col, TreeSelect, message} from 'antd'
import Carousel from 'COMPONENT/admin/websetting/carousel'
import Utility from 'UTIL/utility'
const TabPane = Tabs.TabPane

class WechatSetting extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: [],
            loading: false,
            clientDicData: [],
            clientId: '',
            webInfo: {}
        }
    }


    componentDidMount() {
        // 客户字典
        this.props.fetchClientDic().then(msg => {
            
            if (msg) {
                this.setState({clientDicData: Utility.getTreeClient(msg), loading: false})
            }

        
        })

        this.getData(this.state.clientId)
    }

    filterClient = (inputValue, treeNode) => {
        return treeNode.props.title.toLowerCase().indexOf(inputValue.toLowerCase()) >= 0
     }

    clientChanged = (val) => {
      this.setState({clientId: val})
      this.getData(val)
    }

    tabCallback = (key) => {

    }

    // 保存
    saveWebSetting = () => {
       let savePara = this.state.webInfo
       savePara.clientId = this.state.clientId
       this.props.createWebSetting({webSettingInfo: savePara}).then(msg => {
           if (msg) {
               message.success('保存成功')
           }
       })
    }

    
    // 取数据方法
    getData = (val) => {
        this.props.fetchWebSetting({clientId: val}).then(msg => {
            if (this.props.wechatSetting.webData && this.props.wechatSetting.webData.length > 0) {
               this.setState({webInfo: this.props.wechatSetting.webData[0]})
            } else {
                this.setState({webInfo: {}})
            }
        })
    }
    

    render() {
        
      
        
        return (
            <div className="webSettingContainer">
               <Spin size="large" spinning={this.state.loading}>
               <Row>
                  <Col span={24} style={{textAlign: 'right'}}>选择客户 <TreeSelect
                  style = {{width: 300}}
                  dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
                  treeData={this.state.clientDicData}
                  treeDefaultExpandAll
                  showSearch
                  filterTreeNode={this.filterClient}
                  onSelect={this.clientChanged}
                /></Col>
               </Row>
               <Tabs defaultActiveKey="1" onChange={this.tabCallback}>
               <TabPane tab="首页滚动图" key="1"><Carousel saveWebSetting={this.saveWebSetting} webInfo={this.state.webInfo} {...this.props}/></TabPane>
               {
                   /*
                   <TabPane tab="客服设置" key="2">Content of Tab Pane 2</TabPane>
                   */
               }
               
             </Tabs>
               </Spin>
           </div>
        )
    }
}

export default WechatSetting
