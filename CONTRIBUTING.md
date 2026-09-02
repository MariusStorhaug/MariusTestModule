# Contributing

Thank you for contributing to this module.
Read [`AGENTS.md`](AGENTS.md) first for the full guidance chain and documentation references.

## Before you start

1. Read [`README.md`](README.md) to understand what the module does.
2. Familiarize yourself with the [Repository Standard](https://github.com/PSModule/Process-PSModule/blob/main/docs/content/reference/repository-standard.md) that this repository must satisfy.
3. Check the open issues and pull requests to avoid duplicate work.

## Workflow

This project follows the [MSXOrg contribution workflow](https://msxorg.github.io/docs/Ways-of-Working/):

1. Open or pick up an issue that describes the change.
2. Create a branch from `main` following the `<type>/<issue>-<short-slug>` convention (for example `fix/42-token-scope`).
3. Make small, focused commits and push often.
4. Open a **draft PR** as soon as the change has a basic shape — early feedback is preferred.
5. Address review feedback, and file an issue for any out-of-scope findings rather than expanding the PR.
6. Mark the PR ready for review. It lands once the required checks pass and a reviewer approves.

## Pull requests

- Keep PRs small and focused on a single deliverable.
- Follow the [PR Format](https://msxorg.github.io/docs/Ways-of-Working/PR-Format/) for the title and description.
- The PR description becomes the release note, so write it for users of the module rather than for reviewers.
- Apply the label that sets the version bump: `Major`, `Minor`, `Patch`, or `NoRelease`. An unlabeled PR defaults to
  `Patch`. Add the `prerelease` label to publish a prerelease from the branch.

## Releases

Releases are produced by the [Process-PSModule](https://github.com/PSModule/Process-PSModule) pipeline, not by hand.
A merge to `main` publishes a stable release once the full pipeline passes; the version comes from the merged PR's
label and the release notes come from its description. See
[Versioning and releases](https://github.com/PSModule/Process-PSModule/blob/main/docs/content/guides/versioning-and-releases.md).

By default only changes under `src/` and to `README.md` trigger the build, test, and publish path. Changes limited to
other paths are still reviewed and merged, but do not create a release.

## Code standards

PowerShell in this module follows the
[PowerShell module standard](https://github.com/PSModule/Process-PSModule/blob/main/docs/content/reference/powershell-module-standard.md)
and the [MSXOrg Coding Standards](https://msxorg.github.io/docs/Coding-Standards/).

Run the tests locally before pushing:

```powershell
Invoke-Pester -Path tests -Output Detailed
```

Note that `tests/Environment.Tests.ps1` asserts values supplied by the CI workflow through `TestData`; it is expected
to fail locally unless the matching environment variables are set.

## Questions

Open a GitHub Discussion or file an issue if something is unclear.
