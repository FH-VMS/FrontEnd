import React, {Component} from 'react'
import { Spin} from 'antd'

class WechatSetting extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: [],
            loading: false
        }
    }

    componentWillMount() {
       this.getData()
    }

    
    // 取数据方法
    getData = () => {
    }
    

    render() {
        
       
        
        return (
            <div>
               <Spin size="large" spinning={this.state.loading}>
                  公众号设置
               </Spin>
           </div>
        )
    }
}

export default WechatSetting
