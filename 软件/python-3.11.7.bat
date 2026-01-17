@echo off
set "url=https://www.python.org/ftp/python/3.11.7/python-3.11.7-amd64.exe"

:retry
cls
echo ========================================
echo	python 3.11.7 下载程序
echo   请选择浏览器：
echo    1. 默认浏览器
echo    2. Chrome
echo    3. Edge
echo    4. Firefox
echo 		--- Lr灰弹科技工作室
echo ========================================

echo.
set /p choice="请输入选择 (1-4): "

if "%choice%"=="1" (
    start %url%
    goto success
)
if "%choice%"=="2" (
    start chrome %url%
    goto success
)
if "%choice%"=="3" (
    start msedge %url%
    goto success
)
if "%choice%"=="4" (
    start firefox %url%
    goto success
)

echo.
echo 输入错误！请按任意键重新选择...
pause >nul
goto retry

:success
echo 浏览器正在打开链接...
timeout /t 2 >nul
start %url%