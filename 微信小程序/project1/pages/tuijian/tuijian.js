var app = getApp()

Page({
  data: {
    imgUrls: [
      'https://images.unsplash.com/photo-1551334787-21e6bd3ab135?w=640',
      'https://images.unsplash.com/photo-1551214012-84f95e060dee?w=640',
      'https://images.unsplash.com/photo-1551446591-142875a901a1?w=640'
    ], 
    fileUrl: app.globalData.fileUrl,
    indicatorDots: true,
    autoplay: true,
    interval: 3000,                                                                                                                                                                                                                                           
    duration: 1000,
    circular: true,
    loadingHidden: false
  },
  
  onReady: function (e) {
    // 使用 wx.createAudioContext 获取 audio 上下文 context
  }, 
  onPullDownRefresh() {
    // 上拉刷新
    var that = this;
    wx.request({
      url: app.globalData.userUrl,
      data: {},
      method: 'GET',
      success: function (res) {
        // success
        that.setData({
          audios: res.data[0],
        })
      },
      fail: function () {
        // fail
        that.setData({
        })
      },
      complete: function () {
        // complete 
        wx.stopPullDownRefresh()
      }
    })
  },
  onLoad: function (options) {
    // 页面初始化 options为页面跳转所带来的参数
    var that = this;
    wx.request({
      url: app.globalData.userUrl,
      data: {},
      method: 'GET',
      success: function (res) {
        // success
        that.setData({
          audios: res.data[0],
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
  }
})