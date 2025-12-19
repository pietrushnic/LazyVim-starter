-- Markdown-specific settings for proper list wrapping with gq
-- This file disables treesitter indent (which doesn't respect formatlistpat)
-- and uses Vim's native formatting instead.
--
-- References:
-- - https://github.com/nvim-treesitter/nvim-treesitter/issues/7541
--   (treesitter indent doesn't respect formatlistpat - won't fix)

local function setup_markdown_formatting()
  local o = vim.opt_local

  -- Disable treesitter indentation for markdown (it conflicts with formatlistpat)
  o.indentexpr = ""

  -- Clear LazyVim's formatexpr to use native gq formatting
  o.formatexpr = ""

  -- Visual soft-wrap settings (for display, not editing)
  o.wrap = true
  o.linebreak = true
  o.breakindent = true
  o.breakindentopt = "list:-1"

  -- Hard-wrap settings for gq formatting
  o.textwidth = 80

  -- Pattern for recognizing list items (bullets, numbers, nested)
  -- Matches: "- ", "* ", "+ ", "1. ", "10. ", "  - " (nested), etc.
  o.formatlistpat = [[^\s*\(\d\+[\.:)]\s\+\|[-*+]\s\+\)]]

  -- Format options:
  -- c = auto-wrap comments using textwidth
  -- q = allow formatting with gq
  -- j = remove comment leader when joining lines
  -- n = recognize numbered lists (uses formatlistpat)
  -- NOTE: No 't' or 'a' flags - we don't want auto-wrap while typing
  o.formatoptions = "cqjn"

  -- Minimal comments setting to avoid conflict with formatlistpat
  -- See: https://vimways.org/2018/formatting-lists-with-vim/
  o.comments = "n:>"
end

-- Apply settings now
setup_markdown_formatting()

-- Re-apply after all plugins load (some plugins override these settings)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = setup_markdown_formatting,
  group = vim.api.nvim_create_augroup("MarkdownFormatting", { clear = true }),
})
