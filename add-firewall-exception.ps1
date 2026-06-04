# PowerShell script untuk add firewall exception
# Jalankan dengan Administrator privileges

param(
    [string]$AppPath = "C:\Program Files\MobaXterm KeyGen\MobaXterm KeyGen.exe",
    [string]$RuleName = "MobaXterm KeyGen"
)

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "Error: This script must be run as Administrator!" -ForegroundColor Red
    exit 1
}

# Check if app exists
if (-not (Test-Path $AppPath)) {
    Write-Host "Error: Application not found at $AppPath" -ForegroundColor Red
    exit 1
}

Write-Host "Adding firewall exception for: $AppPath" -ForegroundColor Yellow

# Remove existing rule if it exists
$existingRule = Get-NetFirewallRule -DisplayName $RuleName -ErrorAction SilentlyContinue
if ($existingRule) {
    Write-Host "Removing existing firewall rule..." -ForegroundColor Yellow
    Remove-NetFirewallRule -DisplayName $RuleName -ErrorAction SilentlyContinue
}

# Add inbound rule
New-NetFirewallRule `
    -DisplayName $RuleName `
    -Direction Inbound `
    -Program $AppPath `
    -Action Allow `
    -Profile Any `
    -ErrorAction Stop

Write-Host "Firewall inbound rule added successfully!" -ForegroundColor Green

# Add outbound rule (if needed)
New-NetFirewallRule `
    -DisplayName "$RuleName (Outbound)" `
    -Direction Outbound `
    -Program $AppPath `
    -Action Allow `
    -Profile Any `
    -ErrorAction Stop

Write-Host "Firewall outbound rule added successfully!" -ForegroundColor Green
Write-Host "Done!" -ForegroundColor Green
