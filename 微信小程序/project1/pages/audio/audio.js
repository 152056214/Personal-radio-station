   //audio.js
//获取应用实例
var app = getApp()
var util = require("../../utils/convert.js");

const recorderManager = wx.getRecorderManager()
const innerAudioContext = wx.createInnerAudioContext()
innerAudioContext.autoplay = true
const options = {
  duration: 6000,
  sampleRate: 44100,
  numberOfChannels: 1,
  encodeBitRate: 192000,
  format: 'mp3',
  frameSize: 50
}

var obj = require('../../utils/util.js')

Page({
  data: {
    j: 1,//帧动画初始图片
    voices: [],//音频数组
  },
  onLoad: function () {
    var _this = this;
    //获取列表
    wx.getSavedFileList({
      success: function (res) {
        var voices = [];
        for (var i = 0; i < res.fileList.length; i++) {
          //将音频大小B转为KB
          var createTime = util.js_date_time(res.fileList[i].createTime);
          //将音频大小B转为KB
          var size = (res.fileList[i].size / 1024).toFixed(2);
          var voice = { filePath: res.fileList[i].filePath, createTime: createTime, size: size };
          voices = voices.concat(voice);
        }
        _this.setData({
          voices: voices
        })
      }
    })
    recorderManager.onStart(() => {
      console.log('recorder start')
    })
    recorderManager.onPause(() => {
      console.log('recorder pause')
    })
    innerAudioContext.onPlay(() => {
      console.log('开始播放')
    })
    innerAudioContext.onError((res) => {
      console.log(res.errMsg)
      console.log(res.errCode)
    })
    recorderManager.onStop((res) => {
      console.log('recorder stop', res)
      const { tempFilePath } = res
      wx.saveFile({
        tempFilePath: tempFilePath,
        success: function (res) {
          //持久路径
          //本地文件存储的大小限制为 100M
          console.log("savedFilePath: " + res.savedFilePath)
        }
      })
      wx.getSavedFileList({
        success: function (res) {
          var voices = [];
          for (var i = 0; i < res.fileList.length; i++) {
            //将音频大小B转为KB
            var createTime = util.js_date_time(res.fileList[i].createTime);
            //将音频大小B转为KB
            var size = (res.fileList[i].size / 1024).toFixed(2);
            var voice = { filePath: res.fileList[i].filePath, createTime: createTime, size: size };
            voices = voices.concat(voice);
          }
          _this.setData({
            voices: voices
          })
        }
      })
    })
  }, 
  //手指按下
  kaishi: function () {
    //开始录音
    recorderManager.start(options)
    // var _this = this;
    //   success: function (res) {
    //     //临时路径,下次进入小程序时无法正常使用
    //     var tempFilePath = res.tempFilePath
    //     console.log("tempFilePath: " + res.tempFilePath)
    //     //持久保存
    //     wx.saveFile({
    //       tempFilePath: tempFilePath,
    //       success: function (res) {
    //         //持久路径
    //         //本地文件存储的大小限制为 100M
    //         console.log("savedFilePath: " + res.savedFilePath)
    //       }
    //     })
    //     //获取录音音频列表
    //     wx.getSavedFileList({
    //       success: function (res) {
    //         var voices = [];
    //         for (var i = 0; i < res.fileList.length; i++) {
    //           //将音频大小B转为KB
    //           var createTime = util.js_date_time(res.fileList[i].createTime);
    //           //将音频大小B转为KB
    //           var size = (res.fileList[i].size / 1024).toFixed(2);
    //           var voice = { filePath: res.fileList[i].filePath, createTime:  createTime, size: size };
    //           voices = voices.concat(voice);
    //         }
    //         _this.setData({
    //           voices: voices
    //         })
    //       }
    //     })

    //     wx.getStorage({
    //       key: 'key',
    //       success: function (res) { console.log("key: " + res.data) },
    //     })
    //   },
    // })
    console.log("开始录音")
    // console.log("new date : " + new Date)
  },
  //手指抬起
//   tingzhi: function () {
//     var _this = this;
//     // recorderManager.stop()
//     wx.stopRecord()
//     console.log("录音结束")
//     wx.navigateTo({
//       url: 'audio',
//     })
//     //停止录音
//     //获取列表
//     wx.getSavedFileList({
//       success: function (res) {
//         var voices = [];
//         for (var i = 0; i < res.fileList.length; i++) {
//           //将音频大小B转为KB
//           var createTime = util.js_date_time(res.fileList[i].createTime);
//           //将音频大小B转为KB
//           var size = (res.fileList[i].size / 1024).toFixed(2);
//           var voice = { filePath: res.fileList[i].filePath, createTime: createTime, size: size };
//           voices = voices.concat(voice);
//         }
//         _this.setData({
//           voices: voices
//         })
//       }
//   })
// },
  gotoPlay: function (e) {
  var filePath = e.currentTarget.dataset.key;
    console.log(filePath)
  //点击开始播放
    innerAudioContext.src = filePath
  // wx.playVoice({
  //   filePath: filePath,
  //   success: function () {
  //   }
  // })
},
upload: function (e) {
  var filePath = e.currentTarget.dataset.key;
    wx.uploadFile({
      url: app.globalData.uploadUrl,
      filePath: filePath,
      name: 'file',
      formData: {
        'user': 'test'
      },
      success: function (res) {
        var data = res.data
        // console.log(data)
        wx.setStorage({
          key: "filename",
          data: res.data
        })
        wx.redirectTo({
          url: '../settitle/settitle'
        })
        // wx.navigateTo({
        //   url:'../settitle/settitle?road=res.data'
        // })
        // wx.showModal({
        //   title: '上传文件返回状态',
        //   content: '成功',
        //   success: function (res) {
        //     if (res.confirm) {
        //       console.log('用户点击确定')
        //     }
        //   }
        // })                          //do something
      },
    fail: function (res) {
      console.log(res)
    }
  })
},
remove: function (e) {
  var _this = this;
  //获取列表
    wx.getSavedFileList({
      success(res) {
        //删除文件
        wx.removeSavedFile({
          filePath: e.currentTarget.dataset.key,
          complete(e) {
          }
        })
        //获取列表
        wx.getSavedFileList({
          success: function (e) {
            var voices = [];
            for (var i = 0; i < e.fileList.length; i++) {
              //将音频大小B转为KB
              var createTime = util.js_date_time(e.fileList[i].createTime);
              //将音频大小B转为KB
              var size = (e.fileList[i].size / 1024).toFixed(2);
              var voice = { filePath: e.fileList[i].filePath, createTime: createTime, size: size };
              voices = voices.concat(voice);
            }
            _this.setData({
              voices: voices
            })
          }
        })
      }
    })
  }
})
