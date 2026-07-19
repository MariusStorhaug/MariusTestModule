# Home

<style>
  .md-tabs {
    display: none !important;
  }
</style>
<!-- Navigation behavior update marker -->
<script>
  (() => {
    const storageKey = "zensical-nav-state-v1";
    let lastSignature = "";

    const getToggles = () =>
      Array.from(document.querySelectorAll("input.md-nav__toggle.md-toggle[id]"));

    const getPrimaryList = () =>
      document.querySelector("nav.md-nav--primary > ul.md-nav__list");

    const applyDefaultTopLevelState = (toggles) => {
      const primaryList = getPrimaryList();
      if (!primaryList) {
        return;
      }

      const topLevelToggles = Array.from(
        primaryList.querySelectorAll(":scope > li > input.md-nav__toggle.md-toggle[id]")
      );
      const topLevelIds = new Set(topLevelToggles.map((toggle) => toggle.id));

      for (const toggle of toggles) {
        toggle.checked = topLevelIds.has(toggle.id);
      }
    };

    const restoreState = (toggles) => {
      const raw = localStorage.getItem(storageKey);
      if (!raw) {
        applyDefaultTopLevelState(toggles);
        return;
      }

      try {
        const state = JSON.parse(raw);
        for (const toggle of toggles) {
          if (Object.prototype.hasOwnProperty.call(state, toggle.id)) {
            toggle.checked = !!state[toggle.id];
          }
        }
      } catch {
        applyDefaultTopLevelState(toggles);
      }
    };

    const persistState = (toggles) => {
      const state = {};
      for (const toggle of toggles) {
        state[toggle.id] = !!toggle.checked;
      }
      localStorage.setItem(storageKey, JSON.stringify(state));
    };

    const initialize = () => {
      const toggles = getToggles();
      if (toggles.length === 0) {
        return;
      }

      const signature = toggles.map((toggle) => toggle.id).join("|");
      if (signature === lastSignature) {
        return;
      }

      lastSignature = signature;
      restoreState(toggles);
      for (const toggle of toggles) {
        if (toggle.dataset.navStateBound === "true") {
          continue;
        }

        toggle.dataset.navStateBound = "true";
        toggle.addEventListener("change", () => persistState(getToggles()));
      }
    };

    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", initialize, { once: true });
    } else {
      initialize();
    }

    setInterval(initialize, 500);
  })();
</script>

{{ DESCRIPTION }}

## Prerequisites

This uses the following external resources:
- The [PSModule framework](https://github.com/PSModule) for building, testing and publishing the module.

## Installation

To install the module from the PowerShell Gallery, you can use the following command:

```powershell
Install-PSResource -Name {{ NAME }}
Import-Module -Name {{ NAME }}
```

## Usage

Here is a list of example that are typical use cases for the module.

### Example 1: Greet an entity

Provide examples for typical commands that a user would like to do with the module.

```powershell
Greet-Entity -Name 'World'
Hello, World!
```

### Example 2

Provide examples for typical commands that a user would like to do with the module.

```powershell
Import-Module -Name PSModuleTemplate
```

### Find more examples

To find more examples of how to use the module, please refer to the [examples](examples) folder.

Alternatively, you can use the Get-Command -Module 'This module' to find more commands that are available in the module.
To find examples of each of the commands you can use Get-Help -Examples 'CommandName'.

## Documentation

Link to further documentation if available, or describe where in the repository users can find more detailed documentation about
the module's functions and features.

## Contributing

Coder or not, you can contribute to the project! We welcome all contributions.

### For Users

If you don't code, you still sit on valuable information that can make this project even better. If you experience that the
product does unexpected things, throw errors or is missing functionality, you can help by submitting bugs and feature requests.
Please see the issues tab on this project and submit a new issue that matches your needs.

### For Developers

If you do code, we'd love to have your contributions. Please read the [Contribution guidelines](CONTRIBUTING.md) for more information.
You can either help by picking up an existing issue or submit a new one if you have an idea for a new feature or improvement.

## Acknowledgements

Here is a list of people and projects that helped this project in some way.

Validation marker: docs publish verification run at 2026-07-18 22:41:56Z.
