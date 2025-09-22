Markdown Wrapping Tests (Headless Neovim)

- Purpose: Validate breakindent, hanging indent, and list-wrapping behavior for Markdown in a strict 80-char width.
- How to run:
  - Ensure headless Neovim is available as `nvim`.
  - Run ./tests/run-all.sh from the repo root.
- Fixtures:
  - bullet_wrap.in.md / bullet_wrap.out.md / bullet_wrap.expected.md
  - indented_paragraph.in.md / indented_paragraph.out.md / indented_paragraph.expected.md
  - numbered_wrap.* fixtures
  - checkbox_wrap.* fixtures
  - blockquote_wrap.* fixtures
  - nested_wrap.* fixtures
  - detailed_list.* fixtures
