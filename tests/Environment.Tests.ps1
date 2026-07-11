[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSReviewUnusedParameter', '',
    Justification = 'Required for Pester tests'
)]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Required for Pester tests'
)]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSAvoidUsingWriteHost', '',
    Justification = 'Deliberately prints the values to the log to demonstrate GitHub Actions masking'
)]
[CmdletBinding()]
param()

Describe 'TestData is pushed into the module tests' {
    It 'Exposes the secret from the "secrets" map' {
        $actual = [System.Environment]::GetEnvironmentVariable('TEST_SECRET')
        $actual | Should -Not -BeNullOrEmpty
        $actual | Should -BeExactly 'mariustestmodule-secret-fixture-value'
    }

    It 'Exposes the variable from the "variables" map' {
        $actual = [System.Environment]::GetEnvironmentVariable('TEST_VARIABLE')
        $actual | Should -Not -BeNullOrEmpty
        $actual | Should -BeExactly 'mariustestmodule-variable-fixture-value'
    }

    It 'Masks the secret in the log even when a test prints it in plain text' {
        Write-Host "Secret in plain text:   $env:TEST_SECRET"
        Write-Host "Variable in plain text: $env:TEST_VARIABLE"
    }
}
