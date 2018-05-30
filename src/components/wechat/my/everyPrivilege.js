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
      let {ExpireTime, PrivilegeInstru, PrivilegeStatus, Money} = this.props.data
      var ex = new Date(ExpireTime)
      var now = new Date()
      let isExipire = false
      if (now.getTime() > ex.getTime()) {
        isExipire = true
      }
      let tmpHtml = []
      if (PrivilegeStatus == 2) {
        tmpHtml.push(<div>已使用</div>)
      } else {
          if (PrivilegeStatus == 1 && !isExipire) {
            tmpHtml.push(<div>已领取</div>)
            tmpHtml.push(<div className="gotoUse">去使用</div>)
          } else {
            tmpHtml.push(<div>已失效</div>)
          }
      }
      
      return (
        <div>
            <div className="everyTicket">
                <div>¥{Money}</div>
                <div>
                    <div>
                        <div>失效时间: {ExpireTime.replace('T', ' ')} </div>
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

