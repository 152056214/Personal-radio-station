let app = getApp();
Page({
  data: {
    album:""
  },
  formSubmit: function (e) {
    console.log('form发生了submit事件，携带数据为：', e.detail.value);
    wx.request({
      url: app.globalData.adduserUrl,
      data: {
        openid:app.globalData.openid,
        name: e.detail.value.name,
        album:e.detail.value.album,
        category:e.detail.value.category
      },
      method: 'GET',
      success: function (res) {
        // success
      }
    })
    
  },
  formReset: function () {
    console.log('form发生了reset事件')

  },
  tupian: function () {
    //添加Banner  
    var that = this;

    wx.chooseImage({
      count: 3,  //最多可以选择的图片总数  
      sizeType: ['compressed'], // 可以指定是原图还是压缩图，默认二者都有  
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
      success: function (res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片  
        var tempFilePaths = res.tempFilePaths;

        var uploadImgCount = 0;
        for (var i = 0, h = tempFilePaths.length; i < h; i++) {
          wx.uploadFile({
            url: app.globalData.uploadUrl,
            filePath: tempFilePaths[i],
            name: 'uploadfile_ant',
            formData: {
              'imgIndex': i
            },
            header: {
              "Content-Type": "multipart/form-data"
            },
            success: function (res) {
              wx.request({
                url: app.globalData.addimageUrl,
                data: {
                  openid: app.globalData.openid,
                  image: res.data
                },
                method: 'GET',
                success: function (res) {
                  // success
                }
              })
            },
          });
        }
      }
    });
  }
})