import React, {Component} from 'react'
import { Row, Col, Button, Form } from 'antd'

const FormItem = Form.Item

class ToolControl extends Component {
    constructor(props) {
        super(props)
      
        this.state = {
            value: '',
            focus: false
        }
    }
    
    // 搜索框操作
    handleInputChange = (e) => {
        this.setState({
        value: e.target.value
        })
    }

    handleFocusBlur = (e) => {
        this.setState({
        focus: e.target === document.activeElement
        })
    }

    handleSearch = (e) => {
        if (this.props.onSearch) {
        this.props.onSearch(e, this.state.value)
        }
    }

    // 按钮组操作

     create = (e) => {
        if (this.props.onCreate) {
          this.props.onCreate('创建')
        }
       
    }

    exportData = (e) => {
        e.preventDefault()
        this.props.form.validateFields((err, values) => {
            if (err) {
                
            }
            if (this.props.onExportData) {
              this.props.onExportData(values)
            }
        })
      
    }

    componentWillMount() {
         
    }
    
    componentDidMount() {
        
    }


  handleSearch = (e) => {
    e.preventDefault()
    this.props.form.validateFields((err, values) => {
        if (err) {
            
        }
       if (this.props.onSearch) {
          this.props.onSearch(values)
        }
    })
  }

  handleReset = (e) => {
    this.props.form.resetFields()
    this.handleSearch(e)
  }

  toggle = () => {
    const { expand } = this.state
    this.setState({ expand: !expand })
  }

  render() {
     const { getFieldDecorator } = this.props.form
     const formItemLayout = {
       labelCol: { span: 5 },
       wrapperCol: { span: 19 }
     }
    
    
    // To generate mock Form.Item
    const children = []
    for (let i = 0; i < this.props.searchDatasource.length; i++) {
      let defValue = ''
      if (this.props.defaultValue) {
          defValue = this.props.defaultValue[this.props.searchDatasource[i].name]
      }
      children.push(
        <Col span={8} key={i}>
          <FormItem {...formItemLayout} label={this.props.searchDatasource[i].label}>
            {getFieldDecorator(this.props.searchDatasource[i].name, {initialValue: defValue})(
              this.props.searchDatasource[i].control
            )}
          </FormItem>
        </Col>
      )
    }
    // 计算搜索button应放的位置
    let remainder = this.props.searchDatasource.length % 3
    let searchButtonSpan = 8
    if (remainder == 0) {
        searchButtonSpan = 24
    } else if (remainder == 1) {
        searchButtonSpan = 16
    }
    
    children.push(<Col span={searchButtonSpan} style={{ textAlign: 'right'}}> 
    <Button.Group style={{ display: this.props.auth.CanSearch }}>
    <Button type="primary" size="large" htmlType="submit">查询</Button>
    <Button type="ghost" size="large" style={{marginRight: '8px'}} onClick={this.handleReset}>
        清除
    </Button>
    </Button.Group>
    <Button type="ghost" size="large" style={{display: this.props.auth.CanAdd }} onClick={this.create}>创建</Button>
    <Button type="ghost" size="large" style={{display: this.props.auth.CanExport }} onClick={this.exportData}>导出</Button>
    
 </Col>)
    
    // <Button type="ghost" size="large" onClick={this.exportData}>导出</Button>  导出功能暂时取消
    
    return (
            <div className="tool-container">
                <Row type="flex" justify="space-around" align="middle">
                   <Col span={24}> 
                       <div style={{ width: '100%' }}>
                        <Form
                        horizontal
                        onSubmit={this.handleSearch}
                        >
                        <Row gutter={40}>
                            
                            <Col span={24}>{children}</Col>
                        </Row>
                        <Row>
                            
                        </Row>
                        </Form>
                    </div>
                   </Col>
                </Row>
            </div>
        )
    }
}

const WrappedAdvancedSearchForm = Form.create({})(ToolControl)

export default WrappedAdvancedSearchForm
