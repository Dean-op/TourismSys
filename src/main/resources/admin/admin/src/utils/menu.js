const menu = {
  list() {
    return [
      {
        backMenu: [
          {
            child: [
              {
                appFrontIcon: "cuIcon-attentionfavor",
                buttons: ["新增", "查看", "修改", "删除"],
                menu: "用户",
                menuJump: "列表",
                tableName: "users",
              },
              {
                appFrontIcon: "cuIcon-attentionfavor",
                buttons: ["新增", "查看", "修改", "删除", "审核"],
                menu: "商家",
                menuJump: "列表",
                tableName: "merchant",
              },
            ],
            menu: "用户管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-goodsnew",
                buttons: ["新增", "查看", "修改", "删除"],
                menu: "天气预报",
                menuJump: "列表",
                tableName: "weather",
              },
            ],
            menu: "天气预报管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-time",
                buttons: ["新增", "查看", "修改", "删除", "查看评论"],
                menu: "景点信息",
                menuJump: "列表",
                tableName: "scenicinfo",
              },
            ],
            menu: "景点信息管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-newshot",
                buttons: ["查看", "删除"],
                menu: "门票预订",
                menuJump: "列表",
                tableName: "ticketreserve",
              },
            ],
            menu: "门票预订管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-attentionfavor",
                buttons: ["新增", "查看", "修改", "删除", "查看评论"],
                menu: "酒店信息",
                menuJump: "列表",
                tableName: "hotelinfo",
              },
            ],
            menu: "酒店信息管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-keyboard",
                buttons: ["查看", "删除"],
                menu: "酒店预订",
                menuJump: "列表",
                tableName: "hotelreserve",
              },
            ],
            menu: "酒店预订管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-wenzi",
                buttons: ["新增", "查看", "修改", "删除", "查看评论"],
                menu: "餐厅信息",
                menuJump: "列表",
                tableName: "restaurantinfo",
              },
            ],
            menu: "餐厅信息管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-taxi",
                buttons: ["查看", "删除"],
                menu: "餐厅预约",
                menuJump: "列表",
                tableName: "restaurantreserve",
              },
            ],
            menu: "餐厅预约管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-camera",
                buttons: ["新增", "查看", "修改", "删除", "查看评论"],
                menu: "路线",
                menuJump: "列表",
                tableName: "trafficroute",
              },
            ],
            menu: "路线管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-phone",
                buttons: ["查看", "新增", "修改", "删除", "查看评论"],
                menu: "旅游攻略",
                menuJump: "列表",
                tableName: "travelguide",
              },
            ],
            menu: "旅游攻略管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-attentionfavor",
                buttons: ["新增", "查看", "修改", "删除"],
                menu: "导游",
                menuJump: "列表",
                tableName: "guide",
              },
              {
                appFrontIcon: "cuIcon-newshot",
                buttons: ["新增", "查看", "修改", "删除"],
                menu: "导游预约",
                menuJump: "列表",
                tableName: "guideorder",
              },
            ],
            menu: "导游管理",
          },
          // {
          //   child: [
          //     {
          //       appFrontIcon: "cuIcon-addressbook",
          //       buttons: ["查看", "删除"],
          //       menu: "旅游规划",
          //       menuJump: "列表",
          //       tableName: "tourplan",
          //     },
          //   ],
          //   menu: "旅游规划管理",
          // },
          {
            child: [
              {
                appFrontIcon: "cuIcon-time",
                buttons: ["查看", "修改", "删除"],
                menu: "轮播图管理",
                tableName: "config",
              },
              {
                appFrontIcon: "cuIcon-dictionary",
                buttons: ["新增", "查看", "修改", "删除"],
                menu: "字典",
                tableName: "dictionary",
              },
              {
                appFrontIcon: "cuIcon-news",
                buttons: ["新增", "查看", "修改", "删除"],
                menu: "公告信息",
                tableName: "news",
              },
            ],
            menu: "系统管理",
          },
        ],
        frontMenu: [

        ],
        hasBackLogin: "是",
        hasBackRegister: "否",
        hasFrontLogin: "否",
        hasFrontRegister: "否",
        roleName: "管理员",
        tableName: "admin",
      },
      {
        backMenu: [
          {
            child: [
              {
                appFrontIcon: "cuIcon-attentionfavor",
                buttons: ["查看", "修改"],
                menu: "个人资料",
                tableName: "guide",
              },
            ],
            menu: "资料管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-newshot",
                buttons: ["查看", "确认", "拒绝", "完成"],
                menu: "预约管理",
                tableName: "guideorder",
              },
            ],
            menu: "订单管理",
          },
        ],
        hasBackLogin: "是",
        hasBackRegister: "否",
        hasFrontLogin: "否",
        hasFrontRegister: "否",
        roleName: "导游",
        tableName: "guide",
      },
      {
        backMenu: [
          {
            child: [
              {
                appFrontIcon: "cuIcon-attentionfavor",
                buttons: ["查看", "修改"],
                menu: "个人资料",
                tableName: "merchant",
              },
            ],
            menu: "资料管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-time",
                buttons: ["新增", "查看", "修改", "删除", "查看评论"],
                menu: "景点信息",
                tableName: "scenicinfo",
              },
              {
                appFrontIcon: "cuIcon-attentionfavor",
                buttons: ["新增", "查看", "修改", "删除", "查看评论"],
                menu: "酒店信息",
                tableName: "hotelinfo",
              },
              {
                appFrontIcon: "cuIcon-wenzi",
                buttons: ["新增", "查看", "修改", "删除", "查看评论"],
                menu: "餐厅信息",
                tableName: "restaurantinfo",
              },
            ],
            menu: "资源管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-newshot",
                buttons: ["查看", "审核", "删除"],
                menu: "门票预订",
                tableName: "ticketreserve",
              },
              {
                appFrontIcon: "cuIcon-keyboard",
                buttons: ["查看", "审核", "删除"],
                menu: "酒店预订",
                tableName: "hotelreserve",
              },
              {
                appFrontIcon: "cuIcon-taxi",
                buttons: ["查看", "审核", "删除"],
                menu: "餐厅预约",
                tableName: "restaurantreserve",
              },
            ],
            menu: "订单管理",
          },
          {
            child: [
              {
                appFrontIcon: "cuIcon-comment",
                buttons: ["查看", "修改", "删除"],
                menu: "景点评论",
                tableName: "discussscenicinfo",
              },
              {
                appFrontIcon: "cuIcon-comment",
                buttons: ["查看", "修改", "删除"],
                menu: "酒店评论",
                tableName: "discusshotelinfo",
              },
              {
                appFrontIcon: "cuIcon-comment",
                buttons: ["查看", "修改", "删除"],
                menu: "餐厅评论",
                tableName: "discussrestaurantinfo",
              },
            ],
            menu: "评论管理",
          },
        ],
        hasBackLogin: "是",
        hasBackRegister: "是",
        hasFrontLogin: "否",
        hasFrontRegister: "否",
        roleName: "商家",
        tableName: "merchant",
      },
    ];
  },
};
export default menu;
