// 取问号后的字段转换成对象
export const handleUrlParams = (params) => {
	// 解码
	params = decodeURIComponent(params)
	// 去掉 ?
	// 以 & 劈开  ['fromaccountnumber=8801000011076', 'status=成功']
	params = params.split('&')
	// 最终返回的对象
	let obj = {}
	// 处理所有key=value => obj[key] = value
	params.map((v) => {
		// ['status', '成功']
		v = v.split('=')
		obj[v[0]] = v[1]
	})
	return obj
}
