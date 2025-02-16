#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

TAG=${GITHUB_REF_NAME}
# The prefix is chosen to match what GitHub generates for source archives
# This guarantees that users can easily switch from a released artifact to a source archive
# with minimal differences in their code (e.g. strip_prefix remains the same)
PREFIX="rules_playwright-${TAG:1}"
ARCHIVE="rules_playwright-$TAG.tar.gz"

# NB: configuration for 'git archive' is in /.gitattributes
git archive --format=tar --prefix=${PREFIX}/ ${TAG} | gzip > $ARCHIVE
SHA=$(shasum -a 256 $ARCHIVE | awk '{print $1}')

cat << EOF
## Using Bzlmod with Bazel 6 or greater

Add to your \`MODULE.bazel\` file:

\`\`\`starlark
bazel_dep(name = "rules_playwright", version = "${TAG:1}")

playwright = use_extension("@rules_playwright//playwright:extensions.bzl", "playwright")
playwright.repo(
    name = "playwright",
    playwright_version = "", # Match the exact version from your pnpm lock file of playwright-core
    browser_json = "", # Or vendor the browsers.json file from playwright core into your repo
)
use_repo(playwright, "playwright")
\`\`\`
EOF