<div align="center">

<img src="https://raw.githubusercontent.com/Lrht-llw/Vue-xun_My_music/refs/heads/master/screenshots/1755518898514.jpg" alt="Logo" width="80" height="80">

</div>

# ⚠️重要说明
  - libs文件夹下的文件可以通过解压软件解压-并没有夹带私货（病毒）
  - 这是一个智能微信聊天机器人。通过wxautox_wechatbot收发微信消息，调用deepseek、gpt、gemini等大语言模型生成回复消息。
  - 原项目仓库：https://github.com/KouriChat/KouriChat
  - 本项目由Lrht-llw在原项目基础上修改创建。
  - 本机器人致力于实现更加拟人化聊天效果，支持多种功能。

# 🌟效果展示

<details>
<summary>展开查看</summary>
<pre><code>
<img src="https://raw.githubusercontent.com/Lrht-llw/WeChatBot_Revival-Edition/refs/heads/main/Demo_Image/1.png" alt="示例图片1" width="900px">
<img src="https://raw.githubusercontent.com/Lrht-llw/WeChatBot_Revival-Edition/refs/heads/main/Demo_Image/2.jpg" alt="示例图片2" width="300px">
<img src="https://raw.githubusercontent.com/Lrht-llw/WeChatBot_Revival-Edition/refs/heads/main/Demo_Image/3.jpg" alt="示例图片2" width="300px">
<img src="https://raw.githubusercontent.com/Lrht-llw/WeChatBot_Revival-Edition/refs/heads/main/Demo_Image/4.png" alt="示例图片3" width="900px">
<img src="https://raw.githubusercontent.com/Lrht-llw/WeChatBot_Revival-Edition/refs/heads/main/Demo_Image/5.png" alt="示例图片4" width="900px">
</code></pre>
</details>

# ©️版本号
- v3.26.1 (2026年1月2日)
  - 更新了对新版微信的支持，修复了一些在新版微信中出现的问题（微信4.0以上）
- [更多版本信息](https://github.com/Lrht-llw/WeChatBot_Revival-Edition/blob/main/CHANGELOG.md)

### 🚀 快速开始
  # 使用前准备
    - 请先安装python、pip，python版本应大于3.8
    - 申请大模型API,推荐 [WeAPIs](https://vg.v1api.cc/register?aff=4eq3)
  # 快速配置
    1. 登录电脑微信，确保在后台运行
    2. 运行 Run.bat 启动程序，等待自动安装依赖文件
    3. 在打开的网页中修改配置文件，选择您的API服务提供商、模型，并填入您的API KEY
    4. 在页面左侧点击 'Prompt管理' 进入提示词管理页面
    5. 在提示词管理页面您可以参考自带的提示词样式编写或者使用提示词生成器生成您需要的提示词
    6. 回到配置编辑器页面，填入微信昵称或群聊名称，并选择对应提示词
    7. 修改完配置后点击页面右上角'Start Bot'启动程序
    8. 如果想要自定义表情包请将表情包(.gif .png .jpg .jpeg)文件放入emojis文件夹中对应的情绪文件夹内（可以自己添加情绪种类）

---

## 🛠️ 功能全景

  ### ✅ 已实现
    - 多用户支持
    - 沉浸式角色扮演（支持群聊）
    - 智能对话分段 & 情感化表情包
    - 图像生成 & 图片识别（Kimi集成）
    - 语音消息 & 持久记忆存储
    - 自动更新 & 可视化WebUI
    - 智能自动回复，支持多用户/群聊同时聊天，并可为每个用户或群聊分配独立的提示词（Prompt）
    - 图片和表情包内容识别
    - 情绪识别并回复表情包
    - 获取消息中的包含的链接的网页内容
    - AI时间感知（年-月-日 星期 时-分-秒）
    - 主动发送消息及合并处理多条消息或表情包。
    - 前端WebUI支持：启动程序、修改配置文件、生成和管理Prompt
    - 记忆功能：调用AI总结聊天记录保存到Prompt或者独立核心记忆文件
    - 让AI设置定时任务功能，例如"15分钟后提醒我出门"或"每天早上八点叫我起床"，并支持通过语音通话提醒
    - 支持联网搜索
    - 接收语音消息（需在微信设置中开启"聊天中的语音消息自动转文字"功能）
    - 自动更新程序
    - 特色功能 - 角色论坛
    - 指令功能

  ### 🚧 开发中
    - OneBot协议兼容
    - 独立客户端

---

### 📜声明
- 本项目基于 [KouriChat](https://github.com/KouriChat/KouriChat) 修改(原My-Dream-Moments项目)，遵循 **GNU GPL-3.0 或更高版本** 许可证，原项目版权归属：umaru (2025)。
- **修改说明**：本项目在2026年期间对原始代码进行了大量修改和重构，包括但不限于：
  - 完全重写了用户界面和配置系统
  - 大幅扩展了机器人功能和AI集成
  - 重构了消息处理和自动化逻辑
  - 添加了大量新特性如情绪识别、定时任务、联网搜索等
  - 由于修改范围广泛且深入，无法精确标注每处修改的具体日期，但所有修改均在上述时间段内完成。
  - 本修改版本保持与原项目相同的GPL-3.0许可证，确保用户享有相同的自由软件权利。

  ## 许可证和依赖说明
    - **主许可证**：GNU GPL-3.0 或更高版本
    - **依赖库**：项目使用私有授权的微信自动化库作为可选增强功能，并提供开源备选方案
    - **合规性**：详细的许可证合规性说明请参阅 [DEPENDENCIES.txt](DEPENDENCIES.txt)
    - **用户权利**：无论使用哪种依赖库，用户都享有完整的GPL-3.0自由软件权利

# 🧑‍💻开发说明
```bash
  # 环境配置
    python -m pip install -r requirements.txt
```

---

## 💖 支持我们

<div align="center">
  <!-- 项目星标 -->
  <p>点击星星助力项目成长 ⭐️ 
  </p>

<!-- 资金用途 -->

<p style="margin:18px 0 10px; font-size:0.95em">
    🎯 您的支持将用于：<br>
    🚀 服务器费用 • 🌸 API资源 • 🛠️ 功能开发 • 💌 社区运营
  </p>

<!-- 赞助二维码 -->

<img src="https://raw.githubusercontent.com/Lrht-llw/WeChatBot_Revival-Edition/refs/heads/main/Demo_Image/%E8%B5%9E%E5%8A%A9.jpg" width="450" alt="支持二维码" style="border:3px solid #eee; border-radius:12px">

<!-- 神秘计划模块 -->

<div style="font-size:0.88em; line-height:1.3; max-width:540px; margin:15px auto;
              background: linear-gradient(145deg, rgba(255,105,180,0.08), rgba(156,39,176,0.05));
              padding:10px 15px; border-radius:6px; border:1px solid rgba(255,105,180,0.15)">
    <span style="color: #9c27b0">🔒 神秘赞助计划：</span>
    <span style="margin-left:6px; letter-spacing:-0.5px">
      <i class="fa fa-lock" style="color: #ff4081; margin-right:4px"></i>
      <span style="background: linear-gradient(45deg, #ff69b4, #9c27b0); -webkit-background-clip: text; color: transparent">
        暂时还没有想好...
      </span>
    </span>
  </div>

<!-- 动态徽章 -->

<div style="margin:18px 0 8px">
    <img src="https://img.shields.io/badge/已解锁成就-▮▮▮▮▮▮-ff69b4?style=flat-square&logo=starship">
    <img src="https://img.shields.io/badge/特别鸣谢-▮▮▮▮▮▮-9c27b0?style=flat-square&logo=heart">
  </div>
</div>

---

### 通过其他方式联系我们

- **QQ**：2179725762
- **视频教程**：[哔哩哔哩频道](https://space.bilibili.com/1235649129)
- **更多方式**：[官网](http://www.lrht.cc)
---