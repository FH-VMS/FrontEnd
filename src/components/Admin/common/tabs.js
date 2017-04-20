import React, {Component} from 'react'
import { Tabs } from 'antd'
const TabPane = Tabs.TabPane

class TabsControl extends Component {
    constructor(props) {
        super(props)
        this.dataSource = {
            defaultActiveKey: '1',
            tabPanes: []
        }

        
    }

    componentWillMount() {
        var {dataSources} = this.props
        this.dataSource.defaultActiveKey = dataSources.defaultActiveKey
        this.dataSource.tabPanes = dataSources.tabList.map((tab) => {
            return (
                <TabPane tab={tab.name} key={tab.key}>{tab.content}</TabPane>
            )
        })
        

    }

    render() {
        return (
            <div>
               <Tabs defaultActiveKey={this.dataSource.defaultActiveKey} >
                  {this.dataSource.tabPanes}
               </Tabs>
            </div>
        )
    }
}

export default TabsControl
