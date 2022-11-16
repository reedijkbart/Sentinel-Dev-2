Install-Module PowerShell-yaml
Import-Module ./.script/ConvertAnalyticsRuleFromYamlToArm.ps1

$Homepath = "Detections"
$Outpath  = "Detections/JSON"

if (!(Test-Path -Path $Outpath -PathType Container)){ New-Item -ItemType Directory -Path $Outpath}

foreach($parserYaml in $(Get-Childitem -path $Homepath -Recurse -Include *.yaml))
{
     $outputFilePath = "$Outpath\$($parserYaml.BaseName).json"
     ConvertAnalyticsRuleFromYamlToArm $parserYaml.FullName $outputFilePath
}
