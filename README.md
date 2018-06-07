# notification-pwsh

The stuff in this repo is used for creating the correct JSON payload which is required by appleboy/gorush.

## How to use

### Create the notification

````powershell
$NotificationSplat = @{
    Tokens = $Tokens 
    Title = "$Title" 
    Message = "$Message" 
    Color =  $color
}

$notification = New-Notification @NotificationSplat
````

`$Tokens` should be an array of all the tokens of devices you want to send the message to.

`$color` should be the hex value of a color you want the notification icon to be in the notification drawer. This should include the pound `#` symbol.

By default all notifications are silent. But you can add the `-sound` parameter to play the default sound when you receive a notification.

### Send notification to gorush

````powershell
Invoke-WebRequest -Method Post -Uri $GorushUri -Body $notification -UseBasicParsing
````