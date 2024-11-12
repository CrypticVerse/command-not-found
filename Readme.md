### Command Not Found

This is a tool that simulates the command-not-found on ubuntu!

Find on [Chocolatey Packages](https://community.chocolatey.org/packages/command-not-found)!

#### Installation
1. Run `choco install command-not-found` as an Administrator
2. In **POWERSHELL AS YOUR USER!** run `command-not-found.cmd >> $PROFILE`. This only works in powershell (CMD.exe coming soon!)
3. Run `. $PROFILE` and done!

#### Usage
Command not found is enabled automatically!
Every time a command fails, command-not-found checks to see if it's available on chocolatey!
Then, it will recommend the package to install based on the failed command!
