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
    # This module is called CROSS-OWNER (MariusStorhaug personal account -> PSModule org).
    # GitHub only allows `secrets: inherit` within the same org/enterprise, so environment
    # SECRETS cannot flow to a cross-owner consumer. Environment VARIABLES flow regardless,
    # via the vars context, once the reusable workflow binds the test job to the environment.
    # TEST_ENV_VARIABLE exists ONLY in the "Testing" environment (not at repo level), so
    # seeing it here proves it was sourced from the environment.
    It 'Exposes the environment variable as $env:TEST_ENV_VARIABLE' {
        $actual = [System.Environment]::GetEnvironmentVariable('TEST_ENV_VARIABLE')
        $actual | Should -Not -BeNullOrEmpty
        $actual | Should -BeExactly 'env-scoped-variable-fixture-value'
    }

    # Environment secrets require `secrets: inherit` end-to-end, which is unavailable
    # cross-owner. A SAME-ORG consumer would drop the -Skip and this would pass (proven by
    # the env-probe* workflows in this repo, which show the secret reaching a reusable
    # workflow that is called with secrets: inherit and bound to the environment).
    It 'Exposes the environment secret as $env:TEST_ENV_SECRET (same-org callers only)' -Skip {
        $actual = [System.Environment]::GetEnvironmentVariable('TEST_ENV_SECRET')
        $actual | Should -BeExactly 'env-scoped-secret-fixture-value'
    }

    It 'Shows the environment variable in the log' {
        Write-Host "Variable in plain text: $env:TEST_ENV_VARIABLE"
    }
}
