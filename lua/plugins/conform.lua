return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      markdown = { "markdownlint" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "0" },
      },
      clang_format = {
        prepend_args = { "--style={BasedOnStyle: llvm, BreakArrays: true}" },
      },
      markdownlint = {
        prepend_args = { "-c .markdownlint.yaml" },
      },
    },
  },
}
