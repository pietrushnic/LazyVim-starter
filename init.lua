-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("conform").setup({
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.autoformat == false or vim.b[bufnr].autoformat == false then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
})

