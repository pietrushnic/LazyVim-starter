return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      openai_edit_params = {
        model = "gpt-4",
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {

    { "<leader>cc", "<cmd>ChatGPT<CR>", "ChatGPT", mode = { "n", "v" } },
    { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", "Edit code with instruction", mode = { "n", "v" } },
    { "<leader>cg", "<cmd>ChatGPTRun git_commit_msg<CR>", "Write git commit message", mode = { "n", "v" } },
    { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    { "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    { "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    { "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
    { "<leader>cG", "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
  },
}
