import React, { Component } from 'react'
import { List, Stepper, Button, Toast } from 'antd-mobile'
import model from 'STORE/model'

const Item = List.Item

class StockManage extends Component {
    constructor(props) {
        super(props)
        
        this.state = {
            isLoading: true,
            data: [],
            cabinets: []
        }

        this.saveStocks = []

        
    }

   componentWillMount() {
      
      this.queryData()
   }

   queryData = () => {
     
      let {fetchCabinetByMachine, params, fetchTunnelInfo} = this.props
     
      
      fetchCabinetByMachine({machineId: params.deviceid}).then(msg => {
          if (this.props.stockManage.cabinetInfo.length > 0) {
              fetchTunnelInfo({machineId: params.deviceid, cabinetId: this.props.stockManage.cabinetInfo[0].Id, pageIndex: 1, pageSize: model.BaseSetting.NoPage}).then(msg => {
                   console.log('ddddddd', this.props.stockManage.data)
                   this.setState({
                        isLoading: false,
                        data: this.props.stockManage.data,
                        cabinets: this.props.stockManage.cabinetInfo
                    })
              })
          }
              
      })
      /* 
      this.setState({
            dataSource: this.state.ds.cloneWithRows([...this.state.data, ...this.props.stockManage.cabinetInfo]),
            isLoading: false,
            data: [...this.state.data, ...this.props.stockManage.cabinetInfo]
        })
        */
     
   }

   stepChange = (item, val, ev) => {
      item.CurrStock = val
     if (this.saveStocks.length == 0) {
         this.saveStocks.push(item)
     } else {
          let canPush = true
          for (var i = 0; i < this.saveStocks.length; i++) {
             if (this.saveStocks[i].GoodsStuId == item.GoodsStuId) {
                 this.saveStocks[i].CurrStock = item.CurrStock
                 canPush = false
                 break
             } 
          }
         
          if (canPush) {
               this.saveStocks.push(item)
          }
     }
     
   }

   saveStock = (e) => {
    
     if (this.saveStocks.length == 0) {
          Toast.fail('库存无修改', 1)
          return
     }
      Toast.loading('保存中...', 0)
      try {
        this.props.batchUpdateTunnelInfo({lstTunnelInfo: this.saveStocks}).then(msg => {
            Toast.hide()
         if (msg) {
              Toast.success('保存成功', 1)
              this.saveStocks = []
         }
         
        })
      } catch (e) {
           Toast.hide()
      }
     
   }


    /* **************************Tab Bar*************************/
 

    render() {
      return (
          <div>
            <List
            style={{
                  height: document.documentElement.clientHeight * 3.6 / 4,
                  width: '100%',
                  overflow: 'auto'
                }}
            >
                {
                    this.state.data.map((item, index) => {
                        return (<Item extra={<Stepper
                            style={{ width: '100%', minWidth: '2rem' }}
                            showNumber min={0} max={item.MaxPuts} defaultValue={item.CurrStock} onChange={this.stepChange.bind(this, item)}
                            readonly
                        />}>{item.TunnelId}</Item>)
                    })
                }
            </List>
             <div className="sumContainer">
                 <Button className="btn" type="primary" onClick={this.saveStock.bind(this)}>保存</Button>
            </div>
        </div>
      )
    }
}

export default StockManage
