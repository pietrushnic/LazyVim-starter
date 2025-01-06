return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.harper_ls.setup({
      settings = {
        ["harper-ls"] = {
          fileDictPath = "~/.config/nvim/spell/",
          userDictPath = "~/.config/nvim/spell/en.utf-8.add",
        },
      },
    })
  end,
}
