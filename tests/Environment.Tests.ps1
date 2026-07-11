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

Describe 'Environment-scoped test data reaches the module tests' {
    # TEST_ENV_SECRET / TEST_ENV_VARIABLE exist ONLY in the "Testing" GitHub Environment
    # (not at repository level), so seeing them here proves the reusable workflow sourced
    # them from the environment binding rather than from a caller-provided TestData blob.
    It 'Exposes the environment secret as $env:TEST_ENV_SECRET' {
        $actual = [System.Environment]::GetEnvironmentVariable('TEST_ENV_SECRET')
        $actual | Should -Not -BeNullOrEmpty
        $actual | Should -BeExactly 'env-scoped-secret-fixture-value'
    }

    It 'Exposes the environment variable as $env:TEST_ENV_VARIABLE' {
        $actual = [System.Environment]::GetEnvironmentVariable('TEST_ENV_VARIABLE')
        $actual | Should -Not -BeNullOrEmpty
        $actual | Should -BeExactly 'env-scoped-variable-fixture-value'
    }

    It 'Masks the environment secret in the log even when a test prints it in plain text' {
        Write-Host "Secret in plain text:   $env:TEST_ENV_SECRET"
        Write-Host "Variable in plain text: $env:TEST_ENV_VARIABLE"
    }
}
