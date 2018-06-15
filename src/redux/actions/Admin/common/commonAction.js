import apis from 'SERVICE/apis'

const FETCH_DIC = 'FETCH_DIC'
const FETCH_RANK = 'FETCH_RANK'
const FETCH_CLIENTDIC = 'FETCH_CLIENTDIC'

const FETCH_USERBYCLIENT = 'FETCH_USERBYCLIENT'
const FETCH_PICTRUEDIC = 'FETCH_PICTRUEDIC'
const FETCH_CABINETDIC = 'FETCH_CABINETDIC'
const FETCH_PAYCONFIGDIC = 'FETCH_PAYCONFIGDIC'
const FETCH_ADDIC = 'FETCH_ADDIC'
const FETCH_PRODUCTTYPEDIC = 'FETCH_PRODUCTTYPEDIC'
const FETCH_PRODUCTDIC = 'FETCH_PRODUCTDIC'
const FETCH_MACHINEDIC = 'FETCH_MACHINEDIC'
const FETCH_PRIVILEGEDIC = 'FETCH_PRIVILEGEDIC'

const fetchDic = (searParam) => dispatch =>
  apis
    .Common
    .GetDic(searParam)
    .then(msgs => {
      dispatch({
         type: FETCH_DIC,
         payload: msgs
      })

      return msgs
  })

  const fetchRank = (searParam) => dispatch =>
  apis
    .Common
    .GetRank(searParam)
    .then(msgs => {
      dispatch({
         type: FETCH_RANK,
         payload: msgs
      })

      return msgs
  })

  // 取客户当字典
  const fetchClientDic = () => dispatch =>
  apis
    .User
    .GetClientDic()
    .then(msgs => {
      dispatch({
         type: FETCH_CLIENTDIC,
         payload: msgs
      })

      return msgs
  })

   // 根据客户取用户
  const fetchUserByClientId = (params) => dispatch =>
  apis
    .Common
    .GetUserByClientId(params)
    .then(msgs => {
      dispatch({
         type: FETCH_USERBYCLIENT,
         payload: msgs
      })

      return msgs
  })
  
   // 根据客户取支付配置
  const fetchPayConfigByClientId = (params) => dispatch =>
  apis
    .Common
    .GetPayConfigDic(params)
    .then(msgs => {
      dispatch({
         type: FETCH_PAYCONFIGDIC,
         payload: msgs
      })

      return msgs
  })

  // 取图片字典
  const fetchPictureDic = () => dispatch =>
  apis
    .Common
    .GetPictureDic()
    .then(msgs => {
      dispatch({
         type: FETCH_PICTRUEDIC,
         payload: msgs
      })

      return msgs
  })

  // 取货柜字典
  const fetchCabinetDic = () => dispatch =>
  apis
    .Common
    .GetCabinetDic()
    .then(msgs => {
      dispatch({
         type: FETCH_CABINETDIC,
         payload: msgs
      })
       return msgs
  })

    // 取广告模板
    const fetchAdDic = (body) => dispatch =>
    apis
      .Common
      .GetAdDic(body)
      .then(msgs => {
        dispatch({
           type: FETCH_ADDIC,
           payload: msgs
        })
         return msgs
    })

       // 取商品类型字典
       const fetchProductTypeDic = (body) => dispatch =>
       apis
         .Common
         .GetProductTypeDic(body)
         .then(msgs => {
           dispatch({
              type: FETCH_PRODUCTTYPEDIC,
              payload: msgs
           })
            return msgs
       })

       // 取商品字典
  const fetchProductDic = () => dispatch =>
  apis
    .Common
    .GetProductDic()
    .then(msgs => {
      dispatch({
         type: FETCH_PRODUCTDIC,
         payload: msgs
      })
      return msgs
  })

   // 取机器字典
   const fetchMachineDic = () => dispatch =>
   apis
     .Common
     .GetMachineDic()
     .then(msgs => {
       dispatch({
          type: FETCH_MACHINEDIC,
          payload: msgs
       })
       return msgs
   })

      // 取未过期优惠券作字典
      const fetchPrivilegeDic = () => dispatch =>
      apis
        .Common
        .GetNotExpirePrivilegeDic()
        .then(msgs => {
          dispatch({
             type: FETCH_PRIVILEGEDIC,
             payload: msgs
          })
          return msgs
      })

export default {
  fetchDic, fetchRank, fetchClientDic, fetchUserByClientId, fetchPictureDic, 
  fetchCabinetDic, fetchPayConfigByClientId, fetchAdDic, fetchProductTypeDic, 
  fetchProductDic, fetchMachineDic, fetchPrivilegeDic
}

export const ACTION_HANDLERS = {
  [FETCH_DIC]: (result, { payload }) => {
      result.DicData = payload
      return result
  },
  [FETCH_RANK]: (result, { payload }) => {
      result.DicData = payload
      return result
  },
  [FETCH_CLIENTDIC]: (result, { payload }) => {
      result.DicData = payload
      return result
  },
  [FETCH_USERBYCLIENT]: (result, { payload }) => {
      result.DicData = payload
      return result
  },
  [FETCH_PICTRUEDIC]: (result, { payload }) => {
      result.DicData = payload
      return result
  },
  [FETCH_CABINETDIC]: (result, { payload }) => {
      result.DicData = payload
      return result
  },
  [FETCH_PAYCONFIGDIC]: (result, { payload }) => {
      result.DicData = payload
      return result
  },
  [FETCH_ADDIC]: (result, { payload }) => ({payload}),
  [FETCH_PRODUCTTYPEDIC]: (result, { payload }) => {
    result.productTypeDic = payload
    return result
},
[FETCH_PRODUCTDIC]: (result, { payload }) => {
    result.DicData = payload
    return result
},
[FETCH_MACHINEDIC]: (result, { payload }) => {
    result.DicData = payload
    return result
},
[FETCH_PRIVILEGEDIC]: (result, { payload }) => {
    result.DicData = payload
    return result
}
}
