//app.js
// var localhost = '192.168.1.113'
// var localhost = '192.168.43.44'
var localhost = 'localhost'
const APP_ID ='wxc28aa3218c79e8f6'
const APP_SECRET ='8dba7a037c458a8e80f776f67339369b'
var openid = 'aaa'
App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    wx.login({
      success: res => {
        wx.request({
          url: 'https://api.weixin.qq.com/sns/jscode2session',
          data: {
            appid: APP_ID,
            secret: APP_SECRET,
            js_code: res.code,
            grant_type: 'authorization_code'
          },
          method: 'GET',
          success: res => {
            this.globalData.openid = res.data.openid
          }
        })
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
      }
    })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              // 可以将 res 发送给后台解码出 unionId
              this.globalData.userInfo = res.userInfo

              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  globalData: {
    userInfo: null,
    fileUrl: 'http://' + localhost +':8080/ab/upload/',
    userUrl: 'http://' + localhost + ':8080/ab/ad',
    followUrl: 'http://' + localhost + ':8080/ab/follow',
    audioUrl: 'http://' + localhost +':8080/Demo01/servlet02',
    playUrl: 'http://' + localhost +':8080/Demo01/Servlet01',
    uploadUrl: 'http://' + localhost + ':8080/ab/upload2',
    createidUrl: 'http://' + localhost + ':8080/Demo01/CreteID',
    getidUrl: 'http://' + localhost + ':8080/Demo01/GetId',
    adduserUrl: 'http://' + localhost + ':8080/ab/AddUser',
    addimageUrl: 'http://' + localhost + ':8080/ab/AddImage',
    addaudioUrl: 'http://' + localhost + ':8080/ab/AddAudio',
    cancelfollowUrl: 'http://' + localhost + ':8080/ab/CancelFollow',
    addfollowUrl: 'http://' + localhost + ':8080/ab/AddFollow',
    islikeUrl: 'http://' + localhost + ':8080/ab/IsExist',
    openid: openid,
    audioid:0
  }
})