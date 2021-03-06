import React, { Component } from 'react'
import { List, Stepper, Button, Toast, NavBar, Popover, Modal } from 'antd-mobile'
import {hashHistory} from 'react-router'
import model from 'STORE/model'
import 'ASSET/less/adult-machine.less'
const Item = List.Item

class MaxStock extends Component {
    constructor(props) {
        super(props)
        
        this.state = {
            isLoading: true,
            data: [],
            cabinets: [],
            nowCabinet: {},
            visible: false,
            popVisible: false
        }

        this.saveStocks = []
        
    }


   componentWillMount() {
      this.stepperRepeat = 0
      this.nowChooseItem = {}
      this.queryData()
   }

   queryData = () => {
     
      let {fetchCabinetByMachine, params} = this.props
     
      
      fetchCabinetByMachine({machineId: params.deviceid}).then(msg => {
          if (this.props.stockManage.cabinetInfo.length > 0) {
              this.setState({cabinets: this.props.stockManage.cabinetInfo, nowCabinet: this.props.stockManage.cabinetInfo[0]})
              this.getTunnelInfo()
          }
              
      })
   }

   getTunnelInfo = () => {
        this.props.fetchTunnelInfo({machineId: this.props.params.deviceid, cabinetId: this.state.nowCabinet.Id, pageIndex: 1, pageSize: model.BaseSetting.NoPage}).then(msg => {
            this.setState({
                isLoading: false,
                data: this.props.stockManage.data
            })
    })
   }
   
   stepChange = (item, val, ev) => {
       
     if (this.saveStocks.length == 0) {
         let saveItem = {}
         saveItem.tid = item.TunnelId
         saveItem.ms = val
         this.saveStocks.push(saveItem)
     } else {
          let canPush = true
          for (var i = 0; i < this.saveStocks.length; i++) {
             if (this.saveStocks[i].tid == item.TunnelId) {
                 this.saveStocks[i].ms = val
                 canPush = false
                 break
             } 
          }
         
          if (canPush) {
              let saveItem = {}
              saveItem.tid = item.TunnelId
              saveItem.ms = val
              this.saveStocks.push(saveItem)
          }
     }
   }

   saveStock = (e) => {
    if (this.saveStocks.length == 0) {
        Toast.fail('无修改', 1)
        return
   }
    Modal.alert('最大库存', '确定吗?', [
        { text: '取消', onPress: () => {
          
        } 
      },
        { text: '确认', onPress: () => {
            
            Toast.loading('保存中...', 0)
            try {
              this.props.setMaxStock({lstPriceAndStock: this.saveStocks, machineId: this.props.params.deviceid}).then(msg => {
                  Toast.hide()
               if (msg) {
                    Toast.success('保存成功', 1)
                    this.saveStocks = []
               } else {
                Toast.fail('机器不在线', 1)
               }
               
              })
            } catch (e) {
                 Toast.hide()
            }
        } 
      }
      ])
    
     
   }



   onOpenChange = (...args) => {
    this.setState({ visible: !this.state.visible })
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

      return (
          <div>
              
            
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
          >最大库存</NavBar>
            <List
            style={{
                  height: document.documentElement.clientHeight * 3.3 / 4,
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
                            showNumber min={0} max={10000} defaultValue={item.MaxPuts} step={1} onChange={this.stepChange.bind(this, item)}
                            readOnly={false}
                        /></div>}>
                        {item.TunnelId}
                        </Item>
                        
                        </div>)
                    })
                }
            </List>
            
             <div className="sumContainer" style={{display: this.state.visible ? 'none' : 'flex'}}>
                 <Button className="btn" type="primary" style={{width: '100%'}} inline onClick={this.saveStock.bind(this)}>保存</Button>
                 
            </div>
        </div>
      )
    }
}

export default MaxStock
