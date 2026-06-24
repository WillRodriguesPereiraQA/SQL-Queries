param(
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$MySqlArgs
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$password = if ($env:MYSQL_ROOT_PASSWORD) { $env:MYSQL_ROOT_PASSWORD } else { "root" }
$database = if ($env:MYSQL_DATABASE) { $env:MYSQL_DATABASE } else { "exercises" }

$baseArgs = @(
  "compose", "exec", "-T", "mysql",
  "mysql", "-uroot", "-p$password", $database
)

if ($MySqlArgs.Count -gt 0) {
  & docker @baseArgs @MySqlArgs
} else {
  & docker compose exec mysql mysql -uroot "-p$password" $database
}
