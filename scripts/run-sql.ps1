param(
  [Parameter(Mandatory = $true, Position = 0)]
  [string]$File
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$resolvedPath = Resolve-Path $File
$password = if ($env:MYSQL_ROOT_PASSWORD) { $env:MYSQL_ROOT_PASSWORD } else { "root" }
$database = if ($env:MYSQL_DATABASE) { $env:MYSQL_DATABASE } else { "exercises" }

Get-Content -Raw $resolvedPath | docker compose exec -T mysql mysql -uroot "-p$password" $database
