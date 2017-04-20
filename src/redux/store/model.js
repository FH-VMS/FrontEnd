/* ****************
*	
*	数据model列表 
*	
*	@后台自动生成
*	2017/1/7
* 
**************** */
const Front = { 
   BaseSetting: {
      Root: 'http://120.27.217.224/api', // http://localhost:2734/api   //http://120.27.217.224:8080/api
      PageSize: 10
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
          Remark: ''
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
          WapyPrices: '',
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

  } 
} 
export default Front
 
