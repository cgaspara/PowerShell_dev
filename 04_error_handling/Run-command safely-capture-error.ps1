# Purpose: Run a command safely and capture a clean error message if it fails


try {
 Get-Item "C:\Users\cgasp\Downloads\install" -ErrorAction Stop
}
catch {
 $_.Exception.Message
}