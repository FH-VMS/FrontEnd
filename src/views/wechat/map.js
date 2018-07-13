import React, {Component} from 'react'
import { Map, Marker } from 'react-amap'
// import Geolocation from 'react-amap-plugin-geolocation'
/*
const pluginProps = {
    enableHighAccuracy: true,
    timeout: 10000,
    showButton: true,
    buttonOffset: [10, 20],
    buttonPosition: 'RB',
    zoomToAccuracy: true
  }
*/
class AroundMap extends Component {
    constructor(props) {
        super(props)
        this.state = {
            aroundData: []
        }
    }


    componentWillMount() {
      
       
    }


    componentDidMount() {
        
    }
  


    render() {
        let mapJson = sessionStorage.getItem('AroundMap')
        let postion = ['120.1648200000', '30.2435500000']
        if (mapJson) {
          let {Longitude, Latitude} = JSON.parse(mapJson)
          postion = [Longitude, Latitude]
        }
        return (
            <div>
               <div className="aroundMapContainer">
                <Map resizeEnable={true} zoom={15} center={postion} amapkey={'9015a8600408fdc7cb39d8cb1b83155a'} version={'1.4.6'}>
                {
                    /*
                     <Geolocation {...pluginProps} />
                    */
                }
                   
                    <Marker position={postion} />
                </Map>
               </div>
            </div>
        )
    }
}

export default AroundMap
