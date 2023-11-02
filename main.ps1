# This is a comment

Param(
    [string]$UserDir
)

$NonDotFiles = 'Contacts', 'Favorites', 'Links', 'Saved Games', 'Searches', 'Music', 'Videos'
$Hidden = @()

if (-Not (Test-Path $UserDir)) {
    throw "Path does not exist, you lied to me >:("
}

# Write-Host (Get-ChildItem -Path $UserDir)

Write-Host "Hiding Specific Files ..."
foreach ($File in $NonDotFiles) {

    $Path = "$UserDir\$File"

    if (-Not (Test-Path "$Path" ) ) {
        Continue
    }

    try {

        $Item = Get-Item "$Path" -Force

        # Check if item is hidden already
        if ( -Not ($Item.Attributes -match 'Hidden') ) {
            $Item.Attributes += 'Hidden'
            $Hidden += $Path
        }
        
    }
    catch {
        Write-Error "FAILURE: $Path"
    }
}

Write-Host "Hiding Dot Files ..."

foreach ($File in (Get-ChildItem -Path $UserDir -Force)) {

    $Path = "$UserDir\$File"

    if ( -Not ($File -like ".*") ) {
        Continue
    }

    try {

        $Item = Get-Item "$Path" -Force

        # Check if item is hidden already
        if ( -Not ($Item.Attributes -match 'Hidden') ) {
            $Item.Attributes += 'Hidden'
            $Hidden += $Path
        }
        
    }
    catch {
        Write-Error "Failure: $Path"
    }
}

Write-Host "Done"

if ($Hidden.Length -eq 0) {
    Write-Host "No files were hidden"
}
else {
    Write-Host "Files Hidden:"
    foreach ($file in $Hidden) {
        Write-Host "$file"
    }
}
