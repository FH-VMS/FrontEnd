import { message } from 'antd'
import Model from 'STORE/model'
// import rootRouter from 'ROUTE/index'
import {hashHistory} from 'react-router'
import Utility from 'UTIL/utility'
import $ from 'jquery'

class ApiService {
	apiServiceMethod(apimodule, apiname, type, parameters, excel) {
        const domain = Model.BaseSetting.Root
		const deferred = $.Deferred()
		var method = type.toUpperCase()
		if (['GET', 'PUT', 'POST', 'DELETE', 'OPTIONS'].indexOf(method) === -1) {
			return
		}
        
		var finalUrl = domain + '/' + apimodule + '/' + (apiname == '' ? '' : (apiname))
		
        var queryString = []
		var postdata 
		var i = 0
		var len = parameters ? Object.keys(parameters).length : 0

		if (parameters) {
			for (let x in parameters) {
				i++
				if (i == len && typeof parameters[x] == 'object') { 
					postdata = JSON.stringify(parameters[x])
					continue
				}
				if (!parameters[x]) {
					continue
				}
				queryString.push(x + '=' + encodeURI(parameters[x]))
			}
			finalUrl += '?' + queryString.join('&')
		}
		
		if (excel) {
			window.open(finalUrl)
			return
		}
		/*
		if (method == 'DELETE') {
			var len = parameters ? Object.keys(parameters).length : 0
            var queryString = []
			var i = 0
			if (parameters) {
				for (let x in parameters) {
					i++
					if (i == len && typeof parameters[x] == 'object') {
						continue
					}
					queryString.push(x + '=' + encodeURI(parameters[x]))
				}
				finalUrl += '?' + queryString.join('&')
			}
		}
 */

		var opt = {
			type: method,
			dataType: 'json',
			url: finalUrl,
			headers: {
				'FH-COOKIES': JSON.stringify(Utility.Cookie.getValue('UserInfo'))
			},
			xhrFields: { // 跨域允许带上 cookie
				withCredentials: true
			}
			
			/*
			,
			crossDomain: true
		   * */
		}
	
		
		opt.contentType = 'application/json; charset=utf-8'
		if (postdata) {
			opt.data = postdata
		}
		
		$.support.cors = true

		$.ajax(opt)
		// .done(defer.resolve)
		.then(response => {
                    var msg = response
                    var RetCode = msg.hasOwnProperty('RetCode') ? msg.RetCode : undefined 
                    var RetMsg = msg.hasOwnProperty('RetMsg') ? msg.RetMsg : '返回消息缺失' 
                    var RetObj = msg.hasOwnProperty('RetObj') ? msg.RetObj : undefined 
					var RetPagination = msg.hasOwnProperty('RetPagination') ? msg.RetPagination : undefined 
				
					if (RetCode == 1) {
                        if (RetMsg && RetMsg != '操作成功！') {
							// 返回消息判断 
							if (RetMsg == '机器不存在' || RetMsg == '机器不在线') {
                                hashHistory.push('/notservice')
							} else {
                              message.warning(RetMsg) 
							}
                            
                        }
						

						if (RetPagination) {
							deferred.resolve({data: RetObj, pager: RetPagination}, response)
						} else {
							deferred.resolve(RetObj, response)
						}
						
                       
                    } else if (RetCode == 200 || RetCode == 300) {
                        console.error(' Error Message : [ code : ' + msg.RetCode + ' ] ' + RetMsg)
                        deferred.reject(msg)
                    } else if (RetCode == 20 || RetCode == 100) {
						
                        if (RetMsg != null && RetMsg.length > 0) {
                            message.warning(RetMsg)
                        }
						// hashHistory.push({ pathname: rootRouter.login.path})
						
						if (RetPagination) {
							deferred.resolve({data: RetObj, pager: RetPagination}, response)
						} else {
							deferred.resolve(RetObj, response)
						}
                        
                    } else {
                        deferred.resolve(RetObj, response)
                        console.error(' Error Message : [ code : ' + RetCode + ' ]' + RetMsg + ' 返回信息没有RetCode ')
                    }
		})
		.fail(function(err) {
             console.error(err)
		})

		return deferred.promise()
	}
}


export default (new ApiService()).apiServiceMethod
