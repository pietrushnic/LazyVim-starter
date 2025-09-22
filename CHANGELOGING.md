# CHANGELOG - Markdown wrap tests

This commit adds a headless test harness for Markdown wrapping, and progressively tunes the Markdown ftplugin to handle breakindent, hanging indentation, and complex list patterns. Tests include bullet, checkbox, blockquote, nested, and numbered lists to ensure gq wrapping behaves as expected under 80-char width. The fixture outputs reflect wrapped forms and help verify diffs during CI runs.
