$items = @("server01","server02")
$results = foreach ($item in $items) {
   try {
       # Do the thing
       $data = "OK"  # replace with real command output
       [pscustomobject]@{
           Item   = $item
           Result = $data
           Error  = $null
       }
   }
   catch {
       [pscustomobject]@{
           Item   = $item
           Result = $null
           Error  = $_.Exception.Message
       }
   }
}
$results