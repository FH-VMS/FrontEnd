import React, { Component } from 'react'
import { List, Stepper, Button, Toast, Drawer } from 'antd-mobile'
import model from 'STORE/model'
import 'ASSET/less/adult-machine.less'
const Item = List.Item

class StockManage extends Component {
    constructor(props) {
        super(props)
        
        this.state = {
            isLoading: true,
            data: [],
            cabinets: [],
            visible: false,
            productDic: []
        }

        this.saveStocks = []
        
    }

   componentWillMount() {
      this.nowChooseItem = {}
      this.queryData()
      this.queryProductData()
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

   queryProductData = () => {
       this.props.fetchProductDic().then(msg => {
           if (this.props.stockManage && this.props.stockManage.productDic) {
               this.setState({productDic: this.props.stockManage.productDic})
           }
       })
   }

   stepChange = (item, val, ev) => {
      item.CurrStock = val
     if (this.saveStocks.length == 0) {
         this.saveStocks.push(item)
     } else {
          let canPush = true
          for (var i = 0; i < this.saveStocks.length; i++) {
             if (this.saveStocks[i].TunnelId == item.TunnelId) {
                 this.saveStocks[i].CurrStock = item.CurrStock
                 canPush = false
                 break
             } 
          }
         
          if (canPush) {
               this.saveStocks.push(item)
          }
     }
     console.log('save stocks', item)
   }

   saveStock = (e) => {
    
     if (this.saveStocks.length == 0) {
          Toast.fail('无修改', 1)
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
       this.nowChooseItem = item
       this.setState({visible: true})
   }

   onOpenChange = (...args) => {
    this.setState({ visible: !this.state.visible })
  }

  clickDrawerProduct = (item) => {
     this.nowChooseItem.WaresId = item.Id
     this.nowChooseItem.ProductName = item.Name
     this.setState({data: this.state.data, visible: false})

     if (this.saveStocks.length == 0) {
         this.saveStocks.push({...this.nowChooseItem})
     } else {
          let canPush = true
          for (var i = 0; i < this.saveStocks.length; i++) {
            if (this.saveStocks[i].TunnelId == this.nowChooseItem.TunnelId) {
                 this.saveStocks[i].WaresId = item.Id
                 this.saveStocks[i].ProductName = item.Name
                 canPush = false
                 break
             } 
          }
         
          if (canPush) {
               this.saveStocks.push({...this.nowChooseItem})
          }
     }
  }


    /* **************************Tab Bar*************************/
 

    render() {
        const sidebar = (<List>
            {this.state.productDic.map((item, index) => {
              if (index === 0) {
                return (<List.Item key={index}
                  multipleLine
                 onClick={this.clickDrawerProduct.bind(this, item)}>{item.Name}</List.Item>)
              }
              return (<List.Item key={index} onClick={this.clickDrawerProduct.bind(this, item)}
              >{item.Name}</List.Item>)
            })}
          </List>)

      return (
          <div>
              
            
            <Drawer
                style={{ minHeight: document.documentElement.clientHeight, paddingBottom: '127px' }}
                contentStyle={{ color: '#A6A6A6', textAlign: 'center' }}
                sidebar={sidebar}
                open={this.state.visible}
                onOpenChange={this.onOpenChange}
            >
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
                         <input type="text" value={item.ProductName} placeholder="选择商品" onClick={this.chooseProduct.bind(this, item)} readOnly />
                        </Item.Brief>
                        </Item>
                        
                        </div>)
                    })
                }
            </List>
            
             <div className="sumContainer">
                 <Button className="btn" type="primary" onClick={this.saveStock.bind(this)}>保存</Button>
                 
            </div>
            </Drawer>
        </div>
      )
    }
}

export default StockManage
