import React, {Component} from 'react'

class Ad extends Component {
    constructor(props) {
		super(props)
        this.state = {
            loading: false
        }

    }

    componentWillMount() {
     
    }
    
    

    render() {
       

        return (
            <div>
              <Spin size="large" spinning={this.state.loading}> </Spin>
           </div>
        )
    }
}

export default Ad
