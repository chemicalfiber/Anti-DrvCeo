# 卸载驱动总裁捆绑

卸载“驱动总裁”无法通过配置文件取消安装的捆绑。

### 文件说明：

| 文件              | 说明                                                         |
| :---------------- | ------------------------------------------------------------ |
| un.bat            | 用于卸载“驱动总裁”1.0版本的批处理文件                        |
| unNew.bat         | 用于卸载“驱动总裁”2.0版本的批处理文件                        |
| Anti-DrvCeo.au3   | 用于卸载“驱动总裁”2.0版本的AutoIt脚本源码                    |
| Anti-DrvCeo.exe   | 根据Anti-DrvCeo.au3编译后的，无需AutoIt环境即可执行的32位应用程序 |
| Anti-DrvCeo64.exe | 根据Anti-DrvCeo.au3编译后的，无需AutoIt环境即可执行的64位应用程序 |



### 开始使用：
#### 直接使用BAT脚本或编译的exe：

<details><summary>观看教程视频：</summary>
<p>un.bat：适用于卸载驱动总裁1.0<br/>
  <a href="https://www.acfun.cn/v/ac23442419" target="_blank">AcFun</a><br/>
  <a href="https://www.bilibili.com/video/BV1dT4y1P7mt" target="_blank">bilibili</a><br/>
  <a href="https://youtu.be/-8A9fIsQcn8" target="_blank">YouTube</a><br/>
 </p>
<p>unNew.bat：适用于卸载驱动总裁2.0<br/>
  <a href="https://www.acfun.cn/v/ac24542327" target="_blank">AcFun</a><br/>
  <a href="https://www.bilibili.com/video/BV1Zp4y1p799" target="_blank">bilibili</a><br/>
  <a href="https://youtu.be/caQ4b0IaQz8" target="_blank">YouTube</a><br/>
 </p>
 <p>Anti-DrvCeo：适用于卸载驱动总裁2.0（推荐）<br/>
  <a href="https://www.acfun.cn/v/ac25816011" target="_blank">AcFun</a><br/>
  <a href="https://www.bilibili.com/video/BV1eA411M7Sc/" target="_blank">bilibili</a><br/>
 <a href="https://youtu.be/-yOln8KjtFE" target="_blank">YouTube</a><br/>
 </p>
</details>


>1、下载对应的文件<br/>
>2、将文件放在能被访问到的地方<br/>
>3、在封装工具的「计划任务」“部署中”“部署后”或“进桌面”时机调用相应文件<br/>
>4、按照正常流程封装Windows

#### 您手动编译脚本为exe：
源码中的脚本均为UTF-8编码，换行分隔符为LF。
如果您想手动编译脚本为exe可执行程序，推荐先在Visual Studio Code中更改编码方式为GB 2312，换行分隔符为CRLF，再进行编译。

### TODO：

- [ ] 优化AutoIt脚本查找文件的算法
- [ ] 优化AutoIt脚本查找注册表的算法



## 一切开发旨在学习，请勿用于非法用途

