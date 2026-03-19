@echo off
chcp 65001 >nul
echo =========================================
echo       weixi-kefu GitHub 发布助手
echo =========================================

if not exist ".git" (
    echo 初始化 Git 仓库...
    git init
)

echo 添加所有文件到暂存区...
git add .
git commit -m "init: first public release for weixi-kefu"
git branch -M main

set /p RepoUrl="请输入目标 GitHub 仓库地址 (例如 https://github.com/Username/weixi-kefu.git): "
if "%RepoUrl%"=="" (
    echo [错误] 仓库地址不能为空！
    pause
    exit /b 1
)

echo 关联远程仓库...
git remote add origin %RepoUrl% 2>nul
if %errorlevel% neq 0 (
    echo 远程仓库已存在，尝试更新...
    git remote set-url origin %RepoUrl%
)

echo 开始推送到 GitHub...
git push -u origin main

echo.
echo 发布流程执行完毕！
pause
