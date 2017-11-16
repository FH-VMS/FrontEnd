/* ****************
*	
*	数据model列表 
*	// 开发 http://localhost:2734/api   // 测试 http://120.27.217.224:8088/api  // 正式  http://106.14.190.9:8088/api
*	@后台自动生成
*	2017/1/7
* 
**************** */
const Front = { 
   BaseSetting: {
      Root: 'http://localhost:2734/api', 
      PageSize: 10,
      NoPage: 100 // 控制那些不需要翻页的，又为了保持方法共用
   }, 
 
  Model: {
      BaseModel: {
          PageIndex: '',
          PageSize: '',
          CreateDate: '',
          Creator: '',
          Remark: ''
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
          Remark: ''
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
          PageIndex: '',
          PageSize: '',
          CreateDate: '',
          Creator: '',
          Remark: '',
          MobilePayId: ''
      },
      MachineTypeModel: {
          Id: '',
          TypeName: '',
          TypeType: '',
          TypeTypeText: '',
          MaxGoods: '',
          TypeRemark: '',
          PageIndex: '',
          PageSize: ''
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
      }

  },
  Product: {
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
  Pay: {
      ConfigModel: {
          Id: '',
          Name: '',
          AliParter: '',
          AliKey: '',
          AliRefundAppId: '',
          AliRefundRsaSign: '',
          WxAppId: '',
          WxMchId: '',
          WxKey: '',
          WxAppSecret: '',
          WxSslcertPath: '',
          WxSslcertPassword: '',
          ClientId: '',
          PageIndex: '',
          PageSize: '',
          AliPublicKey: '',
          AliAppId: ''
      }
  }
} 
export default Front
 
