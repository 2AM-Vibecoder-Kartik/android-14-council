# One-click PowerShell script to push this folder to https://github.com/2AM-Vibecoder-Kartik/android-14-council
$ErrorActionPreference = "Stop"

git init
git branch -M main
git add .
git commit -m "Initial release: Universal 14-Agent Android Pre-Launch Council by Kartik (@2AM-Vibecoder-Kartik)"

if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh repo create 2AM-Vibecoder-Kartik/android-14-council --public --source=. --remote=origin --push
} else {
    git remote add origin https://github.com/2AM-Vibecoder-Kartik/android-14-council.git
    git push -u origin main
}
