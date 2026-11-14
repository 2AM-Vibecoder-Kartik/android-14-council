$ErrorActionPreference = "Stop"
$TargetDir = Join-Path $env:USERPROFILE ".claude\skills\android-14-council"
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Copy-Item -Path "SKILL.md" -Destination (Join-Path $TargetDir "SKILL.md") -Force
Write-Host "Installed android-14-council by @2AM-Vibecoder-Kartik to $TargetDir\SKILL.md" -ForegroundColor Green
Write-Host "Open Claude Code in your project root and run: /android-14-council" -ForegroundColor Cyan
