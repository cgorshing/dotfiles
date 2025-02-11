# https://raw.githubusercontent.com/PowerShell/PSReadLine/master/PSReadLine/SamplePSReadLineProfile.ps1
# https://github.com/johnthebrit/RandomStuff/blob/master/PowerShellStuff/psreadlinedemo.ps1
# https://gist.github.com/shanselman/25f5550ad186189e0e68916c6d7f44c3
# https://gist.github.com/ChrAlpha/65a6f402d1b984ea17feaa4ae314e8dd

# Read this a bit more, has a couple different key handlers
# https://github.com/laurentkempe/dotfiles/blob/master/PowerShell/Microsoft.PowerShell_profile.ps1#L27

# mklink C:\Users\cgorshing\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 D:\cgorshing\workspaces\dotfiles\Microsoft.PowerShell_profile.ps1
# mklink C:\Users\cgorshing\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 D:\cgorshing\workspaces\dotfiles\Microsoft.PowerShell_profile.ps1
# WSLENV, WT_PROFILE_ID, or WT_SESSION
If ([bool]($env:WT_Session)) {
  function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
  }
  Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
}


# From https://superuser.com/questions/1325217/how-to-produce-a-linux-like-ls-output-in-powershell/1528550
# I don't like this, but "works"
# TODO Look into https://github.com/gardebring/PowerColorLS
function l { Get-ChildItem $args -Exclude .*  | Format-Wide Name -AutoSize }
if ($host.Name -eq 'ConsoleHost')
{
    $git_path = 'C:\Program Files\Git'
    # 'E:\tools\PortableGit-2.34.1-64-bit\usr\bin\ls'
    # function ls_git { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF $args }
    $iCloudSSHFolder = Join-Path $env:USERPROFILE 'iCloudDrive\_ssh\'
    function ls_git { & (Join-Path $git_path '\usr\bin\ls') --color=auto -hF $args }
    function ls_git_reverse { & (Join-Path $git_path '\usr\bin\ls') --color=auto -lhFrt $args }

    Set-Alias -Name ls -Value ls_git -Option AllScope
    Set-Alias -Name lsr -Value ls_git_reverse -Option AllScope
}

# I can't get this to work within the profile script.
# Copy/Pasting this in the cli window itself and then using Ctrl+B does work - not sure
Set-PSReadLineKeyHandler -Key Ctrl+b `
                         -BriefDescription BuildCurrentDirectory `
                         -LongDescription "Build the current directory" `
                         -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("msbuild")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function update-upstream {
  git fetch upstream
  git switch master
  git merge upstream/master
}
function update-upstream-main {
  git fetch upstream
  git switch main
  git merge upstream/main
}

function list-snapnodes {
  $store_number = $args[0] | ForEach-Object tostring 00000
  (aws ssm describe-instance-information --no-paginate --filters Key=tag:STORE_NUMBER,Values=$store_number | ConvertFrom-Json).InstanceInformationList | Where-Object {$_.PlatformType -eq 'Linux'}
}
function snap_session {
  $store_number = $args[0] | ForEach-Object67 tostring 00000
  $node_name    = $args[1]

  Write-Host "Connect using: snap_session 1234 snap-1"
  # Write-Host "Connecting to '${store_number}' and '${node_name}'"

  # Works in PS 5.1, doesn't in 7.3.1
  # IT WAS THE FREAKING COMMA - https://stackoverflow.com/questions/11990688/powershell-is-removing-comma-from-program-argument
  # Still need to understand why on the cli, it was fine, but in a script it was not.
  $raw = aws ssm describe-instance-information --no-paginate --filters Key=tag:STORE_NUMBER`,Values=$store_number

  $instanceId = (($raw | ConvertFrom-Json).InstanceInformationList | Where-Object {$_.PlatformType -eq 'Linux' -and $_.Name.startsWith($node_name)}).InstanceId
  aws ssm start-session --target $instanceId --document-name AWS-StartPortForwardingSession --parameters 'portNumber=[22],localPortNumber=[2222]'
}
function session_19999 {
  snap_session 19999 snap-3
}
# QA Labs
function session_19984 {
  # snap_session 19984 node3
  aws ssm start-session --target mi-0e5d4a8b6e336a2bd --document-name AWS-StartPortForwardingSession --parameters 'portNumber=[3389],localPortNumber=[3391]'
}



function gpr {
  git pull --rebase
}
function g {
  git status
}
function gwm {
  git sw main
}
function gsm {
  git sw main
}

# WSLENV, WT_PROFILE_ID, or WT_SESSION
If ([bool]($env:WT_Session)) {
  # Import-Module posh-git
  # Import-Module oh-my-posh

  if (-not(Test-Path -Path $env:POSH_THEMES_PATH/Predawn.terminal -PathType Leaf)) {
    # Invoke-WebRequest -Uri "https://raw.githubusercontent.com/jamiewilson/predawn-shell/master/Predawn.terminal" -OutFile "$env:POSH_THEMES_PATH/Predawn.terminal"
  }

  # https://ohmyposh.dev/docs/themes
  # oh-my-posh init pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
  # oh-my-posh init pwsh --config C:\Users\cgorshing\Documents\WindowsPowerShell\Modules\oh-my-posh\themes\cgorshing.omp.json | Invoke-Expression
  # oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/avit.omp.json" | Invoke-Expression
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/spaceship.omp.json" | Invoke-Expression
  # Export theme to make adjustments -> oh-my-posh config export --output ~/.mytheme.omp.json
}
Else {
  # function prompt { "$(Get-Location)`r`n$("+"*(Get-Location -Stack).Count)> " }
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
}

# Switch with F2 ... *but* doesn't work for me
# Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode 'Vi'
Set-PSReadLineOption -BellStyle None

# Tab completion:
#    MenuComplete    -> See a "ListView" of the hits, so you do see all available - https://docs.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline?view=powershell-7.2#menucomplete
#    TabCompleteNext -> Cycle through the hits, you don't see all the available hits - https://docs.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline?view=powershell-7.2#tabcompletenext
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
# Set-PSReadlineKeyHandler -Chord Tab -Function TabCompleteNext # default
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# This is an example of a macro that you might use to execute a command.
# This will add the command to history.
# https://github.com/laurentkempe/dotfiles/blob/master/PowerShell/Microsoft.PowerShell_profile.ps1
Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
                         -BriefDescription BuildCurrentDirectory `
                         -LongDescription "Build the current directory" `
                         -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

# From https://stackoverflow.com/questions/57705570/how-to-prevent-save-input-history-that-begins-with-a-space-in-powershell
Set-PSReadLineOption -AddToHistoryHandler {
    param($command)
    if ($command -like ' *' -or ($line.length -le 3 -and $line -match "^get-help|^help")) {
        return $false
    }
    # Add any other checks you want
    return $true
}

# Fzf
# Import-Module PSFzf
# Set-PsFzfOption -PreviewWindowHeight 0.5
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# From https://www.youtube.com/watch?v=5-aK2_WwrmM
function which ($command) {
  Get-Command $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}



Set-PSReadLineKeyHandler -Key Ctrl+Shift+Enter `
                         -BriefDescription ForwardCharAndAcceptNextSuggestionWord `
                         -LongDescription "accept suggestion and line" `
                         -ScriptBlock {
    param($key, $arg)

    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion($key, $arg)
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
# Set-PSReadLineKeyHandler -Function AcceptSuggestion -Chord ctrl+shift+enter # This does not work for me.

# Get-PSReadLineKeyHandler | where function -Match "accept"
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
# Set-PSReadLineOption -Colors @{ InlinePrediction = $PSStyle.Background.Green }

function hist { $find = $args; Write-Host "Finding in full history using {`$_ -like `"*$find*`"}"; Get-Content (Get-PSReadlineOption).HistorySavePath | ? {$_ -like "*$find*"} | Get-Unique }