-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("conform").setup({
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.autoformat or vim.b[bufnr].autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
})
