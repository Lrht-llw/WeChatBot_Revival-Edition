@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: ---------------------------
:: 检查微信版本
:: ---------------------------
:: 依次检测 Weixin 和 WeChat 注册表路径,优先 Weixin
:: ---------------------------
set "wxversion="
rem 优先依次检测 Weixin 和 WeChat 的 DisplayVersion
for %%K in (
    "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Weixin"
    "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\WeChat"
) do (
    for /f "tokens=2,*" %%i in ('reg query %%K /v DisplayVersion 2^>nul ^| find "DisplayVersion"') do (
        set "wxversion=%%j"
        set "RegPath=%%K"
        goto :found_wxversion
    )
)
if not defined wxversion (
    echo "⚠️ 警告：未检测到微信安装或无法读取注册表！"
    echo "⚠️这可能是由于以下原因："
    echo "⚠️1. 微信未正确安装"
    echo "⚠️2. 注册表访问权限不足"
    echo "⚠️3. 微信版本过老或过新"
    echo "⚠️4. 您使用的是便携版微信"
    echo.
    echo "⚠️程序将跳过微信版本检查并继续运行。"
    echo "⚠️如果程序启动后无法控制微信,请打开软件文件夹安装微信"
    echo.
    echo "🔄3秒后自动继续..."
    timeout /t 3 /nobreak >nul
    goto :check_python
)
:found_wxversion

if not defined wxversion (
    echo "⚠️警告：无法获取微信版本号！"
    echo "⚠️程序将跳过微信版本检查并继续运行,但建议检查微信安装状态。"
    echo "⚠️如果程序启动后无法控制微信,请打开软件文件夹安装微信"
    echo.
    echo "🔄3秒后自动继续..."
    timeout /t 3 /nobreak >nul
    goto :check_python
)

:: 解析主版本号
for /f "tokens=1 delims=." %%a in ("!wxversion!") do (
    set "major=%%a"
)

:: 只判断主版本
if !major! lss 3 (
    echo "❌当前微信版本 !wxversion!,版本过低！"
    echo "⚠️请下载微信4.1.6版本"
    echo "⚠️下载地址：https://pc.weixin.qq.com/"
    echo.
    echo "🔄如果您确信已经安装了正确版本的微信,请按下键盘任意键继续运行程序,否则关闭窗口退出。"
    pause
    goto :check_python
)
rem 移除4.x版本检查，现在支持4.1.6版本

echo "✅ 微信版本检查通过：!wxversion!"

:check_python

:: ---------------------------
:: 检查 Python 是否安装
:: ---------------------------
echo 🔍 检查Python环境...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo "❌ Python 未安装或未添加到系统PATH！"
    echo "请前往官网下载并安装 Python 3.9-3.12 版本"
    echo "下载地址：https://www.python.org/downloads/"
    echo "⚠️ 安装时请勾选"Add Python to PATH"选项"
    pause
    exit /b 1
)

:: 获取 Python 版本
for /f "tokens=2,*" %%i in ('python --version 2^>^&1') do set "pyversion=%%i"
echo "检测到Python版本：%pyversion%"

:: 解析版本号
for /f "tokens=1,2,3 delims=." %%a in ("%pyversion%") do (
    set "py_major=%%a"
    set "py_minor=%%b"
    set "py_patch=%%c"
)

:: 检查主版本号
if "%py_major%" neq "3" (
    echo "❌ 不支持的Python主版本：%pyversion%"
    echo "支持版本：Python 3.9-3.12"
    echo "当前版本：Python %pyversion%"
    pause
    exit /b 1
)

:: 检查次版本号范围 (3.9-3.12)
if %py_minor% lss 9 (
    echo "❌ Python版本过低：%pyversion%"
    echo "最低要求：Python 3.9"
    echo "当前版本：Python %pyversion%"
    echo "请升级Python版本"
    pause
    exit /b 1
)
if %py_minor% gtr 12 (
    echo "❌ Python版本过高：%pyversion%"       
    echo "支持版本：Python 3.9-3.12"
    echo "当前版本：Python %pyversion%"
    echo "可能存在兼容性问题,建议降级"
    pause
    exit /b 1
)

echo "✅ Python版本检查通过：%pyversion% (满足3.9-3.12要求)"

:: ---------------------------
:: 检查 pip 是否存在
:: ---------------------------
python -m pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo "❌ pip 未安装,请先安装 pip。"
    pause
    exit /b 1
)

:: ---------------------------
:: 升级 pip（静默）
:: ---------------------------
echo "🚀 升级 pip..."
python -m pip install --upgrade pip --index-url https://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com >nul 2>&1

:INSTALL
echo "🔄 正在安装依赖..."
echo "📦 使用多源策略：阿里源(主) + 清华源(备)"

:: 使用多源安装：减少网络拥堵
python -m pip install -r requirements.txt -f ./libs ^
    --index-url https://mirrors.aliyun.com/pypi/simple/ ^
    --extra-index-url https://pypi.tuna.tsinghua.edu.cn/simple ^
    --trusted-host mirrors.aliyun.com ^
    --trusted-host pypi.tuna.tsinghua.edu.cn

if !errorlevel! neq 0 (
    echo "❌ 安装依赖失败,请检查网络或 requirements.txt 是否存在"
    pause
    exit /b 1
)

:: ---------------------------
:: 卸载通用版本，安装定制版wxautox4_wechatbot
:: ---------------------------
echo "🔄 卸载旧版微信控制包..."
python -m pip uninstall wxautox-wechatbot wxautox4-wechatbot -y >nul 2>&1

echo "🔄 安装新版本wxautox4_wechatbot..."
set "WHL_FILE="
if "!py_minor!"=="9" set "WHL_FILE=libs\wxautox4_wechatbot-40.1.10-cp39-cp39-win_amd64.whl"
if "!py_minor!"=="10" set "WHL_FILE=libs\wxautox4_wechatbot-40.1.10-cp310-cp310-win_amd64.whl"
if "!py_minor!"=="11" set "WHL_FILE=libs\wxautox4_wechatbot-40.1.10-cp311-cp311-win_amd64.whl"
if "!py_minor!"=="12" set "WHL_FILE=libs\wxautox4_wechatbot-40.1.10-cp312-cp312-win_amd64.whl"

if defined WHL_FILE (
    if exist "!WHL_FILE!" (
        echo "📦 安装文件: !WHL_FILE!"
        python -m pip install "!WHL_FILE!" --no-deps --force-reinstall
        if !errorlevel! equ 0 (
            echo "✅ 新版本wxautox4_wechatbot安装成功"
            echo "🔍 验证安装版本..."
            python -c "import wxautox4_wechatbot; print('版本:', wxautox4_wechatbot.__version__ if hasattr(wxautox4_wechatbot, '__version__') else '40.1.2')"
        ) else (
            echo "❌ 新版本wxautox4_wechatbot安装失败"
        )
    ) else (
        echo "⚠️ 警告: 新版本安装文件不存在: !WHL_FILE!"
    )
) else (
    echo "⚠️ 警告: 无法确定Python版本对应的定制版安装包"
)

:: 安装wxautox-wechatbot (旧版本微信用) - 定制版已注释
rem python -m pip install -U -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple wxautox-wechatbot
rem if !errorlevel! neq 0 (
rem     python -m pip install -U wxautox-wechatbot
rem )

:: 安装wxauto (备用) - 定制版已注释
rem python -m pip install -U -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple wxauto
rem if !errorlevel! neq 0 (
rem     python -m pip install -U wxauto
rem )

echo "✅ 所有依赖安装成功！"

:: 清屏
cls

:: ---------------------------
:: 检查程序更新
:: ---------------------------

echo "🟢 检查程序更新..."

python updater.py

echo "✅ 程序更新完成！"

:: 清屏
cls

:: ---------------------------
:: 启动程序
:: ---------------------------
echo "🟢 启动主程序..."
python config_editor.py
