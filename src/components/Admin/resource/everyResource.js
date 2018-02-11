import React, {Component} from 'react'

class EveryResource extends Component {
    constructor(props) {
		super(props)
    }

    componentWillMount() {
    }

    render() {
        console.log('000000', this.props)
        let rHmtl = ''
        if (this.props.data && this.props.data.FileType == '1') {
            rHmtl = <img src={this.props.data.PicUrl} />
        } else if (this.props.data && this.props.data.FileType == '2') {

        }
        return (
            <div className="everyResource">
               <div>{rHmtl}</div>
               <div></div>
           </div>
        )
    }
}

export default EveryResource
