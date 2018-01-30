import React, { Component } from 'react'
import { List, Stepper, Button, Toast, Drawer, NavBar, Popover, Modal } from 'antd-mobile'
import {hashHistory} from 'react-router'
import model from 'STORE/model'
import 'ASSET/less/adult-machine.less'
const Item = List.Item

class PriceSet extends Component {
    constructor(props) {
        super(props)
        
        this.state = {
            isLoading: true,
            data: [],
            cabinets: [],
            nowCabinet: {},
            visible: false,
            productDic: [],
            popVisible: false
        }

        this.saveStocks = []
        
    }


   componentWillMount() {
      this.stepperRepeat = 0
      this.nowChooseItem = {}
      this.queryData()
      this.queryProductData()
   }

   queryData = () => {
     
      let {fetchCabinetByMachine, params} = this.props
     
      
      fetchCabinetByMachine({machineId: params.deviceid}).then(msg => {
          if (this.props.priceSet.cabinetInfo.length > 0) {
              this.setState({cabinets: this.props.priceSet.cabinetInfo, nowCabinet: this.props.priceSet.cabinetInfo[0]})
              this.getTunnelInfo()
          }
              
      })
   }

   getTunnelInfo = () => {
        this.props.fetchTunnelInfo({machineId: this.props.params.deviceid, cabinetId: this.state.nowCabinet.Id, pageIndex: 1, pageSize: model.BaseSetting.NoPage}).then(msg => {
            this.setState({
                isLoading: false,
                data: this.props.priceSet.data
            })
    })
   }

   queryProductData = () => {
       this.props.fetchProductDic().then(msg => {
           if (this.props.priceSet && this.props.priceSet.productDic) {
               this.setState({productDic: this.props.priceSet.productDic})
           }
       })
   }

   stepChange = (item, val, ev) => {
       this.setState({val})
      item.Price = val
     if (this.saveStocks.length == 0) {
         this.saveStocks.push(item)
     } else {
          let canPush = true
          for (var i = 0; i < this.saveStocks.length; i++) {
             if (this.saveStocks[i].TunnelId == item.TunnelId) {
                 this.saveStocks[i].Price = item.Price
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
          Toast.fail('无修改', 1)
          return
     }
      Toast.loading('保存中...', 0)
      try {
        this.props.setPrice({lstTunnelInfo: this.saveStocks}).then(msg => {
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
    this.props.fetchPriceByWaresId({waresId: item.Id}).then(msg => {
        this.nowChooseItem.Price = msg
       
        this.setState({data: this.state.data, visible: false})
        if (this.saveStocks.length == 0) {
            this.saveStocks.push({...this.nowChooseItem})
        } else {
             let canPush = true
             for (var i = 0; i < this.saveStocks.length; i++) {
               if (this.saveStocks[i].TunnelId == this.nowChooseItem.TunnelId) {
                    this.saveStocks[i].WaresId = item.Id
                    this.saveStocks[i].ProductName = item.Name
                    this.saveStocks[i].Price = msg
                    canPush = false
                    break
                } 
             }
            
             if (canPush) {
                  this.saveStocks.push({...this.nowChooseItem})
             }
        }
    })
   
    

     
  }

  // 货道选择
  tunnelChoose = (item) => {
     
   if (item.id == this.state.nowCabinet.id) {
    this.setState({
        visible: false
      })
       return
   }
   if (this.saveStocks.length > 0) {
    Modal.alert('放弃保存', '确定放弃吗？', [
        { text: '取消', onPress: () => {} },
        {
          text: '确定',
          onPress: () => {
               this.saveStocks = []
                this.setState({
                    visible: false,
                    nowCabinet: item
                })
        
              this.getTunnelInfo()
          }
        }
      ])
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
                style={{ minHeight: document.documentElement.clientHeight * 4 / 4, paddingBottom: '127px' }}
                contentStyle={{ color: '#A6A6A6', textAlign: 'center' }}
                sidebar={sidebar}
                open={this.state.visible}
                onOpenChange={this.onOpenChange}
            >
            <NavBar
          mode="dark"
          onLeftClick={() => hashHistory.push('h5main')}
          leftContent="返回"
          rightContent={ <Popover mask
            overlayClassName="fortest"
            overlayStyle={{ color: 'currentColor' }}
            visible={this.state.popVisible}
            overlay={
                this.state.cabinets.map((item, index) => {
                    return <Item key={item.Id} value="scan" data-seed="logId" onClick={this.tunnelChoose.bind(this, item)}>{item.Name}</Item>
                })
                }
            align={{
              overflow: { adjustY: 0, adjustX: 0 },
              offset: [-10, 0]
            }}
          >
            <div style={{
              height: '100%',
              padding: '0 15px',
              marginRight: '-15px',
              display: 'flex',
              alignItems: 'center'
            }}
            >
              <span>{this.state.nowCabinet.Name}</span>
            </div>
          </Popover>}
          >价格设置</NavBar>
            <List
            style={{
                  height: document.documentElement.clientHeight * 3.3 / 4,
                  width: '100%',
                  overflow: 'auto'
                }}
            >
                {
                    this.state.data.map((item, index) => {
                        return (<Item extra={
                            <div>
                           <Stepper
                            style={{ width: '100%', minWidth: '2rem' }}
                            showNumber min={0.01} max={99.99} value={item.Price} step={0.01} onChange={this.stepChange.bind(this, item)}
                            readOnly={false}
                        /></div>}>
                        {item.TunnelId}
                      <Item.Brief style={{width: '80%'}}>
                         <input type="text" value={item.ProductName} placeholder="选择商品" onClick={this.chooseProduct.bind(this, item)} readOnly />
                        </Item.Brief>
                        </Item>)
                    })
                }
            </List>
            
             <div className="sumContainer" style={{display: this.state.visible ? 'none' : 'flex'}}>
                 <Button className="btn" type="primary" style={{width: '100%'}} inline onClick={this.saveStock.bind(this)}>保存</Button>
                 
            </div>
            </Drawer>
        </div>
      )
    }
}

export default PriceSet
