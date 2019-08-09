// pages/detail/detail.js
var app = getApp()
var fileUrl = app.globalData.fileUrl
var that;
var isPlay;
var audioContext;
var animationContext;
const innerAudioContext = wx.createInnerAudioContext()
innerAudioContext.autoplay = true
var n;
var timer;
var obj = require('../../utils/tools.js')
var i = 0;

Page({
  data: {
    percent: 0,
    fileUrl: fileUrl,
    playOrPause: '../../image/pause.png',
    animationData: {}, 
    audiosrc:''
  },
  onLoad: function () {
    var that = this;
    var audioid = wx.getStorageSync('audioid')
    // 页面初始化 options为页面跳转所带来的参数
    isPlay = true;
    n = 0;
    that = this;
    animationContext = obj.playMusic(animationContext)
    audioContext = wx.createAudioContext('myMusic')

    clearInterval(timer);
    //audio
    wx.request({
      url: app.globalData.playUrl,
      data: {
        audioid: audioid
        // audioid:'10021'
      },
      method: 'GET',
      success: function (res) {
        // success
        wx.downloadFile({
          url: fileUrl + res.data[0].audioUrl,
          success (res) {
            wx.playVoice({
              filePath: res.tempFilePath,
            })
          }
        })
        
        // innerAudioContext.src = fileUrl + res.data[0].audioUrl
        that.setData({
          audiomes: res.data[0],
          headimg: fileUrl + res.data[0].image,
          // audiosrc: fileUrl + res.data[0].audioUrl,
        })
      }
    })
  },
  timeUpdate: function (e) {
    var that = this;
    var mypercent = e.detail.currentTime / e.detail.duration * 100;
    that.setData({
      percent: mypercent
    })
  },
  rotate: function () {
    var that = this;
    animationContext.rotate(1 * n++);
    animationContext.step();
    that.setData({
      animationData: animationContext.export()
    })
  },
  play: function () {
    //暂停
    var that = this;
    if (isPlay) {
      // audioContext.pause();
      innerAudioContext.pause();
      that.setData({
        playOrPause: '../../image/play.png'
      })
      isPlay = false;
      clearInterval(timer);
      timer = null;
    } else {
      //播放
      // audioContext.play();

      innerAudioContext.play();
      that.setData({
        playOrPause: '../../image/pause.png'
      })
      timer = setInterval(function () {
        that.rotate();
      }, 50)
      isPlay = true;
    }
  },
  onReady: function () {
    // 页面渲染完成
    
  },
  onShow: function () {
    // 页面显示
    var that = this;
    // var audioid = app.globalData.audioid
    var audioid = wx.getStorageSync('audioid')
    // 页面初始化 options为页面跳转所带来的参数
    isPlay = true;
    n = 0;
    that = this;
    animationContext = obj.playMusic(animationContext)
    audioContext = wx.createAudioContext('myMusic')

    clearInterval(timer);
    //audio
    wx.request({
      url: app.globalData.playUrl,
      data: {
        audioid: audioid
        // audioid:'10021'
      },
      method: 'GET',
      success: function (res) {
        // success
        // console.log(res)
        innerAudioContext.src = fileUrl + res.data[0].audioUrl

      //   wx.downloadFile({
      //   url: fileUrl + res.data[0].audioUrl,
      //     success(res) {
      //     wx.playVoice({
      //       filePath: res.tempFilePath,
      //     })
      //   }
      // })
        that.setData({
          audiomes: res.data[0],
          headimg: fileUrl + res.data[0].image,
          // audiosrc: fileUrl + res.data[0].audioUrl,
        })
      }
    })
    // app.globalData.audioid = 0
  },
  onHide: function () {
    // 页面隐藏
    
  },
  onUnload: function () {
    // 页面关闭
    var audioid = wx.getStorageSync('audioid')
    wx.setStorage({
      key: "audioid",
      data: audioid
    })
  }
})