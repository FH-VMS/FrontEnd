import React, {Component} from 'react'

class EveryPrivilege extends Component {
	constructor(props) {
        super(props)
	}

  componentWillMount() {
    
  }

  componentDidMount() {

  }

  render() {
      let {ExpireTime, PrivilegeInstru, PrivilegeStatus} = this.props.data
      let tmpHtml = []
      if (PrivilegeStatus == 1) {
        tmpHtml.push(<div>已领取</div>)
        tmpHtml.push(<div className="gotoUse">去使用</div>)
      }
      return (
        <div>
            <div className="everyTicket">
                <div>¥0.01</div>
                <div>
                    <div>
                        <div>失效时间: {ExpireTime} </div>
                        <div>使用规则：{PrivilegeInstru}</div>
                    </div>
                  </div>
                <div>
                    <div>
                        {tmpHtml}
                   </div>
                </div>
            </div>
        </div>
        )
  }
  
}

export default EveryPrivilege

