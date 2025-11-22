<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies

<a id="define_browsers"></a>

## define_browsers

<pre>
load("@rules_playwright//playwright:repositories.bzl", "define_browsers")

define_browsers(<a href="#define_browsers-name">name</a>, <a href="#define_browsers-browser_integrity">browser_integrity</a>, <a href="#define_browsers-browsers_download_urls">browsers_download_urls</a>, <a href="#define_browsers-browsers_json">browsers_json</a>, <a href="#define_browsers-repo_mapping">repo_mapping</a>)
</pre>

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="define_browsers-name"></a>name |  A unique name for this repository.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="define_browsers-browser_integrity"></a>browser_integrity |  A dictionary of browser names to their integrity hashes   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  `{}`  |
| <a id="define_browsers-browsers_download_urls"></a>browsers_download_urls |  URLs to download playwright browsers from. Replace defaults if a mirror location is preferred.   | List of strings | optional |  `["https://playwright.azureedge.net", "https://playwright-akamai.azureedge.net", "https://playwright-verizon.azureedge.net"]`  |
| <a id="define_browsers-browsers_json"></a>browsers_json |  -   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  `None`  |
| <a id="define_browsers-repo_mapping"></a>repo_mapping |  In `WORKSPACE` context only: a dictionary from local repository name to global repository name. This allows controls over workspace dependency resolution for dependencies of this repository.<br><br>For example, an entry `"@foo": "@bar"` declares that, for any time this repository depends on `@foo` (such as a dependency on `@foo//some:target`, it should actually resolve that dependency within globally-declared `@bar` (`@bar//some:target`).<br><br>This attribute is _not_ supported in `MODULE.bazel` context (when invoking a repository rule inside a module extension's implementation function).   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  |


<a id="playwright_repository"></a>

## playwright_repository

<pre>
load("@rules_playwright//playwright:repositories.bzl", "playwright_repository")

playwright_repository(<a href="#playwright_repository-name">name</a>, <a href="#playwright_repository-browsers_json">browsers_json</a>, <a href="#playwright_repository-browsers_workspace_name_prefix">browsers_workspace_name_prefix</a>, <a href="#playwright_repository-playwright_version">playwright_version</a>,
                      <a href="#playwright_repository-playwright_version_from">playwright_version_from</a>, <a href="#playwright_repository-repo_mapping">repo_mapping</a>, <a href="#playwright_repository-rules_playwright_cannonical_name">rules_playwright_cannonical_name</a>)
</pre>

Fetch external tools needed for playwright toolchain

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="playwright_repository-name"></a>name |  A unique name for this repository.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="playwright_repository-browsers_json"></a>browsers_json |  The browsers.json file to use. For example https://unpkg.com/playwright-core@1.51.0/browsers.json   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  `None`  |
| <a id="playwright_repository-browsers_workspace_name_prefix"></a>browsers_workspace_name_prefix |  The namespace prefix used when defining browser workspace repositories.   | String | required |  |
| <a id="playwright_repository-playwright_version"></a>playwright_version |  The version of playwright to install   | String | optional |  `""`  |
| <a id="playwright_repository-playwright_version_from"></a>playwright_version_from |  The package.json file to use to find the version of playwright to install   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  `None`  |
| <a id="playwright_repository-repo_mapping"></a>repo_mapping |  In `WORKSPACE` context only: a dictionary from local repository name to global repository name. This allows controls over workspace dependency resolution for dependencies of this repository.<br><br>For example, an entry `"@foo": "@bar"` declares that, for any time this repository depends on `@foo` (such as a dependency on `@foo//some:target`, it should actually resolve that dependency within globally-declared `@bar` (`@bar//some:target`).<br><br>This attribute is _not_ supported in `MODULE.bazel` context (when invoking a repository rule inside a module extension's implementation function).   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  |
| <a id="playwright_repository-rules_playwright_cannonical_name"></a>rules_playwright_cannonical_name |  The cannonical name given to the rules_playwright repository. See https://bazel.build/external/module   | String | required |  |


