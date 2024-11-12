# Load the command-to-package mappings from the JSON file
$knownCommandToPackageMap = @{
	'node' = 'nodejs'
	'java' = 'openjdk'
}

function Handle-CommandNotFound {
    param (
        [string]$command
    )

    # Skip commands starting with 'get-'
    if ($command -like 'get-*') {
        return
    }

    # Check if there's a mapping for the command
    if ($knownCommandToPackageMap.ContainsKey($command)) {
	choco search $packageName
	if (-not $?) {
		Write-Host "Command '$command' not found"
		return
	}
        $packageName = $knownCommandToPackageMap[$command]
        Write-Host "Command '$command' not found. You can install it using Chocolatey:" -ForegroundColor Red
        Write-Host "  choco install $packageName" -ForegroundColor Cyan
    }
    else {
        # Try searching for the command in the Chocolatey package repository
        $installed = choco search $command -s chocolatey --exact --verbose

        if ($installed) {
            Write-Host "Command '$command' not found. You can install it using Chocolatey:" -ForegroundColor Red
            Write-Host "  choco install $command" -ForegroundColor Cyan
        } else {
            Write-Host "Command '$command' not found and no installation suggestion available." -ForegroundColor Red
        }
    }
}

# Set $ErrorActionPreference to 'Stop' to catch all errors
$ErrorActionPreference = "Stop"

# Global Error Handler to catch the "CommandNotFoundException"
$ExecutionContext.InvokeCommand.CommandNotFoundAction = {
    param($commandName)
    Handle-CommandNotFound -command $commandName
}
