import { test, expect } from "@playwright/test";

test("basic test", async ({ page }) => {
  await page.goto("https://bazel.build/");
  await expect(page.getByText("{ Fast, Correct } — Choose two").first()).toBeVisible();
});
