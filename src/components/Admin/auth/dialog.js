import { Modal, Form, Input, Select } from 'antd'
// import model from 'STORE/model'
import React, {Component} from 'react'
const FormItem = Form.Item

const Dialog = Form.create({
  mapPropsToFields(props) {
    return {
      rank: {
        ...props.RankName,
        value: props.RankName
      },
      name: {
        ...props.DmsName,
        value: props.DmsName
      }
    }
  }
})(class ClassDialog extends Component {
  constructor(props) {
    super(props)
    this.menusHtml = ''
    this.state = {
      menus: []
    }
  }

  componentWillMount() {
      
  }

  moduleCheck = (item, txt, e) => {
    if (txt == 'module') {
      item.Checked = (e.target.checked ? 1 : 0)
      
    }

    if (txt == 'add') {
      item.Add = (e.target.checked ? 1 : 0)
    }

    if (txt == 'del') {
      item.Del = (e.target.checked ? 1 : 0)
    }

     if (txt == 'mod') {
      item.Mod = (e.target.checked ? 1 : 0)
    }

    if (txt == 'sear') {
      item.Sear = (e.target.checked ? 1 : 0)
    }
    this.checkControl(item, txt)
    this.setState({menus: this.props.menus})
  }

  checkControl = (item, txt) => {
    if (txt == 'module') {
      if (!item.Checked) {
           item.Add = 0
           item.Del = 0
           item.Sear = 0
           item.Mod = 0
      }
    } else {
       if (item.Add || item.Del || item.Sear || item.Mod) {
         item.Checked = 1
        }
    }

  }

  getRankData = (data) => {
    this.rankSelect = data.map((item, index) => {
      return (
          <Option value={item.Value}>{item.BookChinese}</Option>
      )
    })
  }

  getTreeMenus = (menus) => {
     this.state.menus = menus
     if (menus && menus.length > 0) {
      const menusHtml = menus.map((item, index) => {
         return (
             <li>
               <div><span className="herizonLine"></span><label><i className="fa fa-plus-square-o"></i>{item.MenuName}</label></div>
               <div>
                  <ul className="treeNode">
                  {
                     item.Menus.map((cItem, cIndex) => {
                          return (
                                  <li>
                                    <span className="herizonLine"></span>
                                    <label><input checked={cItem.Checked} type="checkbox" onChange={this.moduleCheck.bind(this, cItem, 'module')} />{cItem.MenuName}</label>
                                    <span className="adddelmodsear">
                                    (<label className="add"><input checked={cItem.Add} type="checkbox" onChange={this.moduleCheck.bind(this, cItem, 'add')} />增</label>
                                    <label className="del"><input checked={cItem.Del} type="checkbox" onChange={this.moduleCheck.bind(this, cItem, 'del')} />删</label>
                                    <label className="mod"><input checked={cItem.Mod} type="checkbox" onChange={this.moduleCheck.bind(this, cItem, 'mod')} />改</label>
                                    <label className="sear"><input checked={cItem.Sear} type="checkbox" onChange={this.moduleCheck.bind(this, cItem, 'sear')} />查</label>)
                                    </span>
                                  </li>
                          )
                      })
                  }
                    
                  </ul>
               </div>
             </li>
         )
       })

       this.menusHtml = menusHtml
      
     }
  }

  render() {
    let { visible, onCancel, onCreate, title, okText, form, rankData } = this.props
    let { getFieldDecorator } = form
    this.state.menus = this.props.menus
    this.getTreeMenus(this.state.menus)
    // 权限等级字典
    this.getRankData(rankData)
    return (
       <Modal
        visible={visible}
        title={title}
        okText={okText}
        onCancel={onCancel}
        onOk={onCreate.bind(this, this.state.menus)}
      >
          <Form vertical>
         <FormItem
          hasFeedback
        >
          {getFieldDecorator('name', {
            rules: [{
              required: true, message: '模板名称不能为空'
            }]
          })(
            <Input placeholder="模板名称" />
          )}
        </FormItem>
         <FormItem
          hasFeedback
        >
          {getFieldDecorator('rank', {
            rules: [{
              required: true, message: '权限等级必选'
            }]
          })(
            <Select placeholder="权限等级">
              {this.rankSelect}
            </Select>
          )}
        </FormItem>
        </Form>
          <ul className="treeNode">
              {this.menusHtml}
            </ul>
      </Modal>
    )
  }
   
})

export default Dialog
