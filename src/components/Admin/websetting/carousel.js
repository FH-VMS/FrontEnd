import React, {Component} from 'react'
import {Icon, Table, Button, message, Avatar, Input} from 'antd'
import ResourceDialog from 'COMPONENT/admin/ad/resourceDialog'

const { Column } = Table

class Carousel extends Component {
    constructor(props) {
		super(props)
        this.state = {
            visible: false,
            dataSource: this.props.webInfo.CarouselJson ? JSON.parse(this.props.webInfo.CarouselJson) : [],
            loading: false
        }
    }

    componentWillMount() {
      
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

    
  
    render() {
        if (this.props.webInfo && this.props.webInfo.CarouselJson) {
            this.state.dataSource = JSON.parse(this.props.webInfo.CarouselJson)
        } else {
            this.state.dataSource = []
        }
        return (
            <div>
              <div className="uploadCarouselWarning"><Icon type="info-circle-o" /> <span>图片大小不能大于10kb,建议尺寸宽*高=375px*200px</span></div>
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
                        console.log('bbbbb', record)
                        return <Input onChange={(e) => {record.Url = e.target.value}} defaultValue={record.Url} placeholder="对应网址（可为空）" />
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
