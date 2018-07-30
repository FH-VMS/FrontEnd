import moment from 'moment'
import {handleUrlParams} from 'UTIL/mobileUtility'
import {hashHistory} from 'react-router'
// 推荐在入口文件全局设置 locale
import 'moment/locale/zh-cn'
moment.locale('zh-cn')

export default {
    Cart: {
        getData: function () {
            return localStorage.getItem('cartproducts-' + this.GetClientId())
        },
        setData: function(data) {
            localStorage.setItem('cartproducts-' + this.GetClientId(), JSON.stringify(data))
        },
        clearData: function() {
            localStorage.removeItem('cartproducts-' + this.GetClientId())
        },
        GetClientId: function() {
            let searchPara = handleUrlParams(window.location.href.split('?')[1])
            if (!searchPara.clientId) {
                hashHistory.push('/notservice')
                return ''
            } else {
                return searchPara.clientId
            }
        }
    },
    isWeiXin: function() {
        
        var ua = window.navigator.userAgent.toLowerCase()
        
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
            return true
        } else {
            return false
        }
    },
    GetMemberId: function() {
        let memberInfo = sessionStorage.getItem('wechatInfo')
        if (!memberInfo) {
            return ''
        }

        return JSON.parse(memberInfo).openid
    }
}


