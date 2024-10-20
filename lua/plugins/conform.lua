return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      markdown = { "prettier", "markdownlint", "codespell" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "0" },
      },
      clang_format = {
        prepend_args = { "--style={BasedOnStyle: llvm, BreakArrays: true}" },
      },
      markdownlint = {
        prepend_args = { "--config .markdownlint.yaml" },
        cwd = require("conform.util").root_file({ ".markdownlint.yaml" }),
      },
      prettier = {
        cwd = require("conform.util").root_file({ ".markdownlint.yaml", ".prettierrc" }),
      },
    },
  },
}
