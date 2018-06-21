import React, {Component} from 'react'
import {Modal, List, Checkbox} from 'antd-mobile'
const CheckboxItem = Checkbox.CheckboxItem

class ChoosePrivilege extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
  }

  componentDidMount() {

  }

  onChange = (val) => {
    console.log(val);
  }


  render() {
      
      
      return (
        <Modal
            popup
            visible={this.props.visible}
            onClose={this.props.onClose}
            animationType="slide-up"
            maskClosable={false}
        >
            <List renderHeader={() => 'CheckboxItem demo'}>
            {this.props.canOverlay.map(i => (
            <CheckboxItem key={i.Id} onChange={() => this.onChange(i.value)} multipleLine>
               {i.DisplayText}<List.Item.Brief>{i.PrivilegeTypeText},满{i.UseMoneyLimit}可用</List.Item.Brief>
            </CheckboxItem>
            ))}
        </List>
        <List renderHeader={() => 'CheckboxItem demo'}>
        {this.props.cannotOverlay.map(i => (
            <CheckboxItem key={i.Id} onChange={() => this.onChange(i.value)} multipleLine>
            {i.DisplayText}<List.Item.Brief>{i.PrivilegeTypeText},满{i.UseMoneyLimit}可用</List.Item.Brief>
         </CheckboxItem>
         
        ))}
    </List>
        </Modal>
        )
  }
  
}

export default ChoosePrivilege

