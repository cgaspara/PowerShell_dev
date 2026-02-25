# Purpose: Run one remote command across many servers and collect a clean success/fail report

$servers = @("Server1","Server2","Server3")

$results = @()

foreach ($server in $servers) {

  try {

    $data = Invoke-Command -ComputerName $server -ScriptBlock { hostname } -ErrorAction Stop

    $results += [pscustomobject]@{

      Server = $server

      OK     = $true

      Data   = $data

      Error  = $null

    }

  }

  catch {

    $results += [pscustomobject]@{

      Server = $server

      OK     = $false

      Data   = $null

      Error  = $_.Exception.Message

    }

  }

}

$results | Format-Table -AutoSize
 