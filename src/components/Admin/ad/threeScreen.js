import React, { Component } from 'react'
import {Button, Icon, Table, Avatar, Input, Row, Col, Popconfirm, message} from 'antd'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'

const { Column } = Table

class ThreeScreen extends Component {
    constructor(props) {
        super(props)
        this.state = {
            settingPanel: [],
            data: {},
            visible: false
        }
    }

    componentWillMount() {
        this.nowPosition = 1
    }

    componentDidMount() {
    }

    chooseModule = (txt, item, ev) => {
        this.nowPosition = txt
        if (item.Id) {

        } else {
            
        }
        // txt: 1(上)，2(中)，3(下)
        if (ev) {
            $(ev.currentTarget).siblings().css('background-color', '#fff')
            $(ev.currentTarget).css('background-color', '#ccc')
        }
        
        if (item.Resources && item.Resources[this.nowPosition]) {
            this.setState({data: item})
        } else if (item.Id) {
            this.props.fetchAdById({adId: item.Id, adType: 0}).then(msg => {
                let resources = {}
                resources[1] = []
                resources[2] = []
                resources[3] = []
                msg.map((item, index) => {
                    resources[item.AdType].push(item)
                })
                item.Resources = resources
                this.setState({data: item})
            })
        } else {
            item.Resources[this.nowPosition] = []
            this.setState({data: item})
        }
     }

     templateNameChange = (item, ev) =>{
        item.Name = ev.target.value
        this.setState({loading: true})
        if (item.Resources && !item.Resources[1] && item.Id) {
            this.props.fetchAdById({adId: item.Id, adType: 0}).then(msg => {
                let resources = item.Resources
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

    resourceClick = (resourceItem, ev) => {
        if (this.state.data.Resources[this.nowPosition].length >= 5) {
            message.warning('资源不能大于五个！')
            return
        }
        let canPush = true
        for (var i = 0; i < this.state.data.Resources[this.nowPosition].length; i++) {
            if (this.state.data.Resources[this.nowPosition][i].PicId == resourceItem.PicId) {
                canPush = false
            }
        }

        if (canPush) {
            this.state.data.Resources[this.nowPosition].push(resourceItem)
            this.setState({data: this.state.data})
        }
    }

    chooseResource = () => {
        this.setState({visible: true})
    }

    /* *****************数组上下移动及删除操作**************** */
    arrDelete = (index) => {
        let tmpArr = this.state.data.Resources[this.nowPosition]
        tmpArr.splice(index, 1)
        this.setState({data: this.state.data})
        // this.generateAdData(tmpArr)
    }

    handleOk = () => {
        
    }
    
    handleCancel = () => {
        this.setState({visible: false})
    }
            

    arrUp = (index) => {
       if (index == 0) {
           return
       }
      
       let tmpArr = this.state.data.Resources[this.nowPosition]
       tmpArr[index] = tmpArr.splice(index - 1, 1, tmpArr[index])[0]
       this.setState({data: this.state.data})
    }

    arrDown = (index) => {
       if (index == this.state.data.Resources[this.nowPosition].length - 1) {
           return
       }
       let tmpArr = this.state.data.Resources[this.nowPosition]
       tmpArr[index] = tmpArr.splice(index + 1, 1, tmpArr[index])[0]
       this.setState({data: this.state.data})
    }


    render() {
        let {data} = this.props
        this.state.data = data
        let tableResource = []
        if (this.state.data.Resources) {
            tableResource = this.state.data.Resources[this.nowPosition]
        }
       return (
           <div className="threeContainer">
                <div className="threeScreenContainer">
       <div><Row type="flex" justify="space-around" align="middle">
                   <Col span={16}> <Input onChange={this.templateNameChange.bind(this, this.state.data)} addonBefore="模板名称" value={this.state.data.Name}/></Col>
                   <Col span={8}><Button.Group> <Button type='primary' onClick={this.props.saveAdTemplate.bind(this, this.state.data)}>保存</Button><Popconfirm title="确认删除吗?" onConfirm={this.props.deleteTemplate.bind(this, this.state.data)} okText="确定" cancelText="取消"><Button type='ghost'>删除</Button></Popconfirm></Button.Group></Col>
                   </Row>
                   </div>
                    <div onClick={this.chooseModule.bind(this, '1', this.state.data)}>
                       <span>上部广告区</span>
                    </div>
                    <div onClick={this.chooseModule.bind(this, '2', this.state.data)}><span>出货中广告</span></div>
                    <div onClick={this.chooseModule.bind(this, '3', this.state.data)}><span>下部广告区</span></div>
                </div>
                <div className="settingPanel">
                    
                <Table dataSource={tableResource} pagination={false} showHeader={false}>
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
                        render={(text, record, index) => {
                                 return <img className="chooseResource" src={record.PicUrl} />
                        }
                            
                        }
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
                <Button type="dashed" onClick={this.chooseResource} style={{ width: '60%' }}>
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
