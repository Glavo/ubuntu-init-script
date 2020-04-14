# 一个用于配置 Ubuntu 环境的简单脚本

支持系统版本：Ubuntu 18.04

用法：下载项目源代码并执行 `init-ubuntu.sh`

### 这个脚本会覆盖系统的 sources.list，如果添加过第三方 apt 仓库，请谨慎使用。

这个脚本会：

* 使用阿里云镜像源替代系统默认仓库

* 安装 WPS for Linux 并卸载系统自带的的 LibreOffice

* 安装网易云音乐并卸载系统自带的 rhythmbox

* 安装 [deepin-wine](https://github.com/wszqkzqk/deepin-wine-ubuntu)

* 使用 deepin-wine 安装 TIM 和微信

  * 默认情况下托盘图标会显示在单独的窗口中，脚本自动安装了 TopIcons Plus 插件解决这个问题，但是需要手动在 Ubuntu Tweak 中启用该插件

* 安装 mpv 视频播放器，并卸载系统自带的

* 安装 git, curl, pip, p7zip 等常用工具

* 安装 [vscodium](https://vscodium.com/)（第三方提供的 Visual Studio Code 构建，与微软提供的 vscode 构建基本一致，但是是以 MIT 协议发布的二进制文件）

* 安装 [typora](https://typora.io)，一个所见即所得的 markdown 编辑器

* 安装 [Liberica JDK](https://bell-sw.com/) 11，包含 JavaFX 的 OpenJDK 11 构建，由 BellSoft 提供 LTS 服务

* 安装 Gradle 和 Maven

* 安装 g++、CMake、Ninja

* 安装 Docker

* 卸载系统自带的一些游戏
  