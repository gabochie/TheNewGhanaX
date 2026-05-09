# Automated Testing System for TheNewGhanaX Deployment
# This script tests local functionality and deployment readiness

Write-Host "🧪 TheNewGhanaX Automated Testing System" -ForegroundColor Cyan
Write-Host "===========================================" -ForegroundColor Cyan

# Test 1: Local Server Health Check
Write-Host "`n📡 Test 1: Local Server Health Check" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:8000" -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ Local server is running and responding" -ForegroundColor Green
    } else {
        Write-Host "❌ Local server responded with status: $($response.StatusCode)" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Local server is not running or not accessible" -ForegroundColor Red
    Write-Host "   Starting local server..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoProfile", "-Command", "cd '$PWD'; python -m http.server 8000 --bind 127.0.0.1"
    Start-Sleep -Seconds 3
    try {
        $response = Invoke-WebRequest -Uri "http://127.0.0.1:8000" -TimeoutSec 10
        if ($response.StatusCode -eq 200) {
            Write-Host "✅ Local server started successfully" -ForegroundColor Green
        }
    } catch {
        Write-Host "❌ Failed to start local server" -ForegroundColor Red
    }
}

# Test 2: File Structure Validation
Write-Host "`n📁 Test 2: File Structure Validation" -ForegroundColor Yellow
$requiredFiles = @(
    "index.html",
    "about.html", 
    "donate.html",
    "privacy.html",
    "terms.html",
    "blog/index.html",
    "traps/index.html",
    "assets/css/style.css",
    ".nojekyll",
    ".htaccess"
)

$missingFiles = @()
foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        $missingFiles += $file
    }
}

if ($missingFiles.Count -eq 0) {
    Write-Host "✅ All required files are present" -ForegroundColor Green
} else {
    Write-Host "❌ Missing files:" -ForegroundColor Red
    $missingFiles | ForEach-Object { Write-Host "   - $_" -ForegroundColor Red }
}

# Test 3: HTML Validation
Write-Host "`n🔍 Test 3: HTML Structure Validation" -ForegroundColor Yellow
$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -Recurse
$issues = @()

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Check for proper HTML structure
    if (-not $content.Contains("<!DOCTYPE html>")) {
        $issues += "$($file.Name): Missing DOCTYPE"
    }
    
    # Check for canonical URL
    if (-not $content.Contains('rel="canonical"')) {
        $issues += "$($file.Name): Missing canonical URL"
    }
    
    # Check for proper domain in canonical URL
    if ($content.Contains("thenewghanax.github.io")) {
        $issues += "$($file.Name): Still using github.io domain"
    }
    
    # Check for CSS link
    if (-not $content.Contains("/assets/css/style.css")) {
        $issues += "$($file.Name): Missing CSS link"
    }
}

if ($issues.Count -eq 0) {
    Write-Host "✅ All HTML files pass validation" -ForegroundColor Green
} else {
    Write-Host "❌ HTML validation issues:" -ForegroundColor Red
    $issues | ForEach-Object { Write-Host "   - $_" -ForegroundColor Red }
}

# Test 4: Internal Links Check
Write-Host "`n🔗 Test 4: Internal Links Validation" -ForegroundColor Yellow
$indexContent = Get-Content "index.html" -Raw
$navigationLinks = @("/", "/traps/", "/blog/", "/donate/", "/about/")

$brokenLinks = @()
foreach ($link in $navigationLinks) {
    try {
        $testUrl = "http://127.0.0.1:8000$link"
        $response = Invoke-WebRequest -Uri $testUrl -TimeoutSec 5
        if ($response.StatusCode -ne 200) {
            $brokenLinks += "$link (Status: $($response.StatusCode))"
        }
    } catch {
        $brokenLinks += "$link (Failed to load)"
    }
}

if ($brokenLinks.Count -eq 0) {
    Write-Host "✅ All navigation links are working" -ForegroundColor Green
} else {
    Write-Host "❌ Broken navigation links:" -ForegroundColor Red
    $brokenLinks | ForEach-Object { Write-Host "   - $_" -ForegroundColor Red }
}

# Test 5: CSS and Assets Validation
Write-Host "`n🎨 Test 5: CSS and Assets Validation" -ForegroundColor Yellow
try {
    $cssResponse = Invoke-WebRequest -Uri "http://127.0.0.1:8000/assets/css/style.css" -TimeoutSec 5
    if ($cssResponse.StatusCode -eq 200) {
        Write-Host "✅ CSS file is accessible" -ForegroundColor Green
    } else {
        Write-Host "❌ CSS file not accessible (Status: $($cssResponse.StatusCode))" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ CSS file failed to load" -ForegroundColor Red
}

# Test 6: GitHub Pages Configuration
Write-Host "`n🚀 Test 6: GitHub Pages Configuration" -ForegroundColor Yellow
$githubConfigFiles = @(
    ".github/workflows/jekyll.yml",
    ".nojekyll"
)

$configIssues = @()
foreach ($file in $githubConfigFiles) {
    if (-not (Test-Path $file)) {
        $configIssues += $file
    }
}

if ($configIssues.Count -eq 0) {
    Write-Host "✅ GitHub Pages configuration files are present" -ForegroundColor Green
    
    # Check workflow content
    $workflow = Get-Content ".github/workflows/jekyll.yml" -Raw
    if ($workflow.Contains("bundle exec jekyll build")) {
        Write-Host "❌ Workflow still contains Jekyll build command" -ForegroundColor Red
    } else {
        Write-Host "✅ Workflow configured for static deployment" -ForegroundColor Green
    }
} else {
    Write-Host "❌ Missing GitHub Pages configuration:" -ForegroundColor Red
    $configIssues | ForEach-Object { Write-Host "   - $_" -ForegroundColor Red }
}

# Test 7: Domain Configuration Check
Write-Host "`n🌐 Test 7: Domain Configuration Check" -ForegroundColor Yellow
try {
    $domainResponse = Invoke-WebRequest -Uri "https://thenewghanax.org" -TimeoutSec 10
    Write-Host "✅ Custom domain is accessible" -ForegroundColor Green
    Write-Host "   Status: $($domainResponse.StatusCode)" -ForegroundColor Green
    Write-Host "   Final URL: $($domainResponse.BaseResponse.ResponseUri.AbsoluteUri)" -ForegroundColor Green
} catch {
    Write-Host "❌ Custom domain not accessible" -ForegroundColor Red
    Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
    
    # Try GitHub Pages default URL
    try {
        $ghResponse = Invoke-WebRequest -Uri "https://gabochie.github.io/TheNewGhanaX" -TimeoutSec 10
        Write-Host "✅ GitHub Pages default URL is accessible" -ForegroundColor Green
        Write-Host "   Status: $($ghResponse.StatusCode)" -ForegroundColor Green
    } catch {
        Write-Host "❌ GitHub Pages default URL also not accessible" -ForegroundColor Red
    }
}

# Test 8: Performance Check
Write-Host "`n⚡ Test 8: Performance Check" -ForegroundColor Yellow
try {
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:8000" -TimeoutSec 10
    $stopwatch.Stop()
    
    if ($stopwatch.ElapsedMilliseconds -lt 3000) {
        Write-Host "✅ Page loads quickly ($($stopwatch.ElapsedMilliseconds)ms)" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Page load time is slow ($($stopwatch.ElapsedMilliseconds)ms)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Performance test failed" -ForegroundColor Red
}

# Summary
Write-Host "`n📊 Test Summary" -ForegroundColor Cyan
Write-Host "=============" -ForegroundColor Cyan

# Count total issues
$totalIssues = $missingFiles.Count + $issues.Count + $brokenLinks.Count + $configIssues.Count

if ($totalIssues -eq 0) {
    Write-Host "🎉 All tests passed! The website is ready for deployment." -ForegroundColor Green
} else {
    Write-Host "⚠️  Found $totalIssues issue(s) that need to be addressed." -ForegroundColor Yellow
    Write-Host "`n📋 Recommended Actions:" -ForegroundColor Yellow
    
    if ($missingFiles.Count -gt 0) {
        Write-Host "   • Create missing files" -ForegroundColor White
    }
    if ($issues.Count -gt 0) {
        Write-Host "   • Fix HTML validation issues" -ForegroundColor White
    }
    if ($brokenLinks.Count -gt 0) {
        Write-Host "   • Fix broken navigation links" -ForegroundColor White
    }
    if ($configIssues.Count -gt 0) {
        Write-Host "   • Fix GitHub Pages configuration" -ForegroundColor White
    }
}

Write-Host "`n🔧 Next Steps:" -ForegroundColor Cyan
Write-Host "1. Fix any identified issues above" -ForegroundColor White
Write-Host "2. Commit and push changes to GitHub" -ForegroundColor White
Write-Host "3. Monitor GitHub Pages deployment" -ForegroundColor White
Write-Host "4. Test live site at https://thenewghanax.org" -ForegroundColor White

Write-Host "`n✨ Testing completed at $(Get-Date)" -ForegroundColor Cyan
