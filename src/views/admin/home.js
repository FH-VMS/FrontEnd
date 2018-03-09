import React, {Component} from 'react'


// var echarts = require('echarts')

class Home extends Component {
    constructor(props) {
		super(props)
        this.state = {
            homeComponent: ''
        }
	}
    

    componentWillMount() {
        if (navigator.appName == 'Microsoft Internet Explorer' && parseInt(navigator.appVersion.split(';')[1].replace(/[ ]/g, '').replace('MSIE', ''), 0) <= 9) {
            let HomeIe = require('COMPONENT/Admin/home/homeIe').default
            this.setState({homeComponent: <HomeIe {...this.props} />})
        } else {
            let HomeOther = require('COMPONENT/Admin/home/homeOther').default
            this.setState({homeComponent: <HomeOther {...this.props} />})
        }

    }

    componentDidMount() {
       
    }

    render() {
        return (
            <div>
               {this.state.homeComponent}
           </div>
        )
    }
}

export default Home
