let app = getApp();
var filename = wx.getStorageSync('filename');
Page({
  data: {
    album: ""
  },
  onLoad: function () {

    console.log(filename)
  },
  formSubmit: function (e) {
    console.log('form发生了submit事件，携带数据为：', e.detail.value);
    wx.request({
      url: app.globalData.addaudioUrl,
      data: {
        openid: app.globalData.openid,
        title: e.detail.value.title,
        filename: filename
      },
      method: 'GET',
      success: function (res) {
        // success
      }
    })

  },
  formReset: function () {
    console.log('form发生了reset事件')

  }
})