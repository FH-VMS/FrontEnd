import { Modal } from 'antd'
import React, {Component} from 'react'

class PrivilegeDetailDialog extends Component {
    constructor(props) {
      super(props)
    }

    componentWillMount() {
        // console.log('iiii', this.props)
    }


 

  componentDidMount() {
  }

    render() {
    const { visible, onCancel, onCreate, title} = this.props
   
    return (
      
      <Modal
        visible={visible}
        title={title}
        onCancel={onCancel}
        onOk={onCreate}
      >
        
        
     
      </Modal>
     
    )
    }
  }


export default PrivilegeDetailDialog
