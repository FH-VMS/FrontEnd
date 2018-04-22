import React, {Component} from 'react'
import {Carousel, Tabs, Badge} from 'antd-mobile'
import EveryProduct from 'COMPONENT/wechat/mall/everyProduct'

class Mall extends Component {
	constructor(props) {
		super(props)
	}

  componentWillMount() {
    
  }



  render() {

      return (
          <div>
            <Carousel
                autoplay={true}
                infinite
                beforeChange={(from, to) => console.log(`slide from ${from} to ${to}`)}
                afterChange={index => console.log('slide to', index)}
            >
              <img
                src={`https://zos.alipayobjects.com/rmsportal/AiyWuByWklrrUDlFignR.png`}
                alt=""
                style={{ width: '100%', verticalAlign: 'top' }}
                onLoad={() => {
                  // fire window resize event to change height
                  window.dispatchEvent(new Event('resize'))
                }}
              />
              <img
                src={`https://zos.alipayobjects.com/rmsportal/TekJlZRVCjLFexlOCuWn.png`}
                alt=""
                style={{ width: '100%', verticalAlign: 'top' }}
                onLoad={() => {
                  // fire window resize event to change height
                  window.dispatchEvent(new Event('resize'))
                }}
              />
              <img
                src={`https://zos.alipayobjects.com/rmsportal/IJOtIlfsYdTyaDTRVrLI.png`}
                alt=""
                style={{ width: '100%', verticalAlign: 'top' }}
                onLoad={() => {
                  // fire window resize event to change height
                  window.dispatchEvent(new Event('resize'))
                }}
              />
            </Carousel>
            <Tabs tabs={[
                { title: <Badge>今日推荐</Badge> },
                { title: <Badge>套餐</Badge> },
                { title: <Badge>单品</Badge> }
              ]}
              initialPage={0}
              onChange={(tab, index) => { console.log('onChange', index, tab) }}
              onTabClick={(tab, index) => { console.log('onTabClick', index, tab) }}
            >
              <div className="tabItem">
                <EveryProduct />
                <EveryProduct />
                <EveryProduct />
                <EveryProduct />
              </div>
              <div className="tabItem">
                Content of second tab
              </div>
              <div className="tabItem">
                Content of third tab
              </div>
            </Tabs>
          </div>
        )
 }
  
}

export default Mall
