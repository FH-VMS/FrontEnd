import React, {Component} from 'react'
import Utility from 'UTIL/utility'
import Tools from 'COMPONENT/admin/common/tools'
import EveryTunnel from 'COMPONENT/admin/machine/everyTunnel'
import { Spin, Select, message, Button} from 'antd'


class TunnelConfig extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            templateHtml: '',
            machineDic: [],
            searchDatasource: [],
            cabinetDataSource: [],
            productDic: [],
            cabinetId: '',
            auth: {
                CanAdd: 'none',
                CanDelete: 'none',
                CanModify: 'none',
                CanSearch: 'none'
            }
        }
        
    }

    componentWillMount() {
        this.constructData = []
     // 页面级权限
     let authVal = Utility.Cookie.getAuth()
     authVal.CanAdd = 'none'
     authVal.CanDelete = 'none'
     this.setState({auth: authVal})
     this.setState({loading: true})
     // 取机器字典
     this.props.fetchMachineDic().then(msg => {
         if (this.props.tunnelConfig && this.props.tunnelConfig.machineDic) {
             this.state.machineDic = this.props.tunnelConfig.machineDic
             let searchDatasource = []
             let typeDicSelect = this.state.machineDic.map((item, index) => {
              return (
                <Option value={item.Id}>{item.Name}</Option>
              )
            })
            searchDatasource.push({
                label: '选择机器',
                name: 'machineId',
                control: <Select showSearch optionFilterProp="children" filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0} onChange={this.machineChange}> 
                    {typeDicSelect}
                </Select>
            })

             searchDatasource.push({
                label: '机柜',
                name: 'cabinetId',
                control: <Select>
                  
                </Select>
            })
            
             this.setState({searchDatasource: searchDatasource, loading: false})
             
         }
     })

     this.nowPosition = 0
    }

    machineChange = (value) => {
        let chosenItem = ''
        $.each(this.state.machineDic, (index, item) => {
          if (item.Id == value) {
              chosenItem = item
              return false
          }
        })
        if (chosenItem && chosenItem.children) {
             let chosen = ''
             let typeDicSelect = chosenItem.children.map((item, index) => {
              if (index == 0) {
                 chosen = item.Id
                }
              return (
                <Option value={item.Id}>{item.Name}</Option>
              )
            })

            if (this.state.searchDatasource.length == 2) {
                this.state.searchDatasource.splice(1, 1)
            }
             this.state.searchDatasource.push({
                label: '机柜',
                name: 'cabinetId',
                control: <Select>
                    {typeDicSelect}
                </Select>
            })
            this.setState({searchDatasource: this.state.searchDatasource, cabinetId: chosen})
        }
    }
    
   
    
    // 查询
    onSearch = (value) => {
       if (!value.machineId) {
           message.warning('请选择机器')
           return
       }

       if (!value.cabinetId) {
           message.warning('请选择机柜')
           return
       }
        this.constructData = []
       this.setState({loading: true})
       this.props.fetchTunnelConfig({machineId: value.machineId, cabinetId: value.cabinetId}).then(msg => {
            this.getTemplate(this.props.tunnelConfig.data)
           this.setState({loading: false})
       })
       
       this.props.fetchProductDic().then(msg => {
            this.setState({productDic: this.props.tunnelConfig.productDic})
       })
       
    }
    
   getTemplate = (data) => {
      if (this.constructData.length > 0) {
          return
      }
      $.each(data, (index, item) => {
          if (index == 0) {
                  this.constructData[item.TunnelPosition.split('-')[0]] = []
                  this.constructData[item.TunnelPosition.split('-')[0]].push(item)
              
          } else if (item.TunnelPosition.split('-')[0] == data[index - 1].TunnelPosition.split('-')[0]) {
                  this.constructData[item.TunnelPosition.split('-')[0]].push(item)
          } else {
              this.constructData[item.TunnelPosition.split('-')[0]] = []
              this.constructData[item.TunnelPosition.split('-')[0]].push(item)
          }
      })
     
     let templateHtmlLet = this.constructData.map((pItem, pIndex) => {
         return (
             <li>
               <div><div className="rowNumber">{pIndex}</div></div>
               <div>
              {
                  pItem.map((cItem, cIndex) => {
                      return (
                          <EveryTunnel fetchPriceByWaresId = {this.props.fetchPriceByWaresId} datasource = {cItem} productDic={this.state.productDic} />
                      )
                  })
              }
              </div>
             </li>
         )
     })
     this.setState({templateHtml: templateHtmlLet})
   }

   saveTunnels = () => {
        this.setState({loading: true})
       let canSave = true
       $('#tunnelTemplate').find('.textRequired').each((index, dom) => {
           var select = $(dom).find('.ant-select-selection-selected-value')
           if ($(dom).find('input').val() || (select[0] && select.attr('title'))) {
             
           } else {
              $(dom).addClass('textRequiredStyle')
                canSave = false
                this.setState({loading: false})
               return true
           }
           
           
       })

       if (canSave) {
           // 可以保存了
           var saveArr = []
           for (let info in this.constructData) {
               if (info) {
                 
                   saveArr.push.apply(saveArr, this.constructData[info])
                   
               }
           }
            
           this.props.addTunnelConfig({tunnelConfigInfo: saveArr}).then(msg => {
              if (msg) {
                  message.success('保存成功')
              }
               this.setState({loading: false})
           })
       }
      
   }


    render() {
       
       let showSaveButton = this.state.auth.CanModify
       // 选中机器默认选中货柜
        let fields = {cabinetId: this.state.cabinetId}
        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
              <Tools auth={this.state.auth} searchDatasource={this.state.searchDatasource} defaultValue={fields} onSearch={this.onSearch} />
                <div className="tunnelConfigArea">
                   <ul className="tunnelTemplate" id="tunnelTemplate">
                     {this.state.templateHtml}
                   </ul>
                </div>
                <div className="tunnelSaveButton"> <Button type="primary" style={{width: '150px', display: showSaveButton}} size="large" onClick={this.saveTunnels}>保存</Button></div>
                </Spin>
           </div>
        )
    }
}

export default TunnelConfig
