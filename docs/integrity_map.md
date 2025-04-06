<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Small rule which unzip a browser to a tree artifact using bash.

<a id="playwright_integrity_map"></a>

## playwright_integrity_map

<pre>
load("@rules_playwright//playwright/private:integrity_map.bzl", "playwright_integrity_map")

playwright_integrity_map(<a href="#playwright_integrity_map-name">name</a>, <a href="#playwright_integrity_map-browsers">browsers</a>, <a href="#playwright_integrity_map-output">output</a>, <a href="#playwright_integrity_map-silent">silent</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="playwright_integrity_map-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="playwright_integrity_map-browsers"></a>browsers |  A list of browser targets to generate integrity values for.<br><br>These targets should usually be the result of the playwright_browser_matrix() function, which creates a cross-product of browser names and platforms. Each target must provide the UnzippedBrowserInfo provider.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |
| <a id="playwright_integrity_map-output"></a>output |  The name of the output file to create containing the integrity map.<br><br>This file will contain the generated integrity values for the specified browsers. Defaults to "target_name.json"   | String | optional |  `""`  |
| <a id="playwright_integrity_map-silent"></a>silent |  Whether to suppress debug information output.<br><br>When set to False (default), the rule will print integrity information that users would typically copy and paste into their MODULE.bazel or WORKSPACE file. Set to True to prevent this debug output from being printed.   | Boolean | optional |  `False`  |


<a id="playwright_browser_matrix"></a>

## playwright_browser_matrix

<pre>
load("@rules_playwright//playwright/private:integrity_map.bzl", "playwright_browser_matrix")

playwright_browser_matrix(<a href="#playwright_browser_matrix-playright_repo_name">playright_repo_name</a>, <a href="#playwright_browser_matrix-platforms">platforms</a>, <a href="#playwright_browser_matrix-browser_names">browser_names</a>)
</pre>

Generates a list of Bazel target labels for browser dependencies.

This function creates a cross-product of browser names and platforms, constructing
the appropriate Bazel target labels for each combination.

"@{playright_repo_name}//browsers:{browser_name}-{platform}"


**PARAMETERS**


| Name  | Description | Default Value |
| :------------- | :------------- | :------------- |
| <a id="playwright_browser_matrix-playright_repo_name"></a>playright_repo_name |  The name of the Playwright repository.   |  none |
| <a id="playwright_browser_matrix-platforms"></a>platforms |  A list of platform identifiers (e.g., ['mac14-arm', 'ubuntu20.04-x64]).   |  none |
| <a id="playwright_browser_matrix-browser_names"></a>browser_names |  A list of browser names (e.g., ['chromium', 'firefox']).   |  none |

**RETURNS**

A list of browser labels to be used as the browsers attribute of the integrity_map rule.


