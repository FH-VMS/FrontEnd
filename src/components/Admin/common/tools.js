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
      if (this.props.onExportData) {
          this.props.onExportData(e)
        }
    }

    componentWillMount() {
        
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
      children.push(
        <Col span={8} key={i}>
          <FormItem {...formItemLayout} label={this.props.searchDatasource[i].label}>
            {getFieldDecorator(this.props.searchDatasource[i].name)(
              this.props.searchDatasource[i].control
            )}
          </FormItem>
        </Col>
      )
    }
    // <Button type="ghost" size="large" onClick={this.exportData}>导出</Button>  导出功能暂时取消
        return (
            <div className="tool-container">
                <Row>
                   <Col span={24}> 
                       <div className="ant-search-input-wrapper" style={{ width: '100%' }}>
                        <Form
                        horizontal
                        className="ant-advanced-search-form"
                        onSubmit={this.handleSearch}
                        >
                        <Row gutter={40} style={{ display: this.props.auth.CanSearch }}>
                            
                            <Col span={24}>{children}</Col>
                        </Row>
                        <Row>
                             <Col span={24} style={{ textAlign: 'right' }}> 
                                <Button type="primary" size="large" htmlType="submit" style={{ marginRight: 8, display: this.props.auth.CanSearch }}>查询</Button>
                                <Button type="ghost" size="large" style={{ marginRight: 8, display: this.props.auth.CanSearch }} onClick={this.handleReset}>
                                    清除条件
                                </Button>
                                 
                                <Button type="ghost" size="large" style={{ marginRight: 8, display: this.props.auth.CanAdd }} onClick={this.create}>创建</Button>
                                
                             </Col>
                        </Row>
                        </Form>
                    </div>
                   </Col>
                </Row>
            </div>
        )
    }
}

const WrappedAdvancedSearchForm = Form.create()(ToolControl)

export default WrappedAdvancedSearchForm
