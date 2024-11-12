$chocoDest = Join-Path -Path $env:ChocolateyInstall -ChildPath 'bin'
Get-Content "$chocoDest\command-not-found-script.ps1"