import React, { Component } from 'react'
import {Button, Icon, Table, Avatar, Input, Row, Col} from 'antd'

const { Column } = Table

class ThreeScreen extends Component {
    constructor(props) {
        super(props)
        this.state = {
            settingPanel: []
        }
    }

    componentWillMount() {
        
    }


    render() {
       return (
           <div className="threeContainer">
                <div className="threeScreenContainer">
       <div><Row type="flex" justify="space-around" align="middle">
                   <Col span={19}> <Input onChange={this.props.templateNameChange} addonBefore="模板名称"/></Col>
                   <Col span={5}> <Button type='primary' onClick={this.props.saveAdTemplate}>保存</Button></Col>
                   </Row>
                   </div>
                    <div onClick={this.props.chooseModule.bind(this, '1')}>
                       <span>上部广告区</span>
                    </div>
                    <div onClick={this.props.chooseModule.bind(this, '2')}><span>出货中广告</span></div>
                    <div onClick={this.props.chooseModule.bind(this, '3')}><span>下部广告区</span></div>
                </div>
                <div className="settingPanel">
                    
                <Table dataSource={this.props.everyModuleData} pagination={false} showHeader={false}>
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
                            <Button type="primary" style={{marginRight: '3px'}} size="snall" onClick={this.props.arrUp.bind(this, index)}>上移</Button>
                            <Button type="primary" style={{marginRight: '3px'}} size="snall" onClick={this.props.arrDown.bind(this, index)}>下移</Button>
                            <Button type="primary" size="snall" onClick={this.props.arrDelete.bind(this, index)}>删除</Button>
                        </span>
                        )}
                    />
                    </Table>
                <Button type="dashed" onClick={this.props.chooseResource} style={{ width: '60%' }}>
                            <Icon type="plus" /> 选择资源
                        </Button>
                </div>
           </div>
       )
    }
}

export default ThreeScreen
