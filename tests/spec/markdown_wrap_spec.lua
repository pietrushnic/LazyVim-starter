-- Plenary busted tests for markdown wrapping configuration
-- Run with: ~/.config/nvim/tests/run_tests.sh

describe("markdown wrapping configuration", function()
  local test_buf

  before_each(function()
    -- Create a new buffer and set filetype to markdown
    test_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(test_buf)
    vim.bo[test_buf].filetype = "markdown"
    -- Force ftplugin to load
    vim.cmd("doautocmd FileType markdown")
    -- Trigger BufEnter to apply our settings (overrides plugins)
    vim.cmd("doautocmd BufEnter")
  end)

  after_each(function()
    if vim.api.nvim_buf_is_valid(test_buf) then
      vim.api.nvim_buf_delete(test_buf, { force = true })
    end
  end)

  describe("option values", function()
    it("should disable treesitter indentexpr", function()
      assert.equals("", vim.bo.indentexpr)
    end)

    it("should clear formatexpr", function()
      assert.equals("", vim.bo.formatexpr)
    end)

    it("should enable wrap", function()
      assert.is_true(vim.wo.wrap)
    end)

    it("should enable linebreak", function()
      assert.is_true(vim.wo.linebreak)
    end)

    it("should enable breakindent", function()
      assert.is_true(vim.wo.breakindent)
    end)

    it("should set breakindentopt to list:-1", function()
      assert.equals("list:-1", vim.wo.breakindentopt)
    end)

    it("should set textwidth to 80", function()
      assert.equals(80, vim.bo.textwidth)
    end)

    it("should have formatlistpat set", function()
      local flp = vim.bo.formatlistpat
      assert.is_not_nil(flp)
      assert.is_true(#flp > 0)
    end)

    it("should have minimal comments setting", function()
      assert.equals("n:>", vim.bo.comments)
    end)
  end)

  describe("formatlistpat matching", function()
    local function matches_formatlistpat(text)
      local pattern = vim.bo.formatlistpat
      return vim.fn.match(text, pattern) >= 0
    end

    it("should match simple bullet '- '", function()
      assert.is_true(matches_formatlistpat("- item"))
    end)

    it("should match asterisk bullet '* '", function()
      assert.is_true(matches_formatlistpat("* item"))
    end)

    it("should match plus bullet '+ '", function()
      assert.is_true(matches_formatlistpat("+ item"))
    end)

    it("should match numbered list '1. '", function()
      assert.is_true(matches_formatlistpat("1. item"))
    end)

    it("should match multi-digit numbered list '10. '", function()
      assert.is_true(matches_formatlistpat("10. item"))
    end)

    it("should match indented bullet '  - '", function()
      assert.is_true(matches_formatlistpat("  - item"))
    end)
  end)

  describe("gq formatting behavior", function()
    it("should wrap long bullet item with 2-space indent", function()
      local long_line = "- " .. string.rep("word ", 20)
      vim.api.nvim_buf_set_lines(test_buf, 0, -1, false, { long_line })
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
      vim.cmd("normal! gqq")

      local lines = vim.api.nvim_buf_get_lines(test_buf, 0, -1, false)
      assert.is_true(#lines > 1, "Line should have wrapped")
      assert.is_true(lines[1]:match("^%- ") ~= nil)
      if lines[2] and lines[2] ~= "" then
        assert.is_true(lines[2]:match("^  %S") ~= nil,
          "Continuation should be indented by 2 spaces, got: '" .. lines[2] .. "'")
      end
    end)

    it("should wrap long numbered item with 3-space indent", function()
      local long_line = "1. " .. string.rep("word ", 20)
      vim.api.nvim_buf_set_lines(test_buf, 0, -1, false, { long_line })
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
      vim.cmd("normal! gqq")

      local lines = vim.api.nvim_buf_get_lines(test_buf, 0, -1, false)
      assert.is_true(#lines > 1, "Line should have wrapped")
      assert.is_true(lines[1]:match("^1%. ") ~= nil)
      if lines[2] and lines[2] ~= "" then
        assert.is_true(lines[2]:match("^   %S") ~= nil,
          "Continuation should be indented by 3 spaces, got: '" .. lines[2] .. "'")
      end
    end)

    it("should preserve nested bullet and use 4-space indent", function()
      local long_line = "  - " .. string.rep("word ", 20)
      vim.api.nvim_buf_set_lines(test_buf, 0, -1, false, { long_line })
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
      vim.cmd("normal! gqq")

      local lines = vim.api.nvim_buf_get_lines(test_buf, 0, -1, false)
      assert.is_true(#lines > 1, "Line should have wrapped")
      assert.is_true(lines[1]:match("^  %- ") ~= nil)
      if lines[2] and lines[2] ~= "" then
        assert.is_true(lines[2]:match("^    %S") ~= nil,
          "Nested continuation should be indented by 4 spaces, got: '" .. lines[2] .. "'")
      end
    end)

    it("should handle multi-digit numbers with 4-space indent", function()
      local long_line = "10. " .. string.rep("word ", 20)
      vim.api.nvim_buf_set_lines(test_buf, 0, -1, false, { long_line })
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
      vim.cmd("normal! gqq")

      local lines = vim.api.nvim_buf_get_lines(test_buf, 0, -1, false)
      assert.is_true(#lines > 1, "Line should have wrapped")
      assert.is_true(lines[1]:match("^10%. ") ~= nil)
      if lines[2] and lines[2] ~= "" then
        assert.is_true(lines[2]:match("^    %S") ~= nil,
          "Continuation should be indented by 4 spaces, got: '" .. lines[2] .. "'")
      end
    end)

    it("should keep separate list items separate when formatting multiple", function()
      vim.api.nvim_buf_set_lines(test_buf, 0, -1, false, {
        "- First item with text",
        "",
        "- Second item with text",
      })
      vim.api.nvim_win_set_cursor(0, { 1, 0 })
      vim.cmd("normal! VGgq")

      local lines = vim.api.nvim_buf_get_lines(test_buf, 0, -1, false)
      assert.equals(3, #lines)
      assert.is_true(lines[1]:match("^%- First") ~= nil)
      assert.equals("", lines[2])
      assert.is_true(lines[3]:match("^%- Second") ~= nil)
    end)
  end)
end)
