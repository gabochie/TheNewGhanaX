# Quick Diagnostic Test for TheNewGhanaX
Write-Host "🧪 Quick Diagnostic Test" -ForegroundColor Cyan

# Test 1: Check if local server is running
Write-Host "`n📡 Testing local server..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:8000" -TimeoutSec 5
    Write-Host "✅ Local server is running (Status: $($response.StatusCode))" -ForegroundColor Green
} catch {
    Write-Host "❌ Local server not accessible" -ForegroundColor Red
    Write-Host "Starting local server..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoProfile", "-Command", "cd '$PWD'; python -m http.server 8000 --bind 127.0.0.1"
    Start-Sleep -Seconds 3
}

# Test 2: Check required files
Write-Host "`n📁 Checking required files..." -ForegroundColor Yellow
$requiredFiles = @("index.html", "about.html", "donate.html", "privacy.html", "terms.html", "blog/index.html", "traps/index.html", "assets/css/style.css", ".nojekyll")
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file" -ForegroundColor Green
    } else {
        Write-Host "❌ $file" -ForegroundColor Red
    }
}

# Test 3: Check canonical URLs
Write-Host "`n🔍 Checking canonical URLs..." -ForegroundColor Yellow
$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -Recurse
$githubUrls = 0
foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    if ($content.Contains("thenewghanax.github.io")) {
        Write-Host "❌ $($file.Name) still contains github.io URL" -ForegroundColor Red
        $githubUrls++
    }
}
if ($githubUrls -eq 0) {
    Write-Host "✅ All canonical URLs updated to thenewghanax.org" -ForegroundColor Green
}

# Test 4: Test domain access
Write-Host "`n🌐 Testing domain access..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "https://thenewghanax.org" -TimeoutSec 10
    Write-Host "✅ Custom domain accessible (Status: $($response.StatusCode))" -ForegroundColor Green
} catch {
    Write-Host "❌ Custom domain not accessible" -ForegroundColor Red
    try {
        $response = Invoke-WebRequest -Uri "https://gabochie.github.io/TheNewGhanaX" -TimeoutSec 10
        Write-Host "✅ GitHub Pages URL accessible (Status: $($response.StatusCode))" -ForegroundColor Green
    } catch {
        Write-Host "❌ GitHub Pages URL also not accessible" -ForegroundColor Red
    }
}

Write-Host "`n✨ Quick test completed" -ForegroundColor Cyan
