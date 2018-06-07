# notification pwsh

The stuff in this repo is used for creating the correct JSON payload which is required by appleboy/gorush.

## How to use

Create the notification:

````powershell
$NotificationSplat = @{
    Tokens = $receivers 
    Title = "Sonarr: $Event_Type" 
    Message = "$title" 
    Color =  $color
}

$notification = New-Notification @NotificationSplat
````

Then send the request to the Gorush server running somewhere (on your network).

````powershell
Invoke-WebRequest -Method Post -Uri $GorushUri -Body $notification -UseBasicParsing
````