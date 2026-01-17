function Get-PSModuleTest {
    <#
        .SYNOPSIS
        Performs tests on a module.

        .DESCRIPTION
        Performs tests on a module.

        .EXAMPLE
        ```pwsh
        Test-PSModule -Name 'World'
        ```

        "Hello, World!"

        .LINK
        https://MariusStorhaug.github.io/MariusTestModule/Functions/Get-PSModuleTest/
    #>
    [CmdletBinding()]
    param (
        # Name of the person to greet.
        [Parameter(Mandatory)]
        [string] $Name
    )
    Write-Output "Hello, $Name!"
}
