var app = getApp()

Page({
  data: {
    loadingHidden: false,
    fileUrl: app.globalData.fileUrl
  },
  onLoad: function (options) {
    
  },
  onShow: function (options) {
    var that = this;
    wx.request({
      url: app.globalData.followUrl,
      data: {
        openid: app.globalData.openid
      },
      method: 'GET',
      success: function (res) {
        // success
        // console.log(res.data[0])
        that.setData({
          guess: res.data[0],
        })
      },
      fail: function () {
        // fail
        that.setData({
        })
      },
      complete: function () {
        // complete
      }
    })
  },
  unlike: function (e) {
    var that = this;
    wx.request({
      url: app.globalData.cancelfollowUrl,
      data: {
        openid: app.globalData.openid,
        userid: e.currentTarget.dataset.key
      },
      method: 'GET', 
      success: function (res) {
        // success
        wx.request({
          url: app.globalData.followUrl,
          data: {
            openid: app.globalData.openid
          },
          method: 'GET',
          success: function (res) {
            // success
            console.log(res.data[0])
            that.setData({
              guess: res.data[0],
            })
          },
        })
      },
    })
  }, 
  onPullDownRefresh() {
    // 上拉刷新
    var that = this;
    wx.request({
      url: app.globalData.followUrl,
      data: {
        openid: app.globalData.openid
      },
      method: 'GET',
      success: function (res) {
        // success
        console.log(res.data[0])
        that.setData({
          guess: res.data[0],
        })
      },
      fail: function () {
        // fail
        that.setData({
        })
      },
      complete: function () {
        // complete
      }
    })
  },
})