import React, {Component} from 'react'
import {Modal} from 'antd-mobile'

class ChoosePrivilege extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
  }

  componentDidMount() {

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
            12321
        </Modal>
        )
  }
  
}

export default ChoosePrivilege

