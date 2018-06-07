function New-Notification {
    [CmdletBinding()]
    [OutputType([String])]
    
    Param(
        [Parameter(Mandatory=$true)]
        [string[]]$Tokens,

        [Parameter(Mandatory=$true)]
        [string]$Title,

        [Parameter(Mandatory=$true)]
        [string]$Message,

        [Parameter(Mandatory=$false)]
        [string]$Icon="myicon",

        [Parameter(Mandatory=$false)]
        [string]$Color="#00ff00",

        [Parameter(Mandatory=$false)]
        [switch]$Sound
    )
    
    $notification = [PSCustomObject]@{
            "notifications" = @(
                @{
                    "tokens" = $Tokens
                    "platform" = 2
                    "title" = "$Title"
                    "message" = "$Message"
                    "notification" = [PSCustomObject]@{
                        "icon" = "$Icon"
                        "color" = "$Color"
                    }
                }
            )
        }
    
    if ($Sound) {
        $notification.notifications[0].Add("sound","default")
    }

    Write-Verbose $Sound
            
    $notification | ConvertTo-Json  -Depth 4    
}