function Get-CurrentDateTime {
    <#
        .SYNOPSIS
        Returns the current date and time in a specified format.

        .DESCRIPTION
        Returns the current date and time formatted according to the specified format string.
        Supports common format presets or custom format strings.

        .EXAMPLE
        Get-CurrentDateTime

        Returns the current date and time in the default format (yyyy-MM-dd HH:mm:ss).

        .LINK
        https://MariusStorhaug.github.io/MariusTestModule/Functions/Get-CurrentDateTime/
    #>
    [OutputType([string])]
    [CmdletBinding()]
    param (
        # The format preset to use for the date and time output.
        [Parameter()]
        [ValidateSet('Default', 'Short', 'Long', 'ISO8601', 'Custom')]
        [string] $Format = 'Default',

        # Custom format string when Format is set to 'Custom'.
        [Parameter()]
        [string] $CustomFormat = 'yyyy-MM-dd HH:mm:ss'
    )

    $currentDateTime = Get-Date

    switch ($Format) {
        'Default' {
            $currentDateTime.ToString('yyyy-MM-dd HH:mm:ss')
        }
        'Short' {
            $currentDateTime.ToShortDateString()
        }
        'Long' {
            $currentDateTime.ToLongDateString()
        }
        'ISO8601' {
            $currentDateTime.ToString('o')
        }
        'Custom' {
            $currentDateTime.ToString($CustomFormat)
        }
    }
}
