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
    timeFormaterObj: function(value, typeVal) {
        
        if (!value) {
            return
        }
        
         return moment(value, 'YYYY-MM-DD HH:mm:ss')

    },
    timeFormaterString: function(value) {
        return value.format('YYYY/MM/DD HH:mm:ss')
    },
    getUploadObj: function(typ) {
        return {
            name: 'file',
            action: Model.BaseSetting.Root + '/Common/PostUpload?typ=' + typ,
            headers: {
                'FH-COOKIES': JSON.stringify(this.Cookie.getValue('UserInfo'))
            },
            dataType: 'json'
        }
    },
    getUploadWxCertObj: function(mchId, id) {
        return {
            name: 'file',
            action: Model.BaseSetting.Root + '/PayConfig/UpdateWxCert?mchId=' + mchId + '&id=' + id,
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
            $('#childrenContainer').removeClass('childrenContainer')
          return
        } else {
            $('#childrenContainer').addClass('childrenContainer')
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
    },
    getTreeClient: function(list) {
        let userInfoCookie = this.Cookie.getValue('UserInfo')
        let rClientId = userInfoCookie.UserClientId
        // 将数据存储为 以 id 为 KEY 的 map 索引数据列
        let items = {};
        // 获取每个节点的直属子节点，*记住是直属，不是所有子节点
        for (let i = 0; i < list.length; i++) {
             let key = list[i].fatherid;
             if (items[key]) {
                 items[key].push(list[i]);
             } else {
                 items[key] = [];
                 items[key].push(list[i]);
             }
         }
        return this.formatTree(items, rClientId);
    },
    formatTree: function(items, parentId) {
        let result = [];
        if (!items[parentId]) {
            return result;
        }
        for (let t of items[parentId]) {
            t.children = this.formatTree(items, t.value)
            result.push(t);
        }
       return result;
    }
}


