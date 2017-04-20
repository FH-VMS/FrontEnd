/**
 * 本文件的作用就是直观呈现 整个应用状态结构树 及其 初始值
 */
export default {
  /* 用户 session */
  userData: null,

  /* 留言板模块（按需加载） */
  msg: {
    msgs: [],           // 当前显示的留言列表
    displayControl: {   // 查询条件
      pageIdx: 1,         // 默认是第 10 页
      quantity: 10,       // 默认每页显示 10 条记录
      authorSpecified: '' // 是否有指定发布者
    }
  },

  /* 待办事项模块（按需加载） */
  todos: [
    // {
    //   id: 123,
    //   content: '待办事项1',
    //   completed: false,
    //   createdAt: 1473499991348
    // }
  ],
  frames: {
    menuList: [ {
        key: 'commonmember',
        name: '用户工作台',
        icon: 'home',
        child: [
            {
               key: 'user',
               name: '用户'
            },
            {
               key: 'review',
               name: '总览'
            },
            {
               key: 'order',
               name: '我的订单'
            },
            {
               key: 'message',
               name: '我的留言'
            },
            {
               key: 'membercenter',
               name: '用户中心'
            }
        ]
    },
    {
        key: 'busimember',
        name: '服务商工作台',
        icon: 'home',
        child: [
             {
                key: 'service_add',
                name: '服务添加'
            },
            {
                key: 'waiting_handle',
                name: '待处理服务'
            },
            {
                key: 'upload_service',
                name: '已上架服务'
            },
            {
                key: 'order_manage',
                name: '订单管理'
            },
            {
                key: 'busi_message',
                name: '留言管理'
            },
            {
                key: 'busi_center',
                name: '服务商中心'
            }
        ]
    }],           // 当前显示的留言列表
    displayControl: {   // 查询条件
      pageIdx: 1,         // 默认是第 10 页
      quantity: 10,       // 默认每页显示 10 条记录
      authorSpecified: '' // 是否有指定发布者
    },
    liked: true
  },
  user: {
      list: [{ id: 9}],
      success: '成功了'
  }
}
