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

  chosenMenu = (cItem, pItem, e) => {
     let auth = {

     }
      auth.CanExport = 'none'
      auth.CanAdd = (cItem.Add == 1 ? 'inline' : 'none')
      auth.CanDelete = (cItem.Del == 1 ? 'inline' : 'none')
      auth.CanModify = (cItem.Mod == 1 ? 'inline' : 'none')
      auth.CanSerach = (cItem.Sear == 1 ? 'inline' : 'none')
     
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
        case 'tunnelfullfil':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
          auth.CanExport = 'inline'
        break
        case 'salecashless':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
        break
        case 'machinemoney':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
          auth.CanModify = 'none'
        break
        case 'machinetrans':
          auth.CanAdd = 'none'
          auth.CanDelete = 'none'
        break
     }
     // 刷新时选中菜单缓存
     sessionStorage.setItem('chosenMenuVal', JSON.stringify({PId: 'p' + pItem.MenuId, CId: 'c' + cItem.MenuId}))
     Utility.Cookie.setAuth(auth)
     hashHistory.push({ pathname: rootRouter.admin.path + cItem.Url})
  }

  gotoMain = () => {
     sessionStorage.setItem('chosenMenuVal', JSON.stringify({CId: 'chome'}))
     hashHistory.push({ pathname: rootRouter.admin.path })
  }

  getMenus = (datasource) => {
    const htmlMenu = datasource.map((item, index) => {
        return (
           <SubMenu key={'p' + item.MenuId} title={<span><i className={item.Remark} aria-hidden="true"></i> &nbsp;<span>{item.MenuName}</span></span>}>
              {
                item.Menus.map((cItem, cIndex) => {
                  return (
                     <Menu.Item key={'c' + cItem.MenuId}><div onClick={this.chosenMenu.bind(this, cItem, item)}>{cItem.MenuName}</div></Menu.Item>
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
        let defaultOpenKey = ''
        let defaultSelectedKey = 'chome'
        let chosenMenuVal = sessionStorage.getItem('chosenMenuVal')
        if (chosenMenuVal) {
           let obj = JSON.parse(chosenMenuVal) 
           defaultOpenKey = obj.PId
           defaultSelectedKey = obj.CId
        }
        return (
            <Menu 
            theme='dark'
            mode="inline"
            defaultSelectedKeys={[defaultSelectedKey]}
            defaultOpenKeys={[defaultOpenKey]}
          >
          <Menu.Item key="chome"><div onClick={this.gotoMain} style={{paddingLeft: '25px'}}><i className="fa fa-home" aria-hidden="true"></i> &nbsp;主页</div></Menu.Item>
        {this.htmlMenu}
      </Menu>
        ) 
    }

    
}

export default SlideNav



