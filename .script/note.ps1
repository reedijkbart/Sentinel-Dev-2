Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module PowerShell-yaml
#Import-Module .script/ConvertAnalyticsRuleFromYamlToArm.ps1

$newDirectory = New-Item -ItemType Directory -Path "Detections/SigninLogs/dir2"
foreach($parserYaml in $(Get-Item ***/*.yaml))
{
     $outputFilePath = "$($newDirectory.FullName)/$($parserYaml.BaseName).json"
     ./ConvertAnalyticsRuleFromYamlToArm $parserYaml.FullName $outputFilePath
}
