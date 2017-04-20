import React, {Component} from 'react'
import { Table } from 'antd'

class TableControl extends Component {
    constructor(props) {
       super(props)
       this.dataSource = {
           columns: [],
           data: []
       }
    }

    componentWillMount() {
       let {columns, data} = this.props
       this.dataSource.columns = columns
       this.dataSource.data = data
    }

    render() {
        return (
            <Table rowSelection={this.props.rowSelection} columns={this.dataSource.columns} dataSource={this.dataSource.data} />
        )
    }
}

export default TableControl
