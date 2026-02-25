= @(
"server1",
"server2",
"server3"
)

Invoke-Command -ComputerName $Server -ScriptBlock { Get-Service | Where-Object {$_.Status -eq 'Running' } }
