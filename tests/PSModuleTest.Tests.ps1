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

    It 'Function: Get-CurrentDateTime - Default format' {
        $result = Get-CurrentDateTime
        $result | Should -Match '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$'
    }

    It 'Function: Get-CurrentDateTime - ISO8601 format' {
        $result = Get-CurrentDateTime -Format 'ISO8601'
        $result | Should -Match '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}'
    }

    It 'Function: Get-CurrentDateTime - Custom format' {
        $result = Get-CurrentDateTime -Format 'Custom' -CustomFormat 'yyyy'
        $result | Should -Be (Get-Date).ToString('yyyy')
    }

    It 'Function: Get-CurrentDateTime - Short format' {
        $result = Get-CurrentDateTime -Format 'Short'
        $result | Should -Not -BeNullOrEmpty
    }

    It 'Function: Get-CurrentDateTime - Long format' {
        $result = Get-CurrentDateTime -Format 'Long'
        $result | Should -Not -BeNullOrEmpty
    }
}
