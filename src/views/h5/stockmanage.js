import React, { Component } from 'react'
import { List, Stepper, Button, Toast, Picker } from 'antd-mobile'
import model from 'STORE/model'
import { district } from 'antd-mobile-demo-data'
import 'ASSET/less/adult-machine.less'
const Item = List.Item

class StockManage extends Component {
    constructor(props) {
        super(props)
        
        this.state = {
            isLoading: true,
            data: [],
            cabinets: [],
            cols: 1,
            pickerValue: [],
            asyncValue: [],
            sValue: ['2013', '春'],
            visible: false
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


   chooseProduct = (item, v) => {
       
       console.log('oooooo', v)
   }


    /* **************************Tab Bar*************************/
 

    render() {
       console.log('kkkk', district)
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
                        return (<div><Item extra={
                            <div>
                           <Stepper
                            style={{ width: '100%', minWidth: '2rem' }}
                            showNumber min={0} max={item.MaxPuts} defaultValue={item.CurrStock} onChange={this.stepChange.bind(this, item)}
                            readonly
                        /></div>}>
                        {item.TunnelId}
                      <Item.Brief style={{width: '80%'}}>
                         <Picker data={district} cols={1} extra="选商品" onChange={this.chooseProduct.bind(this, item)} className="forss">
                          <List.Item arrow="horizontal"></List.Item>
                         </Picker>
                        </Item.Brief>
                        </Item>
                        
                        </div>)
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
