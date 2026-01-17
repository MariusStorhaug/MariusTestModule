[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSReviewUnusedParameter', '',
    Justification = 'Required for Pester tests'
)]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Required for Pester tests'
)]
[CmdletBinding()]
param()

Describe 'Module' {
    It 'Function: Get-PSModuleTest' {
        Get-PSModuleTest -Name 'World' | Should -Be 'Hello, World!'
    }

    It 'Function: Get-Greeting - Default' {
        Get-Greeting | Should -Be 'Good Morning!'
    }

    It 'Function: Get-Greeting - Evening' {
        Get-Greeting -TimeOfDay 'Evening' | Should -Be 'Good Evening!'
    }
}
