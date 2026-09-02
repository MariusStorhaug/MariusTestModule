# Agents

## Main directive

Everything is a work in progress and can be improved.
If you find a problem or improvement, fix it if small; otherwise open an issue.

## What this repository is

`MariusTestModule` is a PowerShell module used to exercise the PSModule framework end to end. Changes here validate
that the [Process-PSModule](https://github.com/PSModule/Process-PSModule) pipeline behaves as documented, so treat the
CI/CD run as the primary output of the repository alongside the module itself.

## Repo guidance

- [`README.md`](README.md) — what the module does and how to use it.
- [`CONTRIBUTING.md`](CONTRIBUTING.md) — how to contribute to this repository.

## PSModule framework guidance

Repository structure, module source layout, and how the Process-PSModule workflow runs:

- [Get started](https://github.com/PSModule/Process-PSModule/tree/main/docs/content/get-started) — repository setup and first release.
- [Guides](https://github.com/PSModule/Process-PSModule/tree/main/docs/content/guides) — calling the workflow, configuring the pipeline, writing module tests, versioning.
- [Reference](https://github.com/PSModule/Process-PSModule/tree/main/docs/content/reference) — settings, pipeline stages, workflow inputs.
- [Repository Standard](https://github.com/PSModule/Process-PSModule/blob/main/docs/content/reference/repository-standard.md) — expected layout and required files.
- [PowerShell module standard](https://github.com/PSModule/Process-PSModule/blob/main/docs/content/reference/powershell-module-standard.md) — source layout and coding conventions.

## Org-wide guidance

- [Ways of Working](https://msxorg.github.io/docs/Ways-of-Working/) — contribution workflow, branching, PRs, issues.
- [PR Format](https://msxorg.github.io/docs/Ways-of-Working/PR-Format/) — pull request title and description format.
- [Coding Standards](https://msxorg.github.io/docs/Coding-Standards/) — language-level conventions.

## Working in this repository

- The caller workflow is [`.github/workflows/Process-PSModule.yml`](.github/workflows/Process-PSModule.yml). It calls the
  shared reusable workflow and is pinned to a commit SHA with the version tag in a trailing comment so Dependabot can
  update it. Do not replace the pin with a floating tag or branch.
- Pipeline behavior is configured in [`.github/PSModule.yml`](.github/PSModule.yml). Only override defaults the module
  actually needs.
- The documentation site is built by the framework from [`.github/zensical.toml`](.github/zensical.toml). Navigation
  state and `site_dir` are injected centrally during the build; keep this file to theme and metadata only.
- Tests live in `tests/`. `tests/Environment.Tests.ps1` asserts that the `TestData` secrets and variables the caller
  workflow passes reach the module test phases, so keep it in sync with the `TestData` block in the caller workflow.
