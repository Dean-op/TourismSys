@echo off
start "User Frontend" cmd /c "cd src/main/resources/front/front && npm run serve"
start "Admin Frontend" cmd /c "cd src/main/resources/admin/admin && npm run serve"
