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
}
