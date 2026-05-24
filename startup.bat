@echo off
title Guilin Tourism Recommendation and Management System - One-Click Startup Script

echo ========================================================
echo   🌟 Guilin Tourism Rec and Mgmt System Startup 🌟
echo ========================================================
echo.
echo [*] Checking local environment...

:: 1. Check Node.js
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed on this computer!
    echo Please install Node.js 16.x version as described in README.md first.
    pause
    exit
)
echo [OK] Node.js environment is ready.

:: 2. Check Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java (JDK) environment is not configured!
    echo Please install JDK 1.8 and set JAVA_HOME first.
    pause
    exit
)
echo [OK] Java (JDK) environment is ready.
echo.

:: 3. Start Backend Spring Boot Server
echo [*] Compiling and starting Java Backend Server (Port: 8080)...
echo [*] A new terminal window will pop up to run Maven. DO NOT close it.
start "Java Backend Server" cmd /k "mvnw.cmd spring-boot:run"

:: Wait 8 seconds for backend initialization
echo [*] Waiting for backend service initialization (about 8 seconds)...
timeout /t 8 /nobreak >nul

:: 4. Start Front User Client
echo.
echo [*] Starting [User Client Frontend] (Vue)...
if not exist "src\main\resources\front\front\node_modules\" (
    echo [!] First time run detected for User Client. Installing dependencies (takes 1-2 mins)...
    start "User Frontend - Install & Run" cmd /k "cd src\main\resources\front\front && npm install --registry=https://registry.npmmirror.com && npm run serve"
) else (
    start "User Frontend" cmd /k "cd src\main\resources\front\front && npm run serve"
)

:: 5. Start Admin & Merchant Backend
echo [*] Starting [Admin & Merchant Frontend] (Vue)...
if not exist "src\main\resources\admin\admin\node_modules\" (
    echo [!] First time run detected for Admin Backend. Installing dependencies (takes 1-2 mins)...
    start "Admin Frontend - Install & Run" cmd /k "cd src\main\resources\admin\admin && npm install --registry=https://registry.npmmirror.com && npm run serve"
) else (
    start "Admin Frontend" cmd /k "cd src\main\resources\admin\admin && npm run serve"
)

echo.
echo ========================================================
echo 🎉 Startup Commands Dispatched Successfully!
echo ========================================================
echo.
echo 💡 Backend API Server: http://localhost:8080/tourismrecmngsys/
echo 💡 User Front Client (after started): http://localhost:8082
echo 💡 Admin & Merchant Backend (after started): http://localhost:8081
echo.
echo [Notice] Please KEEP the three popped-up black command windows running.
echo          Closing them will stop their respective services.
echo.
pause
