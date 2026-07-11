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
    # SPIKE: touched so the change matches the ^src/ important-file pattern and the
    # module build + local test jobs run for this pull request.
    Write-Output "Hello, $Name!"
}
