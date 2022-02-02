Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme tonybaloney

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{ InlinePrediction = '#B5B5B5'}