# Purpose: Wrap logic in a function so you can reuse it like a command
function Get-RunningService {
 param($name)
 Get-Service -Name $name |
   Where-Object { $_.Status -eq "Running" }
}
Get-RunningService -Name "Dhcp"