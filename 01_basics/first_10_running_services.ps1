# Purpose: Quick on-screen check (example: list first 10 running services)

Get-Service |
 Where-Object { $_.Status -eq "Running" } |
 Select-Object -First 10 Name, Status |
 Format-Table -AutoSize