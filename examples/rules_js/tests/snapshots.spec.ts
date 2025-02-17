/* eslint-disable notice/notice */

import { test, expect } from "@playwright/test";
import type { Page } from "@playwright/test";

test.describe.configure({ mode: "parallel" });

test.beforeEach(async ({ page }) => {
  await page.goto("/");
});

const TODO_ITEMS = [
  "buy some cheese",
  "feed the cat",
  "book a doctors appointment",
];

test.describe("Snapshots", () => {
  test("should look great", async ({ page }) => {
    await expect(page).toHaveScreenshot("loaded.png");
  });
});
