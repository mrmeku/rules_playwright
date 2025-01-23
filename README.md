# Rules playwright

## Toolchain details

For every browser within playwright-core/browsers.json we create an http_file to download the zip.

We do not extract the zip since we need to set the directory name to what playwrite expects:
`${browserName}-${revisionNumber}`

Each toolchain depends on the downloaded browsers it wants to extract.

For example, the toolchain for `mac-11-arm64` will depend on:

- `@rules_playwrite_chromium_mac-11-arm64//file`
- `@rules_playwrite_firefox_mac-11-arm64//file`
- `@rules_playwrite_webkit_mac-11-arm64//file`
- `@rules_playwrite_ffmpeg_mac-11-arm64//file`
- `@rules_playwrite_firefox-beta_mac-11-arm64//file`
- `@rules_playwmrmekuchromium-tip-of-tree_mac-11-arm64//file`

It will extract these browsers using `extract_browser`'s to the appropriate directory structure

```
/@playwrite-toolchain-mac-11-arm64
   /chromium-CHROMIUM_REVISION
   /firefox-FIREFOX_REVISION
   /webkit-WEBKIT_REVISION
   /ffmpeg-FFMPEG_REVISION
   /firefox-beta-FIREFOX_BETA_REVISION
   /chromium-tip-of-tree-CHROMIUM_TIP_OF_TREE_REVISION
```

Using the environment variable `PLAYWRIGHT_BROWSERS_PATH` playwright will be informed of the path to this directory and find the browsers it needs.

NOTE: Playwright uses two marker files `INSTALLATION_COMPLETE` and `DEPENDENCIES_VALIDATED` which may need to be created to trick it into thinking validation has been done.

It is important to ensure that the revision numbers that a specific version of playwright expects are present within the toolchain. Therefore users must provide the version of playwright to the toolchain so that it can fetch the corresponding browsers.json

Thus the toolchain accepts one of two attributes
mrmeku

- `browser_json_path`: Path to vendored in browsers.json file
- `playwright_version`: Version of playwright found in package.json file

```
playwright_toolchains(
   name = "playwright",
   playwright_version = "1.43.1",
)
```

Make sure the toolchain mirrors the directory structure under
/Users/mrmeku/Library/Caches/ms-playwright
chromium-1148/
DEPENDENCIES_VALIDATED: EMPTY FILE
INSTALLATION_COMPLETE: EMPTY MARKER FILE
chrome-mac: actual dir
ffmpeg-1010
webkit-2104
chromium_headless_shell-1148
firefox-1466

It will consume the npm dependency of playwright
to get the json file at
node_modules/.pnpm/playwright-core\@1.49.1/node_modules/playwright-core/browsers.json
and generate the external workspace needed by
the toolchain.

Steps are the following

- Copy browsers.json manually to repo
- Handcode what generated workspace should look like
- Create toolchain to consume generated workspace
- Make sure that playwright can run with toolchain
- Create rust binary which generates the workspace
- Generated workspace becomes a golden file test / reference
