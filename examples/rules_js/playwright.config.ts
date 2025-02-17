// @ts-check
import { defineConfig, devices } from "@playwright/test";
import { join } from "node:path";

console.log(process.env.PWD, process.env.TEST_SERVER);

/**
 * @see https://playwright.dev/docs/test-configuration
 */
export default defineConfig({
  testDir: "./tests",

  snapshotDir: process.env.UPDATE_SNAPSHOTS
    ? join(process.env.BUILD_WORKSPACE_DIRECTORY!, "tests")
    : "tests",

  expect: {
    toHaveScreenshot: {
      animations: "disabled",
      caret: "hide",
      threshold: 0.02,
    },
  },

  /* Run tests in files in parallel */
  fullyParallel: true,
  /* Fail the build on CI if you accidentally left test.only in the source code. */
  forbidOnly: !!process.env.CI,
  /* Retry on CI only */
  retries: process.env.CI ? 2 : 0,
  /* Opt out of parallel tests on CI. */
  workers: process.env.CI ? 1 : undefined,
  /* Reporter to use. See https://playwright.dev/docs/test-reporters */
  reporter: process.env.CI ? "list" : "html",
  // globalSetup: "./global-setup",
  webServer: {
    command: `./${process.env.TEST_SERVER}`,
    port: 1234,
    reuseExistingServer: false,
  },
  /* Shared settings for all the projects below. See https://playwright.dev/docs/api/class-testoptions. */
  use: {
    /* Collect trace when retrying the failed test. See https://playwright.dev/docs/trace-viewer */
    trace: "on-first-retry",
  },
  /* Configure projects for major browsers */
  projects: [
    {
      name: "chromium",
      use: { ...devices["Desktop Chrome"] },
    },

    {
      name: "firefox",
      use: { ...devices["Desktop Firefox"] },
    },

    {
      name: "webkit",
      use: { ...devices["Desktop Safari"] },
    },
  ],
});
