Function Invoke-UrlEncode
{
    [cmdletbinding()]
    Param
    (
        [Parameter(ValueFromPipeline)]
        [ValidateScript({$_ -is [string]})]
        [string]$String
    )

    Begin
    {
        $time = [System.Diagnostics.Stopwatch]::StartNew()
        $msg = " [ {0:N4}  Begin   ]  {1} initializing..." -f $time.Elapsed.TotalSeconds,$MyInvocation.MyCommand.Name
        Write-Verbose $msg
        $msg = " [ {0:N4}  Begin   ]  Adding assembly {1}" -f $time.Elapsed.TotalSeconds,'System.Web'
        Write-Verbose $msg
        add-type -AssemblyName system.web
    }

    Process
    {
        $msg = " [ {0:N4}  Process ]  Encoding {1} characters" -f $time.Elapsed.TotalSeconds,($String.ToCharArray().count)
        Write-Verbose $msg

        $out = [System.Web.HttpUtility]::UrlEncode($String)
        Write-Output $out
    }

    End
    {
        $msg = " [ {0:N4}  End     ]  {1} completed." -f $time.Elapsed.TotalSeconds,$MyInvocation.MyCommand.Name
        Write-Verbose $msg
    }
}
