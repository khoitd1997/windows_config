# used for setting up windows software

Write-Host "Starting Windows Configuration"

# app install and other setup
.\setup.sh

# create tasks to automatically update choco
$action = New-ScheduledTaskAction -Execute 'choco' -Argument 'upgrade all'

$trigger =  New-ScheduledTaskTrigger -AtLogon

$Stset = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "choco automatic upgrade" -Description "Automatically upgrade choco app" -RunLevel Highest -Settings $Stset