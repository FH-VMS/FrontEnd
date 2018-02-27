import React, { Component } from 'react'
import {Button, Icon} from 'antd'

class ThreeScreen extends Component {
    constructor(props) {
        super(props)
    }

    componentWillMount() {
        
    }

    render() {
       return (
           <div className="threeScreenContainer">
               <div><h4>三分屏</h4></div>
               <div>
                    <Button type="dashed" onClick={this.props.chooseResource} style={{ width: '60%' }}>
                        <Icon type="plus" /> 选择资源
                    </Button>
               </div>
               <div></div>
               <div></div>
           </div>
       )
    }
}

export default ThreeScreen
