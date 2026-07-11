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

Describe 'TestData exposes all secrets and variables' {
    # EXPERIMENT: the calling workflow now passes every secret and every variable through the single
    # TestData object via toJSON(secrets)/toJSON(vars). Import-TestData (from Install-PSModuleHelpers)
    # exposes each entry as an environment variable. These tests iterate every environment variable
    # visible to the job and print it, so the job log shows exactly what reached the module tests.
    # GitHub Actions redacts any registered secret value to *** in the log; plain variables print
    # verbatim. Inspect the job log to see which names arrived and how they are rendered.

    It 'Iterates every environment variable and prints what the job can see' {
        $all = Get-ChildItem env: | Sort-Object Name
        Write-Host "===== BEGIN environment dump ($($all.Count) variables) ====="
        foreach ($entry in $all) {
            Write-Host ("{0} = {1}" -f $entry.Name, $entry.Value)
        }
        Write-Host '===== END environment dump ====='
        $all.Count | Should -BeGreaterThan 0
    }

    It 'Reports the fixture secret and variable arrived' {
        # These two fixtures are part of the full dump (a repo secret and a repo variable). If the
        # full enumeration worked, both are present; the secret prints as *** because it is masked.
        Write-Host "TEST_SECRET   = $env:TEST_SECRET"
        Write-Host "TEST_VARIABLE = $env:TEST_VARIABLE"
    }
}
