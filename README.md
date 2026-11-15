# 第一部分 如何配置

首先，五下`Shift`键，会弹出来一个Windows10样式的窗口，点击蓝字，弹出来设置，点开主页，往下翻找到更新与安全，打开，往下翻左边找到开发者选项，点开，右边往下翻找到“更改执行策略”和`Powershell`字样的（最底下），点击蓝字“更改设置”。弹出来一个窗口，依次输入：

```cpp
taskkill /f /im explorer.exe
explorer
```

然后就会发现屏幕底部出现一个黑条，最左边那个Windows右键，点`Windows PowerShell 管理员`那个，输入`Notepad.exe`，在打开的窗口输入：

```cpp
taskkill /f /im explorer.exe
start explorer
if "%1"=="--restart-explorer" (
exit /b
)
if "%1"=="-e" (
exit /b
)
sc stop rccdaemon
sc delete rccdaemon
taskkill /f /im RCC_ClassManager_Stu_Box.exe
taskkill /f /im RCC_ClassManager_Stu_Box_r.exe
taskkill /f /im RCC-Client.exe
taskkill /f /im ESTGuard.exe
if "%1"=="--close-client" (
taskkill /f /im ESTClient.exe
)
if "%1"=="-r" (
taskkill /f /im ESTClient.exe
)
pause
```

另存为`E:\CloseRCC.cmd`（如果此电脑没有显示E:，请手动在地址栏输入`E:`，类型选择所有文件，名字输入`CloseRCC.cmd`）

然后在标题`Windows PowerShell`（那个蓝框框）的里面输入`cmd`，回车，再输入`E:\CloseRCC.cmd`，等待执行完毕（显示`[SC]DeleteService` 成功这样的信息就行）

就恭喜你完全摆脱了云课堂的控制！要想回来，重启。

# 第二部分 如何使用

在同一个电脑上，如果你还想再次摆脱控制的话，就按5下`Shift`，会弹出来一个Windows10样式的窗口，点击蓝字，弹出来设置，点开主页，往下翻找到更新与安全，打开，往下翻左边找到开发者选项，点开，右边往下翻找到“更改执行策略”和`Powershell`字样的（最底下），点击蓝字“更改设置”。弹出来一个窗口，输入`E:\CloseRCC.cmd <你的参数>`，回车。

注意：此脚本可配置。

如果你想关闭那个系统（Windows7），请使用参数`--close-client`或者`-r`。

如果你只是想整出来原来的任务栏，请使用`--restart-explorer`或者`-e`。
