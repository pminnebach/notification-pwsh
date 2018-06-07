[pscustomobject]@{ 
    SmtpServer = "<email server>"
    To = "<receiver email>"
    From = "<sender email>"
    Uri = "<url of gorush endpoint>"
} | ConvertTo-Json | 
    Out-File .\config.json
