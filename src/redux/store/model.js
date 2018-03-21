/* ****************
*	
*	数据model列表 
*	// 开发 http://localhost:2734/api   // 测试 http://120.27.217.224:8088/api  // 正式  http://106.14.190.9:8088/api
*	@后台自动生成
*	2017/1/7
* 
**************** */
let rootApi = 'http://localhost:5000/api'
if (__RELEASE__) { 
    rootApi = 'http://120.27.217.224:8088/api'
}
if (__PROD__) { // 为了方便  跑起来使用云上的接口
    rootApi = 'http://120.27.217.224:8088/api'
}
const Front = { 
    BaseSetting: {
       Root: rootApi,
       PageSize: __WEBCONFIG__.defaultpagesize,
       NoPage: __WEBCONFIG__.nopage
    }, 
  
   Ad: {
       AdModel: {
           Id: '',
           Name: '',
           ClientId: '',
           Reources: '',
           Relations: ''
       },
       AdRelationModel: {
           AdId: '',
           SourceId: '',
           Sequence: '',
           AdType: '',
           ResourcePath: '',
           ResourceName: ''
       }
   },
   Model: {
       BaseModel: {
           PageIndex: '',
           PageSize: '',
           CreateDate: '',
           Creator: '',
           Remark: ''
       },
       Class1: {
       }
   },
   Common: {
       CommonDic: {
           Id: '',
           Name: '',
           children: ''
       },
       DicModel: {
           Id: '',
           Value: '',
           BookChinese: ''
       },
       MenuModel: {
           MenuId: '',
           MenuName: '',
           MenuFather: '',
           Url: '',
           Remark: '',
           Add: '',
           Del: '',
           Mod: '',
           Sear: '',
           Checked: ''
       }
   },
   Customer: {
       CustomerModel: {
           Id: '',
           ClientName: '',
           ClientStatus: '',
           ClientFatherId: '',
           ClientType: '',
           ClientContect: '',
           ClientTel: '',
           ClientEmail: '',
           ClientCountry: '',
           ClientCurrency: '',
           ClientAddress: '',
           UpdateDate: '',
           Updater: '',
           MobileArr: '',
           children: '',
           key: '',
           PageIndex: '',
           PageSize: '',
           CreateDate: '',
           Creator: '',
           Remark: ''
       }
   },
   Machine: {
       CabinetConfigModel: {
           CabinetId: '',
           CabinetName: '',
           CabinetType: '',
           LayerNumber: '',
           LayerGoodsNumber: '',
           Remark: '',
           CabinetDisplay: ''
       },
       CashEquipmentModel: {
           Id: '',
           MachineId: '',
           CashStatus: '',
           CashStock: '',
           CoinStatus: '',
           CoinStock: '',
           UpdateType: '',
           MachineName: '',
           PageIndex: '',
           PageSize: ''
       },
       CoinStockModel: {
           Money: '',
           Number: ''
       },
       MachineCabinetModel: {
           CabinetId: '',
           CabinetName: '',
           CabinetType: '',
           LayerNumber: '',
           LayerGoodsNumber: '',
           Remark: '',
           CabinetDisplay: '',
           PageIndex: '',
           PageSize: ''
       },
       MachineConfigModel: {
           MachineId: '',
           MachineIdB: '',
           McStatus: '',
           McActivity: '',
           McAlipayEnable: '',
           McWpayEnable: '',
           McBillpayEnable: '',
           McBillchangeEnable: '',
           McCoinpayEnable: '',
           McCoinchangeEnable: '',
           McUpayEnable: '',
           McIcpayEnable: '',
           McLiftEnable: '',
           McInfraredEnable: '',
           McArea1Temp: '',
           McArea2Temp: '',
           McArea3Temp: '',
           McArea4Temp: '',
           McGoodsUsed: '',
           McLongitude: '',
           McDimension: '',
           Updater: '',
           UpdateDate: '',
           Remark: '',
           PageIndex: '',
           PageSize: '',
           DeviceId: ''
       },
       MachineListModel: {
           MachineId: '',
           DeviceId: '',
           TypeId: '',
           TypeText: '',
           ClientId: '',
           ClientText: '',
           UserAccount: '',
           UserAccountName: '',
           StartDate: '',
           StopDate: '',
           StopReason: '',
           Updater: '',
           UpdateDate: '',
           LatestDate: '',
           MobilePayId: '',
           IpV4: '',
           LatestOnline: '',
           PageIndex: '',
           PageSize: '',
           CreateDate: '',
           Creator: '',
           Remark: ''
       },
       MachineTypeAndCabinetModel: {
           MachineTypeId: '',
           CabinetTypeId: ''
       },
       MachineTypeModel: {
           Id: '',
           TypeName: '',
           TypeType: '',
           TypeTypeText: '',
           MaxGoods: '',
           TypeRemark: '',
           Communicate: '',
           Cabinets: '',
           PageIndex: '',
           PageSize: ''
       },
       OperationLogModel: {
           MachineId: '',
           OptContent: '',
           OptDate: '',
           Operator: '',
           Remark: ''
       },
       PriceAndMaxStock: {
           m: '',
           t: ''
       },
       PriceAndMaxStockModel: {
           tid: '',
           p1: '',
           p2: '',
           p3: '',
           p4: '',
           ms: ''
       },
       ProductForMachineModel: {
           MachineId: '',
           WaresId: '',
           TunnelId: '',
           WaresName: '',
           PicUrl: '',
           CurrStock: '',
           APrice: '',
           WPrice: '',
           PageIndex: '',
           PageSize: ''
       },
       ToMachineModel: {
           MachineId: '',
           MachineStatus: '',
           m: '',
           s: ''
       },
       TunnelConfigModel: {
           MachineId: '',
           CabinetId: '',
           TunnelId: '',
           MaxPuts: '',
           CashPrices: '',
           WpayPrices: '',
           AlipayPrices: '',
           IcPrices: '',
           WaresId: '',
           IsUsed: '',
           TunnelPosition: ''
       },
       TunnelInfoModel: {
           GoodsStuId: '',
           MachineId: '',
           TunnelId: '',
           CurrStock: '',
           CurrMissing: '',
           FaultCode: '',
           FaultDescribe: '',
           CurrStatus: '',
           UpdateDate: '',
           CabinetId: '',
           WaresId: '',
           ProductName: '',
           MaxPuts: '',
           Price: '',
           PageIndex: '',
           PageSize: ''
       }
   },
   Pay: {
       ConfigModel: {
           Id: '',
           Name: '',
           AliParter: '',
           AliKey: '',
           AliRefundAppId: '',
           AliRefundRsaSign: '',
           AliPublicKey: '',
           AliPrivateKey: '',
           AliAppId: '',
           WxAppId: '',
           WxMchId: '',
           WxKey: '',
           WxAppSecret: '',
           WxSslcertPath: '',
           WxSslcertPassword: '',
           ClientId: '',
           PageIndex: '',
           PageSize: ''
       },
       KeyJsonModel: {
           m: '',
           t: ''
       },
       KeyTunnelModel: {
           tid: '',
           wid: '',
           n: '',
           s: '',
           p: '',
           tn: ''
       },
       PayStateModel: {
           ProductJson: '',
           RequestState: '',
           RequestData: ''
       },
       ProductModel: {
           MachineId: '',
           TunnelId: '',
           WaresId: '',
           WaresName: '',
           UnitW: '',
           UnitA: '',
           TradeNo: '',
           Num: ''
       }
   },
   Product: {
       ProductConfigModel: {
           WaresConfigId: '',
           WaresId: '',
           WaresConfigName: '',
           WaresName: '',
           LowMissing: '',
           LowMissingAlarm: '',
           PurchasePrice: '',
           PriceUnit: '',
           WaresStatus: '',
           UpdateDate: '',
           WaresConfigRemark: '',
           PageIndex: '',
           PageSize: ''
       },
       ProductListModel: {
           WaresId: '',
           WaresName: '',
           WaresUnitPrice: '',
           WaresWeight: '',
           WaresSpecifications: '',
           WaresManufactureDate: '',
           WaresQualityPeriod: '',
           ClientId: '',
           ClientName: '',
           PicId: '',
           PicUrl: '',
           WaresTypeId: '',
           WaresTypeText: '',
           SupplierId: '',
           Supplier: '',
           WaresDescription: '',
           Creator: '',
           UpdateDate: '',
           PageIndex: '',
           PageSize: ''
       }
   },
   Refund: {
       RefundModel: {
           OutTradeNo: '',
           TradeNo: '',
           RefundNo: '',
           RefundDetail: ''
       }
   },
   Resource: {
       PictureModel: {
           PicId: '',
           PicName: '',
           PicPath: '',
           ClientId: '',
           FileType: '',
           UploadTime: '',
           Size: '',
           PicUrl: '',
           PageIndex: '',
           PageSize: ''
       }
   },
   Sale: {
       CashSaleModel: {
           SalesNo: '',
           MachineId: '',
           SalesDate: '',
           SalesType: '',
           GoodsId: '',
           WaresId: '',
           WaresName: '',
           SalesNumber: '',
           SalesPrices: '',
           PayWay: '',
           TradeNo: '',
           SaleDateStart: '',
           SaleDateEnd: '',
           MachineName: '',
           PageIndex: '',
           PageSize: ''
       },
       SaleModel: {
           SalesIcId: '',
           MachineId: '',
           SalesDate: '',
           SalesNumber: '',
           PayDate: '',
           PayType: '',
           PayInterface: '',
           AcquiringMerchant: '',
           TradeNo: '',
           Payer: '',
           GoodsId: '',
           ComId: '',
           TradeAmount: '',
           ServiceCharge: '',
           TradeStatus: '',
           RandomId: '',
           RealitySaleNumber: '',
           WaresId: '',
           WaresName: '',
           SaleDateStart: '',
           SaleDateEnd: '',
           ClientName: '',
           DeviceId: '',
           MachineName: '',
           PageIndex: '',
           PageSize: ''
       }
   },
   Socket: {
       CommandModel: {
           Content: '',
           Size: ''
       }
   },
   Statistic: {
       ClassModel: {
           Name: '',
           Name1: '',
           Name2: '',
           Name3: '',
           Name4: '',
           Data: ''
       }
   },
   User: {
       AuthModel: {
           Id: '',
           DmsName: '',
           Rank: '',
           RankName: '',
           Remark: '',
           PageIndex: '',
           PageSize: '',
           lstAuthRelate: ''
       },
       AuthRelateModel: {
           Id: '',
           CorrDmsId: '',
           CorrMenuId: '',
           CorrAdd: '',
           CorrDel: '',
           CorrModify: '',
           CorrSearch: '',
           Remark: ''
       },
       UserModel: {
           Id: '',
           UserAccount: '',
           UserAccessId: '',
           UserName: '',
           UserPassword: '',
           UserClientId: '',
           UserClientName: '',
           EndDate: '',
           Sts: '',
           children: '',
           PageIndex: '',
           PageSize: '',
           CreateDate: '',
           Creator: '',
           Remark: ''
       }
   },
   Withdraw: {
       MachineMoneyModel: {
           MachineId: '',
           AliMoney: '',
           WxMoney: ''
       },
       TotalMoneyModel: {
           ClientId: '',
           AliAccount: '',
           WxAccount: ''
       },
       WithdrawModel: {
           Id: '',
           ClientId: '',
           Money: '',
           OptType: '',
           OptStatus: '',
           OptDatetime: ''
       }
   } 
 } 
 export default Front
 
