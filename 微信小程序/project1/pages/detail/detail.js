// pages/detail/detail.js

var app = getApp()
var fileUrl = app.globalData.fileUrl
Page({
  data:{
    loadingHidden:false,
    fileUrl: fileUrl,
    audioUrl: app.globalData.audioUrl,
    islike:''
  },
  onLoad:function(options){
    var that = this;
    // 页面初始化 options为页面跳转所带来的参数
    //判断显示是否已关注
    wx.request({
    url: app.globalData.islikeUrl,
      data: {
      openid: app.globalData.openid,
      userid: options.id
    },
    method: 'GET',
      success: function (res) {
        // success
        console.log(res)
        if (res.data == 1) {
          that.setData({
            islike: '已关注'
          })

        } else {
          that.setData({
            islike: '关注',
          })
        }
      },
  })
    //页面信息显示
    wx.request({
      url: app.globalData.audioUrl,
      data: {
        authorid:options.id
      },
      method: 'GET', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
      // header: {}, // 设置请求的 header
      success: function(res){
        // success
        // console.log(res.data)
        that.setData({
          albummes:res.data[0],
          headimg: fileUrl + res.data[0].image,
          audioList: res.data,
          // detail:res.data.data.detail,
        });
        setTimeout(function () {
                    that.setData({
                        loadingHidden: true
                    })
                }, 1500)
      },
      fail: function() {
        // fail
      },
      complete: function() {
        // complete
      }
    });
  },
  //页面跳转，开始播放
  doplay: function(e){
    wx.setStorage({
      key: "audioid",
      data: e.currentTarget.dataset.key
    })
    // app.globalData.audioid = e.currentTarget.dataset.key
    wx.switchTab({
      url: '../play/play',
    })
  },
  //关注功能
  like: function (e) {
    var that = this;
    wx.request({
      url: app.globalData.addfollowUrl,
      data: {
        openid: app.globalData.openid,
        userid: e.currentTarget.dataset.key
      },
      method: 'GET',
      success: function (res) {
        // success 
        that.setData({
        islike: '已关注'
      })
      },
    })
  }, 
  onReady:function(){
    // 页面渲染完成
  },
  onShow:function(){
    // 页面显示
  },
  onHide:function(){
    // 页面隐藏
  },
  onUnload:function(){
    // 页面关闭
  }
})