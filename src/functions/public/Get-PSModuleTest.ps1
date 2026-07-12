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

# PSMA subfolder-action pipeline test (2026-07-12T21:48:17.0732000+02:00)
