import { expect, test } from "@playwright/test";

test("basic test", async ({ page }) => {
  await page.setContent('<main data-test="ready">rules_playwright</main>');
  await expect(page.locator('[data-test="ready"]')).toHaveText("rules_playwright");
});
