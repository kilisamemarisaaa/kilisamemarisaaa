# GitHub 主页上线说明

本地已写好 profile README：`D:\YUKE\github-profile\README.md`  
目标账号：https://github.com/kilisamemarisaaa  

GitHub 会把 **与用户名同名的公开仓库** 根目录 `README.md` 展示在个人主页。

## 一键推送（推荐）

1. 打开 https://github.com/settings/tokens → 生成 classic token，勾选 **`repo`**
2. PowerShell：

```powershell
$env:GH_TOKEN = "ghp_你的令牌"
cd D:\YUKE\github-profile
powershell -ExecutionPolicy Bypass -File .\push-profile.ps1
```

脚本会：创建 `kilisamemarisaaa/kilisamemarisaaa` 公开仓库 → 推送 README → 尽量更新显示名/bio。

## 手动网页操作（不用脚本）

1. https://github.com/new  
2. Repository name 填 **`kilisamemarisaaa`**（必须与用户名完全一致）  
3. Public，**不要**勾选 Add README  
4. Create repository  
5. 把本目录 `README.md` 内容粘贴进仓库根目录并提交  

## 建议在网页再点一下的设置

- **Name**：俞可 · YU KE  
- **Bio**：全栈工程师 · 教育科技 / AI 应用 | 2024 级计算机在读  
- **Pronouns / Location**：按需  
- 有公开作品仓库后，可在主页 pin 3 个代表作  

## 安全

推送完成后请撤销或轮换临时 PAT；不要把 token 写进仓库文件。
