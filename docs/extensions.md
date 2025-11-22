<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Extensions for bzlmod.

Installs a playwright toolchain.
Every module can define a toolchain version under the default name, "playwright".
The latest of those versions will be selected (the rest discarded),
and will always be registered by rules_playwright.

Additionally, the root module can define arbitrarily many more toolchain versions under different
names (the latest version will be picked for each name) and can register them as it sees fit,
effectively overriding the default named toolchain due to toolchain resolution precedence.

<a id="playwright"></a>

## playwright

<pre>
playwright = use_extension("@rules_playwright//playwright:extensions.bzl", "playwright")
playwright.repo(<a href="#playwright.repo-name">name</a>, <a href="#playwright.repo-browsers_download_urls">browsers_download_urls</a>, <a href="#playwright.repo-browsers_json">browsers_json</a>, <a href="#playwright.repo-integrity_map">integrity_map</a>, <a href="#playwright.repo-integrity_path_map">integrity_path_map</a>,
                <a href="#playwright.repo-playwright_version">playwright_version</a>)
</pre>


**TAG CLASSES**

<a id="playwright.repo"></a>

### repo

**Attributes**

| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="playwright.repo-name"></a>name |  Base name for generated repositories, allowing more than one playwright toolchain to be registered. Overriding the default is only permitted in the root module.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | optional |  `"playwright"`  |
| <a id="playwright.repo-browsers_download_urls"></a>browsers_download_urls |  URLs to download playwright browsers from. Replace defaults if a mirror location is preferred.   | List of strings | optional |  `["https://playwright.azureedge.net", "https://playwright-akamai.azureedge.net", "https://playwright-verizon.azureedge.net"]`  |
| <a id="playwright.repo-browsers_json"></a>browsers_json |  Alternative to playwright_version. Skips downloading from unpkg   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  `None`  |
| <a id="playwright.repo-integrity_map"></a>integrity_map |  Deprecated: Mapping from brower target to integrity hash   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  `{}`  |
| <a id="playwright.repo-integrity_path_map"></a>integrity_path_map |  Mapping from browser path to integrity hash   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  `{}`  |
| <a id="playwright.repo-playwright_version"></a>playwright_version |  Explicit version of playwright to download browsers.json from   | String | optional |  `""`  |


