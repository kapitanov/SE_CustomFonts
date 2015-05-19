param(
	[Parameter(Mandatory=$True,Position=1)] [string] $path,
	[Parameter(Mandatory=$True,Position=2)] [string] $font,
	[Parameter(Mandatory=$True,Position=3)] [string] $name
	)
	
# Generate font	
Write-Host "Running bmfontgen" -Foreground Cyan
Write-Host "bmfontgen -output FontData -name $font -size 23 -bmsize 1024 -range 0020-25a1"
.\bmfontgen -output FontData -name $font -size 23 -bmsize 1024 -range 0020-25a1 | Out-Null
if($LASTEXITCODE -ne 0)
{
	Write-Host "bmfontgen failed with exit code $LASTEXITCODE" -Foreground Red
	exit -1
}

# Deploy font
Write-Host "Deploying font" -Foreground Cyan
$folder = Join-Path $path "Content\Fonts\$name"
if(-not (Test-Path $folder))
{
	mkdir $folder | Out-Null
}
Move-Item "FontData.xml" (Join-Path $folder "FontData.xml") -force | Out-Null
Move-Item "FontData-*.png" $folder -force | Out-Null

Write-Host "Font `"$font`" has been deployed into `"$folder`"`n" -Foreground Cyan