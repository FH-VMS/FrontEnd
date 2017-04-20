import React, {Component} from 'react'
import {Select, InputNumber, Tooltip} from 'antd'

class EveryTunnel extends Component {
    constructor(props) {
		super(props)
        this.state = {
        }
    }

    componentWillMount() {
        this.productDicSelect = []
    }

   
    zPayChange = (value) => {
        this.props.datasource.AlipayPrices = value
        this.setState({AlipayPrices: value})
    }
    wPayChange = (value) => {
        this.props.datasource.WapyPrices = value
         this.setState({WapyPrices: value})
    }

    productSelect = (value) => {
        this.props.datasource.WaresId = value
        this.setState({WaresId: value})
    }

    xPayChange = (value) => {
        this.props.datasource.CashPrices = value
        this.setState({CashPrices: value})
    }

     icPayChange = (value) => {
        this.props.datasource.IcPrices = value
        this.setState({IcPrices: value})
    }

     inputChange = (value) => {
        this.props.datasource.MaxPuts = value
        this.setState({MaxPuts: value})
    }
 
    getProductSelect = (data) => {
        let productSelectLet = data.map((item, index) => {
            return <Option value={item.Id}>{item.Name}</Option>
        })

        this.productDicSelect = productSelectLet
    }

    render() {
        this.getProductSelect(this.props.productDic)
        let {datasource} = this.props
        this.state = datasource
        return (
            <div className="everyTunnel">
               <div className="tunnelTitle">{this.state.TunnelId}</div>
               <div> <Select className="textRequired"
                        onChange={this.productSelect}
                        value={this.state.WaresId}
                        showSearch
                        style={{ width: '100%' }}
                        placeholder="选择商品"
                        optionFilterProp="children"
                        filterOption={(input, option) => option.props.value.toLowerCase().indexOf(input.toLowerCase()) >= 0}
                    >{this.productDicSelect}</Select></div>
               <div>
                  <Tooltip title="支付宝" trigger="focus">
                     <InputNumber value={this.state.AlipayPrices} placeholder="支付宝" min={0} onChange={this.zPayChange} style={{ width: '48%', marginRight: '1%' }} />
                  </Tooltip>
                  <Tooltip title="微信" trigger="focus">
                     <InputNumber title="微信价格" value={this.state.WapyPrices} placeholder="微信" min={0} onChange={this.wPayChange} style={{ width: '48%' }} />
                  </Tooltip>
               </div>
               <div>
                  <Tooltip title="微信" trigger="focus">
                     <InputNumber value={this.state.CashPrices} placeholder="现金" onChange={this.xPayChange} className="textRequired" min={0} style={{ width: '48%', marginRight: '1%' }} />
                  </Tooltip>
                  <Tooltip title="IC卡" trigger="focus">
                     <InputNumber value={this.state.IcPrices} placeholder="刷卡" onChange={this.icPayChange} min={0} style={{ width: '48%' }} />
                  </Tooltip>
               </div>
                <div>
                  <Tooltip title="货道最大放量" trigger="focus">
                     <InputNumber title="货道最大放量" value={this.state.MaxPuts} className="textRequired" placeholder="最大排放" onChange={this.inputChange} min={0} style={{ width: '100%' }} />
                  </Tooltip>
               </div>
           </div>
        )
    }
}

export default EveryTunnel
