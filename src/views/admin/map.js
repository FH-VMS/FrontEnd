import React, {Component} from 'react'


class Map extends Component {
    constructor(props) {
		super(props)
       
	}
    

    componentWillMount() {

    }

    componentDidMount() {
        var map = new window.BMap.Map('allmap')
        var point = new window.BMap.Point(120.19, 30.26)
        map.enableScrollWheelZoom(true)
        map.centerAndZoom(point, 12)

        function myFun (result) {
            var cityName = result.name
            map.setCenter(cityName)
        }
        var myCity = new window.BMap.LocalCity()
        myCity.get(myFun)


        // var myIcon = new window.BMap.Icon('http://developer.baidu.com/map/jsdemo/img/fox.gif', new window.BMap.Size(300, 157))
        var marker2 = new window.BMap.Marker(point)  // 创建标注
        map.addOverlay(marker2)  
        marker2.addEventListener('mouseover', () => {
            // alert('123')
        })
   }

    
    render() {

        return (
            <div className="mapContainer">
                <div id="allmap">
                
                </div>
           </div>
        )
    }
}

export default Map
