function Get-Greeting {
    <#
        .SYNOPSIS
        Returns a greeting message.

        .DESCRIPTION
        Returns a simple greeting message for the specified time of day.
        Optionally includes the user's name in the greeting.

        .EXAMPLE
        Get-Greeting -TimeOfDay 'Morning'

        Returns "Good Morning!" to the user.

        .EXAMPLE
        Get-Greeting -TimeOfDay 'Evening'

        Returns "Good Evening!" to the user.

        .EXAMPLE
        Get-Greeting -TimeOfDay 'Morning' -Name 'Alice'

        Returns "Good Morning, Alice!" to the user.

        .LINK
        https://MariusStorhaug.github.io/MariusTestModule/Functions/Get-Greeting/
    #>
    [OutputType([string])]
    [CmdletBinding()]
    param (
        # The time of day for the greeting.
        [Parameter()]
        [ValidateSet('Morning', 'Afternoon', 'Evening')]
        [string] $TimeOfDay = 'Morning',

        # Optional name to include in the greeting.
        [Parameter()]
        [string] $Name
    )
    if ($Name) {
        "Good $TimeOfDay, $Name!"
    } else {
        "Good $TimeOfDay!"
    }
}
