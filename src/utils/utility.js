import moment from 'moment'
import Model from 'STORE/model'

// 推荐在入口文件全局设置 locale
import 'moment/locale/zh-cn'
moment.locale('zh-cn')

export default {
    Cookie: {
        setValue: function (cname, cvalue, exdays) {
            var expires = ''
            if (exdays) {
                var d = new Date()
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000))
                expires = ';expires=' + d.toUTCString()
            }
            document.cookie = cname + '=' + escape(JSON.stringify(cvalue)) + expires
        },
        getValue: function (cname) {
            var name = cname + '='
            var ca = document.cookie.split(';')
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i]
                while (c.charAt(0) == ' ') c = c.substring(1)
                if (c.indexOf(name) != -1) {
                    var s 
                    try {
                        s = JSON.parse(unescape(c.substring(name.length, c.length))) 
                    } catch (e) {
                        // alert('上次未能正确关闭浏览器，请重启浏览器。');
                        console.error('cookie error .')
                    }
                    return s
                }
            }
            return ''
        },
        clear: function (name) {
            this.setValue(name, '', -1)
        },
        setAuth: function(cvalue) {

            this.setValue('MenuAuth', cvalue)
        },
        getAuth: function() {
            
            return this.getValue('MenuAuth')
        }
    },
    dateFormaterObj: function(value, typeVal) {
        
        if (!value) {
            return
        }
        
         return moment(value, 'YYYY-MM-DD')

    },
    dateFormaterString: function(value) {
        return value.format('YYYY/MM/DD')
    },
    getUploadObj: function() {
        return {
            name: 'file',
            action: Model.BaseSetting.Root + '/Common/PostUpload',
            headers: {
                'FH-COOKIES': JSON.stringify(this.Cookie.getValue('UserInfo'))
            },
            dataType: 'json'
        }
    },
    getCurrentWeekDate: function() {
        var now = new Date() 
        var nowTime = now.getTime() 
        var day = now.getDay()
        var oneDayLong = 24 * 60 * 60 * 1000 

        if (day == 0) {
            day = 7
        }
        var MondayTime = nowTime - (day - 1) * oneDayLong 
        var SundayTime = nowTime + (7 - day) * oneDayLong

        
        var monday = new Date(MondayTime)
        var sunday = new Date(SundayTime)
        return [this.dateFormaterObj(monday), this.dateFormaterObj(sunday)]
    },
    hasAuth: function(pathName) {
        if (pathName == '') {
            $('.childrenContainer').css('background-color', '#dcdedd')
          return
        } else {
            $('.childrenContainer').css('background-color', '#fff')
        }
        let sessionMenus = JSON.parse(sessionStorage.getItem('Menus'))
        let hasAuth = false
        if (sessionMenus) {
          for (let j = 0; j < sessionMenus.length; j++) {
            for (let i = 0; i < sessionMenus[j].Menus.length; i++) {
              if (sessionMenus[j].Menus[i].Url == pathName) {
                hasAuth = true
                break
              }
            }
    
            if (hasAuth) {
              break
            }
          }
        }
    
        if (hasAuth) {
    
        } else {
          location.href = 'login.html'
        }
    }
}


