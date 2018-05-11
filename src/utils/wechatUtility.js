import moment from 'moment'

// 推荐在入口文件全局设置 locale
import 'moment/locale/zh-cn'
moment.locale('zh-cn')

export default {
    Cart: {
        getData: function () {
            return localStorage.getItem('cartproducts')
        },
        setData: function(data) {
            localStorage.setItem('cartproducts', JSON.stringify(data))
        },
        clearData: function() {
            localStorage.removeItem('cartproducts')
        }
    },
    isWeiXin: function() {
        
        var ua = window.navigator.userAgent.toLowerCase()
        
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
            return true
        } else {
            return false
        }
    }
}


