# Purpose: Create a CSV report of top CPU processes (good for tickets / analysis)

Get-Process |
 Sort-Object CPU -Descending |
 Select-Object -First 20 Name, Id, CPU, WS |
 Export-Csv ".\top_cpu_processes.csv" -NoTypeInformation
