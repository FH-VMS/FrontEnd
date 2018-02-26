import React, {Component} from 'react'
import {Spin} from 'antd'

class Ad extends Component {
    constructor(props) {
		super(props)
        this.state = {
            loading: false
        }

    }

    componentWillMount() {
     
    }
    
    

    render() {
       

        return (
            <div>
              <Spin size="large" spinning={this.state.loading}>
                广告设置
               </Spin>
           </div>
        )
    }
}

export default Ad
