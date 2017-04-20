import React, {Component} from 'react'
import rootRouter from 'ROUTE/index'
 import {hashHistory} from 'react-router'
import {Menu} from 'antd'
import Utility from 'UTIL/utility'

const SubMenu = Menu.SubMenu
/*
const mapDispatchToProps = (dispatch) => ({
	frameInfo: bindActionCreators(frameInfo, dispatch) 
})

@connect(
	({ frames }) => ({ frames }),
	mapDispatchToProps
)
* */
class SlideNav extends Component {
    constructor(props) {
		super(props)
	}


 componentWillMount() {
 }

	componentDidMount() {
		// const {frameInfo} = this.props
		// frameInfo.fetchMenu()
	}

  chosenMenu = (cItem, e) => {
     let auth = {

     }
      auth.CanAdd = 'inline'
      auth.CanDelete = 'inline'
      auth.CanModify = 'inline'
      auth.CanSerach = 'inline'
     
     switch (cItem.Url.toLowerCase()) {
        case 'customerinfo':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
        break
        case 'userinfo':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
        break
        case 'machinelistinfo':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
        break
        case 'machineconfig':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
        break
        case 'machineconfiginfo':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
        break
          case 'tunnelinfo':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
        break
     }

     
     Utility.Cookie.setAuth(auth)
     hashHistory.push({ pathname: rootRouter.admin.path + cItem.Url})
  }

  getMenus = (datasource) => {
    const htmlMenu = datasource.map((item, index) => {
        return (
           <SubMenu key={'p' + item.MenuId} title={<span><i className="fa fa-circle-thin" aria-hidden="true"></i> &nbsp;<span>{item.MenuName}</span></span>}>
              {
                item.Menus.map((cItem, cIndex) => {
                  return (
                     <Menu.Item key={'c' + cItem.MenuId}><div onClick={this.chosenMenu.bind(this, cItem)}>{cItem.MenuName}</div></Menu.Item>
                  )
                })
              }
        </SubMenu>
        )
    })

    this.htmlMenu = htmlMenu
  }
  

  /**
   * 类似于 Vue 中的 route: { data: Function } 属性，监听路由变化加载数据
   * 【拓展阅读】无限循环坑 http://stackoverflow.com/questions/36189775
   */
  componentWillReceiveProps (nextProps) {
    // query string 变化
  }


    render() {
        this.getMenus(this.props.datasource)
        return (
            <Menu 
            theme='light'
            mode="inline"
            onClick={this.handleClick}
          >
        {this.htmlMenu}
      </Menu>
        ) 
    }

    
}

export default SlideNav



