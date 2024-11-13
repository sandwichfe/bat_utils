@echo off
chcp 65001 >nul
setlocal

:loop
echo 请输入 1 设置代理，输入 2 取消代理，输入 3 退出：
set /p input=输入:

if "%input%"=="1" (
    echo 设置代理...
    git config --global http.proxy 127.0.0.1:7897
    git config --global https.proxy 127.0.0.1:7897
    echo 代理已设置。
) else if "%input%"=="2" (
    echo 取消代理...
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo 代理已取消。
) else if "%input%"=="3" (
    echo 退出程序...
    goto :eof
) else (
    echo 输入无效，请输入 1、2 或 3。
)

goto loop
