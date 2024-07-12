return {
  {
    "LazyVim/LazyVim",
    keys = {
      { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Gwrite", mode = { "n", "v" } },
      { "<leader>grc", "<cmd>Git rebase --continue<cr>", desc = "Git rebase --continue", mode = { "n", "v" } },
      { "<leader>grm", "<cmd>Git rm %<cr>", desc = "Git remove current buffer", mode = { "n", "v" } },
    },
  },
}
