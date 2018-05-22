import React, {Component} from 'react'
import { Spin, Tabs} from 'antd'
const TabPane = Tabs.TabPane

class Carousel extends Component {
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

    tabCallback = (key) => {

    }

    
    // 取数据方法
    getData = () => {
    }
    

    render() {
        
       
        
        return (
            <div>
               <Spin size="large" spinning={this.state.loading}>
               <Tabs defaultActiveKey="1" onChange={this.tabCallback}>
               <TabPane tab="首页滚动图" key="1">Content of Tab Pane 1</TabPane>
               <TabPane tab="客服设置" key="2">Content of Tab Pane 2</TabPane>
             </Tabs>
               </Spin>
           </div>
        )
    }
}

export default Carousel
