oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression

# Load necessary modules
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

# Set PSReadLine options
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -ShowToolTips

# PSReadLine customization
$PSReadLineOptions = @{
    HistoryNoDuplicates = $true	
    HistorySearchCursorMovesToEnd = $true
    Colors = @{"Command" = "#8181f7"}
}
Set-PSReadLineOption @PSReadLineOptions
