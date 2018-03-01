import React, { Component } from 'react'
import {Button, Icon} from 'antd'

class ThreeScreen extends Component {
    constructor(props) {
        super(props)
    }

    componentWillMount() {
        
    }

    chooseModule = (txt, ev) => {
       // txt: 1(上)，2(中)，3(下)
    }

    render() {
       return (
           <div className="threeContainer">
                <div className="threeScreenContainer">
                    <div><h4>三分屏</h4></div>
                    <div onClick={this.chooseModule.bind(this, '1')}>
                            <Button type="dashed" onClick={this.props.chooseResource} style={{ width: '60%' }}>
                                <Icon type="plus" /> 选择资源
                            </Button>
                    </div>
                    <div></div>
                    <div onClick={this.chooseModule.bind(this, '3')}></div>
                </div>
                <div className="settingPanel"></div>
           </div>
       )
    }
}

export default ThreeScreen
