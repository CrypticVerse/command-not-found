$chocoDest = Join-Path -Path $env:ChocolateyInstall -ChildPath 'bin'
Copy-Item -Path 'tools\command-not-found.ps1' -Destination $chocoDest
Copy-Item -Path 'tools\command-not-found-script.ps1' -Destination $chocoDest

for ($i = 0; $i -lt 40; $i++) {
	Write-Host ""
}

Write-Host "Successfully Installed! Now, PLEASE!!!!!!!!!, run: command-not-found.ps1 >> `$PROFILE, in your " -ForegroundColor Red -BackgroundColor Black
Write-Host "SPECIFIC USER!!!!!!!!!!!!!" -ForegroundColor Red -BackgroundColor Black
Write-Host "Thank you for using command-not-found!" -ForegroundColor Red -BackgroundColor Black

exit
