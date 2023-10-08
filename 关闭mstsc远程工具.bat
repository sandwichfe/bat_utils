@echo off & color 0d & setlocal enabledelayedexpansion

rem 查询连接列表并写入文本
query session>connect.txt
for /f "delims=" %%a in (connect.txt) do (
set ip=%%a
rem echo !ip!
)

@echo off

rem 找到目标连接并且处理数字
findstr "rdp-tcp#" connect.txt>temp.txt
for /f "delims=" %%i in (temp.txt) do (set targetLine=%%i)
rem echo %targetLine%

rem 使用空格作为分隔符将line字符串分割成多个令牌，并将第2个令牌（端口号）存储到变量port中
for /f "tokens=2 delims=#" %%b in ("!targetLine!") do (
  set "numStr=%%b"
)

rem 继续处理文本
for /f "tokens=1 delims= " %%c in ("!numStr!") do (
  set "ret=%%c"
)

echo The session is %ret%

del connect.txt

del temp.txt

del rdp-tcp#%ret%

rem tscon rdp-tcp#%ret% /dest:console

pause>nul
