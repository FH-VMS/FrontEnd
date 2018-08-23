import React, {Component} from 'react'
import {Icon, Table, Button, message, Avatar, Input, Select} from 'antd'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'

const { Column } = Table
const InputGroup = Input.Group;
const Option = Select.Option;

class Carousel extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: this.props.data,
            loading: false
        }
    }

    componentWillMount() {
        this.productSelect = []
      this.getProductSelect()
    }

    componentDidUpdate() {
        this.getProductSelect()
    }

    getProductSelect = () => {
        if (this.props.productDic) {
           this.productSelect = this.props.productDic.map((item, index) => {
                return (
                  <Option value={item.Id}>{item.Name}</Option>
                )
              })
        }
    }

    resourceClick = (resourceItem, ev) => {
        if (this.state.dataSource.length >= 5) {
            message.warning('资源不能大于五个！')
            return
        }
        let canPush = true
        for (var i = 0; i < this.state.dataSource.length; i++) {
            if (this.state.dataSource[i].PicId == resourceItem.PicId) {
                canPush = false
            }
        }

        if (canPush) {
            this.state.dataSource.push(resourceItem)
            this.setState({dataSource: this.state.dataSource})
            this.generateCarouselJson(this.state.dataSource)
        }

    }

    generateCarouselJson = (data) => {
         this.props.webInfo.CarouselJson = JSON.stringify(data)
    }

    chooseResource = () => {
        this.setState({visible: true})
    }

    /* *****************数组上下移动及删除操作**************** */
    arrDelete = (index) => {
        let tmpArr = this.state.dataSource
        tmpArr.splice(index, 1)
        this.setState({dataSource: this.state.dataSource})
        this.generateCarouselJson(this.state.dataSource)
        // this.generateAdData(tmpArr)
    }

    handleOk = () => {
        
    }
    
    handleCancel = () => {
        this.setState({visible: false})
    }
            

    arrUp = (index) => {
       if (index == 0) {
           return
       }
      
       let tmpArr = this.state.dataSource
       tmpArr[index] = tmpArr.splice(index - 1, 1, tmpArr[index])[0]
       this.setState({dataSource: this.state.dataSource})
       this.generateCarouselJson(this.state.dataSource)
    }

    arrDown = (index) => {
       if (index == this.state.dataSource.length - 1) {
           return
       }
       let tmpArr = this.state.dataSource
       tmpArr[index] = tmpArr.splice(index + 1, 1, tmpArr[index])[0]
       this.setState({dataSource: this.state.dataSource})
       this.generateCarouselJson(this.state.dataSource)
    }

    saveCarousel = () => {
        this.generateCarouselJson(this.state.dataSource)
        this.props.saveWebSetting()
    }

    urlChange = (record, e) => {
        record.Url = e.target.value
        this.setState({dataSource: this.state.dataSource})
    }

    productSelectChange = (record, txt, e) => {
        
        record.Url = `${location.origin}/p/wechat.html#/pay/${txt}?clientId=${this.props.clientId}`
        this.setState({dataSource: this.state.dataSource})
    }
    
  
    render() {
        if (this.props.data) {
            this.state.dataSource = this.props.data
        } else {
            this.state.dataSource = []
        }
        return (
            <div>
              <div className="uploadCarouselWarning"><Icon type="info-circle-o" /> <span>图片大小不能大于10kb,建议尺寸宽*高=350px*150px</span></div>
              <div className="uploadArea">
              <Table dataSource={this.state.dataSource} pagination={false} showHeader={false}>
              <Column
                   title="序号"
                   key="index"
                   render={(text, record, index) => (
                   <span>
                       <Avatar size="small" style={{ backgroundColor: '#ff5722' }}>{index + 1}</Avatar>
                   </span>
                   )}
               />
               <Column
                   title="图片"
                   key="picture"
                   render={(text, record, index) => {
                            return <img className="chooseResource" src={record.PicUrl} />
                   }
                       
                   }
               />
               <Column
                   title="名称"
                   dataIndex="PicName"
                   key="PicName"
               />
               <Column
                    title="链接"
                    key="url"
                    render={(record) => {
                        return <InputGroup compact>
                                    <Select showSearch optionFilterProp="children" onChange={this.productSelectChange.bind(this, record)} placeholder='生成商品链接' style={{width: '30%'}} filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}>
                                       {this.productSelect}
                                    </Select>
                                    <Input onChange={this.urlChange.bind(this, record)} value={record.Url ? record.Url : ''} defaultValue={record.Url} placeholder="对应网址（可为空）" style={{ width: '50%' }} />
                                </InputGroup>
                        // return <Input onChange={(e) => {record.Url = e.target.value}} defaultValue={record.Url} placeholder="对应网址（可为空）" />
                    }
                        
                    }
                />
               <Column
                   title="移动"
                   key="move"
                   render={(text, record, index) => (
                   <span>
                       <Button type="primary" style={{marginRight: '3px'}} size="snall" onClick={this.arrUp.bind(this, index)}>上移</Button>
                       <Button type="primary" style={{marginRight: '3px'}} size="snall" onClick={this.arrDown.bind(this, index)}>下移</Button>
                       <Button type="primary" size="snall" onClick={this.arrDelete.bind(this, index)}>删除</Button>
                   </span>
                   )}
               />
               </Table>
           <Button type="dashed" onClick={this.chooseResource} style={{ width: '100%' }}>
                       <Icon type="plus" /> 选择图片
                   </Button>
              </div>
              <div className="wechatSettingBtn"><Button type="primary" onClick={this.saveCarousel}>保存</Button></div>
              <ResourceDialog 
              visible={this.state.visible} 
              handleOk={this.handleOk} 
              handleCancel={this.handleCancel}
              resourceClick={this.resourceClick}
              typ = {3} // 代表上传资源为微信滚动图
              {...this.props}
              />
            </div>
        )
    }
}

export default Carousel
