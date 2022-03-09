# Stripped down variation of the dotnet-ef-init script for powershell.
# Works if used correctly, does not provide any error messages whatsoever and might cause your hard drive to be formatted and Arch Linux to be installed on it, idk.

if (-not(Test-Path -Path *.csproj -PathType Leaf)) {
	Write-Host "This script needs to be run from within a Project Folder"
	Exit
}

dotnet tool install --global dotnet-ef --version 6.0
dotnet add package Microsoft.EntityFrameworkCore --version 6.0
dotnet add package Microsoft.EntityFrameworkCore.Design --version 6.0
dotnet add package Microsoft.EntityFrameworkCore.Tools --version 6.0
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 6.0
dotnet add package Microsoft.EntityFrameworkCore.Sqlite --version 6.0
$dbPath = resolve-path .\northwnd.sqlite
$command = 'dotnet ef dbcontext scaffold "data source=' + $dbPath + '" Microsoft.EntityFrameworkCore.Sqlite -f -c NorthwindContext'
Invoke-Expression $command
