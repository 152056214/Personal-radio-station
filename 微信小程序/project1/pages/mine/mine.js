var app = getApp()
var fileUrl = app.globalData.fileUrl
Page({
  data: {
    fileUrl:fileUrl
  },
  onPullDownRefresh() {
    // 上拉刷新
    var that = this;
    wx.request({
      url: app.globalData.getidUrl,
      data: {
        //使用openid获取id
        openid: app.globalData.openid
      },
      method: 'GET',
      success: function (e) {
        //使用id获取用户的文件列表
        wx.request({
          url: app.globalData.audioUrl,
          data: {
            authorid: e.data
          },
          method: 'GET',
          success: function (res) {
            that.setData({
              mylist: res.data,
              headimg: fileUrl + res.data[0].image,
            })
            console.log(res.data)
          },
          fail: function () {
            // fail
          },
          complete: function () {
            // complete 
            wx.stopPullDownRefresh()
          }
        })
      }
    })
  },
  doplay: function (e) {
    wx.setStorage({
      key: "audioid",
      data: e.currentTarget.dataset.key
    })
    // app.globalData.audioid = e.currentTarget.dataset.key
    wx.switchTab({
      url: '../play/play',
    })
  },
  onLoad() {
    createid()
    var that = this;
    wx.request({
      url: app.globalData.getidUrl,
      data: {
        //使用openid获取id
        openid: app.globalData.openid
      },
      method: 'GET',
      success: function (e) {
        //使用id获取用户的文件列表
        wx.request({
          url: app.globalData.audioUrl,
          data: {
            authorid: e.data
          },
          method: 'GET',
          success: function (res) {
            that.setData({
              mylist: res.data,
              headimg: fileUrl + res.data[0].image,
            })
            console.log(res.data)
          },
          fail: function () {
            // fail
          },
        })
      }
    })
    
  }
})
function createid() {
  wx.request({
    url: app.globalData.createidUrl,
    data: {
      openid: app.globalData.openid
    },
    method: 'GET',
    success: function (e) {
    }
  })
}
