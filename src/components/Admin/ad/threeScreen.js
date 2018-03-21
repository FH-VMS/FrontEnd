import React, { Component } from 'react'
import {Button, Icon, Table, Avatar, Input, Row, Col, Popconfirm, message} from 'antd'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'
import model from 'STORE/model'

const { Column } = Table

class ThreeScreen extends Component {
    constructor(props) {
        super(props)
        this.state = {
            settingPanel: [],
            everyModuleData: [],
            loading: false,
            visible: false
        }

        this.adTemplateData = model.Ad.AdModel
        this.adTemplateData.Relations = {}
        this.adTemplateData.Resources = {}
        this.nowPosition = 1
    }

    componentWillMount() {
        
    }

    showResource = () => {
        this.setState({visible: true})
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
                this.props.getData()
            }
            
        })
    }

    templateNameChange = (item, ev) =>{
        this.adTemplateData.Name = ev.target.value
        this.setState({loading: true})
        if (!this.adTemplateData.Resources[1] && item.Id) {
            this.props.fetchAdById({adId: item.Id, adType: 0}).then(msg => {
                let resources = this.adTemplateData.Resources
                resources[1] = []
                resources[2] = []
                resources[3] = []
                msg.map((item, index) => {
                    resources[item.AdType].push(item)
                })
                this.setState({loading: false})
            })
        }
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
            this.adTemplateData.Id = item.Id
            this.adTemplateData.Name = item.Name
            this.props.fetchAdById({adId: item.Id, adType: 0}).then(msg => {
                let resources = this.adTemplateData.Resources
                resources[1] = []
                resources[2] = []
                resources[3] = []
                msg.map((item, index) => {
                    resources[item.AdType].push(item)
                })
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

    
    handleOk = () => {
        
    }
    
    handleCancel = () => {
        this.setState({visible: false})
    }


    render() {
       return (
           <div className="threeContainer">
                <div className="threeScreenContainer">
       <div><Row type="flex" justify="space-around" align="middle">
                   <Col span={16}> <Input onChange={this.templateNameChange.bind(this, this.props.data)} addonBefore="模板名称" defaultValue={this.props.data.Name}/></Col>
                   <Col span={8}><Button.Group> <Button type='primary' onClick={this.saveAdTemplate.bind(this, this.props.data)}>保存</Button><Popconfirm title="确认删除吗?" onConfirm={this.deleteTemplate.bind(this, this.props.data)} okText="确定" cancelText="取消"><Button type='ghost'>删除</Button></Popconfirm></Button.Group></Col>
                   </Row>
                   </div>
                    <div onClick={this.chooseModule.bind(this, '1', this.props.data)}>
                       <span>上部广告区</span>
                    </div>
                    <div onClick={this.chooseModule.bind(this, '2', this.props.data)}><span>出货中广告</span></div>
                    <div onClick={this.chooseModule.bind(this, '3', this.props.data)}><span>下部广告区</span></div>
                </div>
                <div className="settingPanel">
                    
                <Table dataSource={this.state.everyModuleData} pagination={false} showHeader={false}>
                   <Column
                        title="序号"
                        key="index"
                        render={(text, record, index) => (
                        <span>
                            <Avatar size="small" style={{ backgroundColor: '#ff5722' }}>{index + 1}</Avatar>
                        </span>
                        )}
                    />
                    <Column
                        title="图片"
                        key="picture"
                        render={(text, record, index) => (
                        
                            <img className="chooseResource" src={record.PicUrl} />
                        
                        )}
                    />
                    <Column
                        title="名称"
                        dataIndex="PicName"
                        key="PicName"
                    />
                    <Column
                        title="移动"
                        key="move"
                        render={(text, record, index) => (
                        <span>
                            <Button type="primary" style={{marginRight: '3px'}} size="snall" onClick={this.arrUp.bind(this, index)}>上移</Button>
                            <Button type="primary" style={{marginRight: '3px'}} size="snall" onClick={this.arrDown.bind(this, index)}>下移</Button>
                            <Button type="primary" size="snall" onClick={this.arrDelete.bind(this, index)}>删除</Button>
                        </span>
                        )}
                    />
                    </Table>
                <Button type="dashed" onClick={this.showResource} style={{ width: '60%' }}>
                            <Icon type="plus" /> 选择资源
                        </Button>
                </div>
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

export default ThreeScreen
