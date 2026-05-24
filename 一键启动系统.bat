@echo off
chcp 65001 >nul
title 桂林旅游推荐与管理系统 - 一键启动脚本

echo ========================================================
echo        🌟 桂林旅游推荐与管理系统 - 一键智能启动器 🌟
echo ========================================================
echo.
echo [*] 正在检查本地运行环境...

:: 1. 检查 Node.js
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] 检查到您的电脑未安装 Node.js！
    echo 请先按照 README.md 安装 Node.js 16.x 版本再运行此脚本。
    pause
    exit
)
echo [OK] Node.js 环境已就绪。

:: 2. 检查 Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] 检查到您的电脑未配置 Java (JDK) 环境变量！
    echo 请先安装并配置好 JDK 1.8 再运行此脚本。
    pause
    exit
)
echo [OK] Java (JDK) 环境已就绪。
echo.

:: 3. 启动后端 Spring Boot 服务器
echo [*] 正在编译并启动 Java 后端服务器 (Port: 8080)...
echo [*] 将会弹出新窗口运行 Maven 编译启动，请勿关闭该窗口。
start "Java 后端服务器" cmd /k "mvnw.cmd spring-boot:run"

:: 等待 8 秒让后端加载
echo [*] 等待后端服务初始化中 (约 8 秒)...
timeout /t 8 /nobreak >nul

:: 4. 启动前台用户端
echo.
echo [*] 正在启动 [前台用户端] (Vue)...
if not exist "src\main\resources\front\front\node_modules\" (
    echo [!] 检测到前台用户端为首次运行，正在全自动安装依赖并启动 (需等待 1-2 分钟)...
    start "前台用户端-自动安装与启动" cmd /k "cd src\main\resources\front\front && npm install --registry=https://registry.npmmirror.com && npm run serve"
) else (
    start "前台用户端-开发服务器" cmd /k "cd src\main\resources\front\front && npm run serve"
)

:: 5. 启动管理与商家后台
echo [*] 正在启动 [管理与商家后台] (Vue)...
if not exist "src\main\resources\admin\admin\node_modules\" (
    echo [!] 检测到管理后台为首次运行，正在全自动安装依赖并启动 (需等待 1-2 分钟)...
    start "管理后台-自动安装与启动" cmd /k "cd src\main\resources\admin\admin && npm install --registry=https://registry.npmmirror.com && npm run serve"
) else (
    start "管理后台-开发服务器" cmd /k "cd src\main\resources\admin\admin && npm run serve"
)

echo.
echo ========================================================
echo 🎉 一键启动指令分发完毕！
echo ========================================================
echo.
echo 💡 后端 API 服务器：http://localhost:8080/tourismrecmngsys/
echo 💡 游客前台入口（启动后）：http://localhost:8082
echo 💡 商家/管理后台（启动后）：http://localhost:8081
echo.
echo [注意] 请保留弹出的三个黑色命令行窗口。窗口关闭会导致对应的服务停止。
echo.
pause
