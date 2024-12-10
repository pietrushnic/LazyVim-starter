local lspconfig = require("lspconfig")

lspconfig.harper_ls.setup({
  settings = {
    ["harper-ls"] = {
      fileDictPath = "~/.config/nvim/spell/",
    },
  },
})
