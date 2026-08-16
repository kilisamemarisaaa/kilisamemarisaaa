#Requires -Version 5.1
<#
  Create/update the GitHub profile README repo: kilisamemarisaaa/kilisamemarisaaa
  Prerequisites (pick one):
    A) gh auth login
    B) $env:GH_TOKEN or $env:GITHUB_TOKEN = classic PAT with `repo` scope
#>
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$owner = "kilisamemarisaaa"
$repo = "kilisamemarisaaa"
$api = "https://api.github.com"

function Get-Token {
  if ($env:GH_TOKEN) { return $env:GH_TOKEN }
  if ($env:GITHUB_TOKEN) { return $env:GITHUB_TOKEN }
  if (Get-Command gh -ErrorAction SilentlyContinue) {
    $t = gh auth token 2>$null
    if ($LASTEXITCODE -eq 0 -and $t) { return $t.Trim() }
  }
  return $null
}

$token = Get-Token
if (-not $token) {
  Write-Host @"
未检测到 GitHub 登录。

请任选一种方式后重跑本脚本：
  1) 安装 GitHub CLI 后执行:  gh auth login
  2) 在 PowerShell 设置:     `$env:GH_TOKEN = 'ghp_你的PAT'`
     PAT 需要 repo 权限: https://github.com/settings/tokens

然后:
  cd D:\YUKE\github-profile
  powershell -ExecutionPolicy Bypass -File .\push-profile.ps1
"@
  exit 1
}

$headers = @{
  Authorization = "Bearer $token"
  Accept        = "application/vnd.github+json"
  "User-Agent"  = "yuke-profile-push"
}

# Ensure repo exists (special profile repo must be public & same name as user)
$exists = $true
try {
  Invoke-RestMethod -Headers $headers -Uri "$api/repos/$owner/$repo" | Out-Null
  Write-Host "仓库已存在: $owner/$repo"
} catch {
  $exists = $false
}

if (-not $exists) {
  Write-Host "正在创建公开仓库 $owner/$repo ..."
  $body = @{
    name        = $repo
    description = "Profile README · 俞可 YU KE"
    private     = $false
    auto_init   = $false
  } | ConvertTo-Json
  Invoke-RestMethod -Method Post -Headers $headers -Uri "$api/user/repos" -Body $body -ContentType "application/json" | Out-Null
  Write-Host "已创建。"
}

# Optional: polish public profile fields
try {
  $profile = @{
    name = "俞可 · YU KE"
    bio  = "全栈工程师 · 教育科技 / AI 应用 | 2024 级计算机在读 | TS / React / Next.js / Node"
    blog = "https://github.com/kilisamemarisaaa"
  } | ConvertTo-Json
  Invoke-RestMethod -Method Patch -Headers $headers -Uri "$api/user" -Body $profile -ContentType "application/json" | Out-Null
  Write-Host "已更新 GitHub 显示名与 bio。"
} catch {
  Write-Host "提示: bio/name 更新跳过（权限不足也不影响 README 推送）。"
}

if (-not (Test-Path .git)) {
  git init
  git branch -M main
}

git add README.md .gitignore
git status --short
git commit -m "docs: polish GitHub profile README" 2>$null
if ($LASTEXITCODE -ne 0) {
  Write-Host "无新提交（可能内容未变），继续推送…"
}

$pushUrl = "https://$token@github.com/$owner/$repo.git"
git remote remove origin 2>$null
git remote add origin "https://github.com/$owner/$repo.git"
git -c "http.extraHeader=AUTHORIZATION: bearer $token" push -u origin main

Write-Host ""
Write-Host "完成。打开: https://github.com/$owner"
Write-Host "若主页未显示 README: 确认仓库名为 $repo 且为 Public，稍等几十秒刷新。"
