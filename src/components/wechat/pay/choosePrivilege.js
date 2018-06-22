import React, {Component} from 'react'
import {Modal, Checkbox, NavBar, Toast} from 'antd-mobile'

class ChoosePrivilege extends Component {
	constructor(props) {
        super(props)
        this.state = {
            data: [],
            canLoad: true
        }
        this.privileges = []
        this.nowChosen = []
	}

  componentWillMount() {
    
  }

  componentDidMount() {
   
  }

  reconstructePrivilege = () => {
      
    this.privileges = []
    this.nowChosen = []
    let ids = this.props.privilegeData.map((item, index) => {
        return item.Id
    })
    let totalFee = 0
    let waresIds = this.props.products.map((item, index) => {
        totalFee = totalFee + item.Number * item.TradeAmount
        return item.WaresId

    })
    this.props.chosenPrivilege.map((item, index) => {
       if (ids.indexOf(item.Id) > -1) {
           item.Chosen = true
           this.nowChosen.push(item)
       }
      
       switch (item.PrincipleType) {
         case '1': // 满减券
         if (item.UseMoneyLimit <= totalFee) {
            item.Disable = false
            this.privileges.push(item)
         } else {
            item.Disable = true
            item.CannotUseReason = '商品总额不满足要求'
         }
         break
         case '2': // 折扣券
         if (item.UseMoneyLimit <= totalFee) {
            this.privileges.push(item)
            item.Disable = false
         } else {
            item.Disable = true
            item.CannotUseReason = '商品总额不满足要求'
         }
         break
         case '3': // 赠品券
         if (waresIds.indexOf(item.BindProductIds) > -1) {
            this.privileges.push(item)
            item.Disable = false
         } else {
            item.Disable = true
            item.CannotUseReason = '未有可使用商品'
         }
         break
       }
    })

    this.setState({data: this.props.chosenPrivilege, canLoad: false})
    // return 
    
  }

  privilegeChange = (item, e) => {
    if (!e.target.checked) {
       item.Chosen = e.target.checked
    } else {
        if (this.nowChosen.length == 0) {
           
            this.nowChosen.push(item)
            item.Chosen = e.target.checked
        } else {
            let canPush = true
            for (let i = 0; i < this.nowChosen.length; i++) {
               if (this.nowChosen[i].IsOverlay != 1 || item.IsOverlay != 1) {
                   canPush = false
                   Toast.info('先取消其它选中的券')
                   break
               }
            }
            if (canPush) {
                
                this.nowChosen.push(item)
                item.Chosen = e.target.checked
            }
        }
    }
    let chosen = []
    this.nowChosen.map((eItem, index) => {
        if (eItem.Chosen) {
            chosen.push(eItem)
        }
    })

    this.nowChosen = chosen
    
    this.setState({data: this.state.data})
  }

  onOk = () => {
      this.state.canLoad = true
      this.props.onOk(this.nowChosen)
  }

  onClose = () => {
      this.state.canLoad = true
    this.props.onClose()
  }

  render() {
      let {visible} = this.props
      if (visible && this.state.canLoad) {
          this.reconstructePrivilege()
      }
      return (
        <Modal
            popup
            visible={visible}
            onClose={this.onClose}
            animationType="slide-up"
            maskClosable={false}
        >
        <NavBar
            mode="light"
            leftContent={[<span style={{color: '#888888'}}>取消</span>]}
            onLeftClick={this.onClose}
            rightContent={[
                <span onClick={this.onOk}>确定</span>
            ]}
        ></NavBar>
            {this.state.data.map((item, index) => {
                let limit = ''
                if (item.UseMoneyLimit) {
                    limit = '满' + item.UseMoneyLimit + '元可用'
                } else {
                    limit = '不限金额'
                }
                let overlay = '可叠加'
                if (item.IsOverlay != 1) {
                    overlay = '不可叠加'
                }
                return (<div className="everyModalPrivilege">
                     <Checkbox checked={item.Chosen} disabled={item.Disable} onChange={this.privilegeChange.bind(this, item)} key={item.Id}>{item.DisplayText}({overlay},{item.PrivilegeTypeText},{limit})</Checkbox>
                </div>)
            })}
        </Modal>
        )
  }
  
}

export default ChoosePrivilege

