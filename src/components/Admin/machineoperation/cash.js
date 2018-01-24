import React, {Component} from 'react'
import {Spin, Breadcrumb, Menu, Dropdown, Icon, InputNumber } from 'antd'

class CashComponent extends Component {
    constructor(props) {
        super(props)
        this.state = {
            loading: false
        }
    }

    componentWillMount() {
    }

    priceChange = () => {

    }

    render() {
        const menu = (
            <Menu>
              <Menu.Item>
                <a target="_blank" rel="noopener noreferrer" href="http://www.alipay.com/">1st menu item</a>
              </Menu.Item>
              <Menu.Item>
                <a target="_blank" rel="noopener noreferrer" href="http://www.taobao.com/">2nd menu item</a>
              </Menu.Item>
              <Menu.Item>
                <a target="_blank" rel="noopener noreferrer" href="http://www.tmall.com/">3rd menu item</a>
              </Menu.Item>
            </Menu>
          )
        return (
            <div>
                <Breadcrumb>
                    <Breadcrumb.Item><a>列表</a></Breadcrumb.Item>
                    <Breadcrumb.Item><a>现金价格下推</a></Breadcrumb.Item>
                    <Breadcrumb.Item>
                        <Dropdown overlay={menu}>
                            <a className="ant-dropdown-link" href="#">
                            货柜 <Icon type="down" />
                            </a>
                        </Dropdown>
                    </Breadcrumb.Item>
                </Breadcrumb>
                <Spin size="large" spinning={this.state.loading}>
                  <div className="cashContainer">
                      <div>
                          <div>
                             <div>货道号</div>
                             <div>商品名称</div>
                          </div>
                          <div>
                             <InputNumber min={0} max={100} step={0.1} onChange={this.priceChange} />
                          </div>
                      </div>
                      <div>
                          <div>
                             <div>货道号</div>
                             <div>商品名称</div>
                          </div>
                          <div>
                             <InputNumber min={0} max={100} step={0.1} onChange={this.priceChange} />
                          </div>
                      </div>
                      <div>
                          <div>
                             <div>货道号</div>
                             <div>商品名称</div>
                          </div>
                          <div>
                             <InputNumber min={0} max={100} step={0.1} onChange={this.priceChange} />
                          </div>
                      </div>
                  </div>
                </Spin>
            </div>
        )
    }
}

export default CashComponent
