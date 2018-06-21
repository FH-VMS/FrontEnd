/* ****************
*	
*	平台数据API列表
*	
*	@后台自动生成
*	2016/12/11
* 
**************** */
import apiService from './apiService'
const api = {
  Base: {
      GetAll: function (data) {
          return apiService('Base', 'GetAll', 'GET', data)
      }
  }, 
  Common: {
      GetMenus: function (data) {
          return apiService('Common', 'GetMenus', 'GET', data)
      },
      PostLogin: function (data) {
          return apiService('Common', 'PostLogin', 'POST', data)
      },
      GetDic: function (data) {
          return apiService('Common', 'GetDic', 'GET', data)
      },
      GetRank: function (data) {
          return apiService('Common', 'GetRank', 'GET', data)
      },
      GetUserByClientId: function (data) {
          return apiService('Common', 'GetUserByClientId', 'GET', data)
      },
      GetMachineDic: function (data) {
          return apiService('Common', 'GetMachineDic', 'GET', data)
      },
      GetPictureDic: function(data) {
          return apiService('Common', 'GetPictureDic', 'GET', data)
      },
      GetProductDic: function(data) {
          return apiService('Common', 'GetProductDic', 'GET', data)
      },
      GetCabinetDic: function(data) {
          return apiService('Common', 'GetCabinetDic', 'GET', data)
      },
      PutPassword: function(data) {
          return apiService('Common', 'PutPassword', 'PUT', data)
      },
      GetPayConfigDic: function(data) {
          return apiService('Common', 'GetPayConfigDic', 'GET', data)
      },
      GetAdDic: function(data) {
          return apiService('Common', 'GetAdDic', 'GET', data)
      },
      GetProductTypeDic: function(data) {
          return apiService('Common', 'GetProductTypeDic', 'GET', data)
      },
      GetNotExpirePrivilegeDic: function(data) {
          return apiService('Common', 'GetNotExpirePrivilegeDic', 'GET', data)
      }
	}, 
  User: {
      GetData: function (data) {
          return apiService('User', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('User', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('User', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('User', 'DeleteData', 'DELETE', data)
      },
      GetClientDic: function (data) {
          return apiService('User', 'GetClientDic', 'GET', data)
      },
      GetAuthDic: function (data) {
          return apiService('User', 'GetAuthDic', 'GET', data)
      }
	}, 
  Auth: {
      GetData: function (data) {
          return apiService('Auth', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('Auth', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('Auth', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('Auth', 'DeleteData', 'DELETE', data)
      },
      GetAuthDic: function (data) {
          return apiService('Auth', 'GetAuthDic', 'GET', data)
      }
	}, 
  Customer: {
      GetData: function (data) {
          return apiService('Customer', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('Customer', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('Customer', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('Customer', 'DeleteData', 'DELETE', data)
      }
	}, 
  MachineType: {
      GetData: function (data) {
          return apiService('MachineType', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('MachineType', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('MachineType', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('MachineType', 'DeleteData', 'DELETE', data)
      }
	}, 
  MachineList: {
      GetData: function (data) {
          return apiService('MachineList', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('MachineList', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('MachineList', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('MachineList', 'DeleteData', 'DELETE', data)
      },
      GetMachineTypeDic: function (data) {
          return apiService('MachineList', 'GetMachineTypeDic', 'GET', data)
      }
	}, 
  MachineConfig: {
      GetData: function (data) {
          return apiService('MachineConfig', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('MachineConfig', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('MachineConfig', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('MachineConfig', 'DeleteData', 'DELETE', data)
      }
	}, 
  TunnelConfig: {
      GetData: function (data) {
          return apiService('TunnelConfig', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('TunnelConfig', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('TunnelConfig', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('TunnelConfig', 'DeleteData', 'DELETE', data)
      },
      GetPriceByWaresId: function (data) {
          return apiService('TunnelConfig', 'GetPriceByWaresId', 'GET', data)
      }
	}, 
    MachineLocation: {
        GetData: function (data) {
            return apiService('MachineLocation', 'GetData', 'GET', data)
        },
        PostData: function (data) {
            return apiService('MachineLocation', 'PostData', 'POST', data)
        },
        PutData: function (data) {
            return apiService('MachineLocation', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
            return apiService('MachineLocation', 'DeleteData', 'DELETE', data)
        },
        GetLocationByMachineId: function (data) {
            return apiService('MachineLocation', 'GetLocationByMachineId', 'GET', data)
        }
      }, 
  ProductList: {
      GetData: function (data) {
          return apiService('ProductList', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('ProductList', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('ProductList', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('ProductList', 'DeleteData', 'DELETE', data)
      }
    }, 
    /* ***********************商品类型************************ */
    ProductType: {
        GetData: function (data) {
            return apiService('ProductType', 'GetData', 'GET', data)
        },
        PostData: function (data) {
            return apiService('ProductType', 'PostData', 'POST', data)
        },
        PutData: function (data) {
            return apiService('ProductType', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
            return apiService('ProductType', 'DeleteData', 'DELETE', data)
        }
    }, 
    /* ***********************商品组************************ */
    ProductGroup: {
        GetData: function (data) {
            return apiService('ProductGroup', 'GetData', 'GET', data)
        },
        PostData: function (data) {
            return apiService('ProductGroup', 'PostData', 'POST', data)
        },
        PutData: function (data) {
            return apiService('ProductGroup', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
            return apiService('ProductGroup', 'DeleteData', 'DELETE', data)
        },
        GetProductRelationById: function (data) {
            return apiService('ProductGroup', 'GetProductRelationById', 'GET', data)
        }
    }, 
    SaleCashless: {
      GetData: function (data) {
          return apiService('SaleCashless', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('SaleCashless', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('SaleCashless', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('SaleCashless', 'DeleteData', 'DELETE', data)
      },
      GetRefundDetail: function (data) {
          return apiService('SaleCashless', 'GetRefundDetail', 'GET', data)
      },
      GetStatisticSalesMoneyByDate: function (data) {
          return apiService('SaleCashless', 'GetStatisticSalesMoneyByDate', 'GET', data)
      }
	}, 
    Statistic: {
        GetMobilePayStatistic: function (data) {
          return apiService('Statistic', 'GetMobilePayStatistic', 'GET', data)
      },
      GetProductStatistic: function (data) {
          return apiService('Statistic', 'GetProductStatistic', 'GET', data)
      }
	}, 
    SaleCash: {
      GetData: function (data) {
          return apiService('SaleCash', 'GetData', 'GET', data)
      }
	}, // 货道信息
    TunnelInfo: {
      GetData: function (data) {
          return apiService('TunnelInfo', 'GetData', 'GET', data)
      },
      PostData: function (data) {
          return apiService('TunnelInfo', 'PostData', 'POST', data)
      },
      PutData: function (data) {
          return apiService('TunnelInfo', 'PutData', 'PUT', data)
      },
      DeleteData: function (data) {
          return apiService('TunnelInfo', 'DeleteData', 'DELETE', data)
      },
      GetFullfilData: function (data) {
          return apiService('TunnelInfo', 'GetFullfilAll', 'GET', data)
      },
      UpdateStockWithMobile: function (data) {
          return apiService('TunnelInfo', 'PutStockWithMobile', 'PUT', data)
      },
      GetExportFullfilData: function (data) {
          return apiService('TunnelInfo', 'GetExportFullfilData', 'GET', data, true)
      },
      PostFullFilByOneKey: function (data) {
        return apiService('TunnelInfo', 'PostFullFilByOneKey', 'POST', data)
      },
      PostMaxStock: function (data) {
        return apiService('TunnelInfo', 'PostMaxStock', 'POST', data)
      },
      PutPriceWithMobile: function (data) {
          return apiService('TunnelInfo', 'PutPriceWithMobile', 'PUT', data)
      }
	},
    /* ***********************支付************************ */
    Pay: {
        GetDataW: function (data) {
            return apiService('Payment', 'GetDataW', 'POST', data)
        },
        GetDataA: function (data) {
            return apiService('Payment', 'GetDataA', 'POST', data)
        }
    },
    Machine: {
        GetProductByMachine: function (data) {
            return apiService('Machine', 'GetProductByMachine', 'POST', data)
        },
        PostPayResult: function (data) {
            return apiService('Machine', 'PostPayResultA', 'POST', data)
        }
    },
    Wechat: {
        GetUrl: function (data) {
            return apiService('Wechat', 'GetUrl', 'POST', data)
        },
        GetProdcutTypeByClientId: function (data) {
            return apiService('Wechat', 'GetProdcutTypeByClientId', 'Get', data)
        },
        GetProdcutByTypeAndClient: function (data) {
            return apiService('Wechat', 'GetProdcutByTypeAndClient', 'POST', data)
        },
        PostDataW: function (data) {
            return apiService('Wechat', 'PostDataW', 'POST', data)
        },
        GetHistorySalesList: function (data) {
            return apiService('Wechat', 'GetHistorySalesList', 'GET', data)
        },
        GetWaitingSalesList: function (data) {
            return apiService('Wechat', 'GetWaitingSalesList', 'GET', data)
        },
        GetWechatSetting: function (data) {
            return apiService('Wechat', 'GetWechatSetting', 'GET', data)
        },
        GetActivityPrivilegeList: function (data) {
            return apiService('Wechat', 'GetActivityPrivilegeList', 'GET', data)
        },
        GetTicket: function (data) {
            return apiService('Wechat', 'GetTicket', 'POST', data)
        },
        GetPrivilegeByMemberId: function (data) {
            return apiService('Wechat', 'GetPrivilegeByMemberId', 'GET', data)
        },
        GetCanTakeTicketCount: function (data) {
            return apiService('Wechat', 'GetCanTakeTicketCount', 'GET', data)
        },
        GetWeixinJsConfig: function (data) {
            return apiService('Wechat', 'GetWeixinJsConfig', 'POST', data)
        },
        GetMachineLocations: function (data) {
            return apiService('Wechat', 'GetMachineLocations', 'POST', data)
        },
        GetNoneExpirePrivilegeByMemberId: function (data) {
            return apiService('Wechat', 'GetNoneExpirePrivilegeByMemberId', 'POST', data)
        }
    },
    MachineCabinet: {
        GetData: function (data) {
          return apiService('MachineCabinet', 'GetData', 'GET', data)
        },
        PostData: function (data) {
            return apiService('MachineCabinet', 'PostData', 'POST', data)
        },
        PutData: function (data) {
            return apiService('MachineCabinet', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
            return apiService('MachineCabinet', 'DeleteData', 'DELETE', data)
        }
    },
    CabinetConfig: {
        GetCabinetByMachineId: function (data) {
          return apiService('CabinetConfig', 'GetCabinetByMachineId', 'GET', data)
        }
    },
    Refund: {
        PostRefund: function (data) {
          return apiService('Refund', 'PostRefund', 'POST', data)
        }
    },
    TotalMoney: {
        GetData: function (data) {
          return apiService('TotalMoney', 'GetData', 'GET', data)
        }
    },
    Home: {
        GetTotalMachineCount: function (data) {
          return apiService('Home', 'GetTotalMachineCount', 'GET', data)
        },
        GetSalesAmountByMachine: function (data) {
          return apiService('Home', 'GetSalesAmountByMachine', 'GET', data)
        },
        GetPayNumbers: function (data) {
          return apiService('Home', 'GetPayNumbers', 'GET', data)
        },
        GetPayNumbersByDate: function (data) {
          return apiService('Home', 'GetPayNumbersByDate', 'GET', data)
        },
        GetGroupSalesMoney: function (data) {
          return apiService('Home', 'GetGroupSalesMoney', 'GET', data)
        },
        GetGroupProduct: function (data) {
          return apiService('Home', 'GetGroupProduct', 'GET', data)
        },
        GetGroupMoneyByMachine: function (data) {
          return apiService('Home', 'GetGroupMoneyByMachine', 'GET', data)
        }
    },
    PayConfig: {
        GetData: function (data) {
          return apiService('PayConfig', 'GetData', 'GET', data)
        },
        PostData: function (data) {
          return apiService('PayConfig', 'PostData', 'POST', data)
        },
        PutData: function (data) {
          return apiService('PayConfig', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
          return apiService('PayConfig', 'DeleteData', 'DELETE', data)
        }
    },
    MachineOperation: {
        GetMachines: function (data) {
          return apiService('MachineOperation', 'GetMachines', 'GET', data)
        },
        CopyOneMachine: function (data) {
            return apiService('MachineOperation', 'CopyOneMachine', 'POST', data)
          }
    },
    Resource: {
        GetData: function (data) {
          return apiService('Resource', 'GetData', 'GET', data)
        },
        PostData: function (data) {
          return apiService('Resource', 'PostData', 'POST', data)
        },
        PutData: function (data) {
          return apiService('Resource', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
          return apiService('Resource', 'DeleteData', 'DELETE', data)
        }
    },
    Ad: {
        GetData: function (data) {
          return apiService('Ad', 'GetData', 'GET', data)
        },
        PostData: function (data) {
          return apiService('Ad', 'PostData', 'POST', data)
        },
        PutData: function (data) {
          return apiService('Ad', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
          return apiService('Ad', 'DeleteData', 'DELETE', data)
        },
        GetRelationByIdAndType: function (data) {
          return apiService('Ad', 'GetRelationByIdAndType', 'GET', data)
        }
    },
    WebSetting: {
        GetData: function (data) {
          return apiService('WebSetting', 'GetData', 'GET', data)
        },
        CreateWebInfo: function (data) {
          return apiService('WebSetting', 'CreateWebInfo', 'POST', data)
        }
    },
    Privilege: {
        GetData: function (data) {
          return apiService('Privilege', 'GetData', 'GET', data)
        },
        PostData: function (data) {
          return apiService('Privilege', 'PostData', 'POST', data)
        },
        PutData: function (data) {
          return apiService('Privilege', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
          return apiService('Privilege', 'DeleteData', 'DELETE', data)
        }
    },
    Member: {
        GetData: function (data) {
          return apiService('Member', 'GetData', 'GET', data)
        },
        GivePrivilegeTicket: function (data) {
          return apiService('Member', 'GivePrivilegeTicket', 'POST', data)
        },
        GetPrivilegeByMemberId: function (data) {
          return apiService('Member', 'GetPrivilegeByMemberId', 'POST', data)
        }
    },
    Activity: {
        GetData: function (data) {
          return apiService('Activity', 'GetData', 'GET', data)
        },
        PostData: function (data) {
          return apiService('Activity', 'PostData', 'POST', data)
        },
        PutData: function (data) {
          return apiService('Activity', 'PutData', 'PUT', data)
        },
        DeleteData: function (data) {
          return apiService('Activity', 'DeleteData', 'DELETE', data)
        },
        GetActivityRelationById: function (data) {
          return apiService('Activity', 'GetActivityRelationById', 'GET', data)
        }
    }
    
}
 
export default api

