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
    # TEST_SECRET (from the "secrets" map, masked) and TEST_VARIABLE (from the "variables" map, not
    # masked) are public non-secret fixtures that exist only to prove the calling workflow can push
    # secrets and variables into the module test jobs. The calling workflow passes them through a
    # single TestData object and Import-TestData (from Install-PSModuleHelpers) exposes them as
    # environment variables; these tests confirm they arrive with the expected values.

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
        # Deliberately try to leak both values to the log with Write-Host. Because Import-TestData
        # registered the secret via ::add-mask::, GitHub Actions redacts it to *** in the log, while
        # the variable (not masked) is printed verbatim. Inspect the job log to see the difference.
        Write-Host "Secret in plain text:   $env:TEST_SECRET"
        Write-Host "Variable in plain text: $env:TEST_VARIABLE"
    }
}
