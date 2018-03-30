import apis from 'SERVICE/apis'

const FETCH_DIC = 'FETCH_DIC'
const FETCH_RANK = 'FETCH_RANK'
const FETCH_CLIENTDIC = 'FETCH_CLIENTDIC'

const FETCH_USERBYCLIENT = 'FETCH_USERBYCLIENT'
const FETCH_PICTRUEDIC = 'FETCH_PICTRUEDIC'
const FETCH_CABINETDIC = 'FETCH_CABINETDIC'
const FETCH_PAYCONFIGDIC = 'FETCH_PAYCONFIGDIC'
const FETCH_ADDIC = 'FETCH_ADDIC'

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

export default {
  fetchDic, fetchRank, fetchClientDic, fetchUserByClientId, fetchPictureDic, fetchCabinetDic, fetchPayConfigByClientId, fetchAdDic
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
  [FETCH_ADDIC]: (result, { payload }) => ({payload})
}
