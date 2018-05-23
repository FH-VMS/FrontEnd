import React, {Component} from 'react'
class CommonImage extends Component {
    constructor(props) {
        super(props)
        this.state = {
        }
    }



    render() {
        return (
               <div className="commonImage" style={{backgroundImage: `url(${require('ASSET/img/wechat/service-banner.png')})`}}></div>
        )
    }
}

export default CommonImage
