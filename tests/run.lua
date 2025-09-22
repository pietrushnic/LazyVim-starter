-- Runner using scratch buffer for fixture, apply wrapping, and emit output
local M = {}
function M.run(infile, outfile)
  -- Open a new scratch buffer
  vim.cmd('enew')
  vim.bo.buftype = 'nowrite'
  vim.bo.modifiable = true
  vim.bo.swapfile = false
  -- Read fixture into buffer without altering file on disk
  vim.cmd('0read ' .. vim.fn.fnameescape(infile))
  -- Ensure we operate on a single, clean buffer: start at top, apply gqap
  vim.cmd('normal! gg')
  pcall(vim.cmd, 'normal! gqap')
  -- Get wrapped content as lines
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  -- Write to outfile in header format
  local header = {"<file>"}
  local trailing_blanks = 0
  for i = #lines, 1, -1 do
    if lines[i] == "" then trailing_blanks = trailing_blanks + 1 else break end
  end
  for i, line in ipairs(lines) do
    header[#header+1] = string.format("%05d| %s", i, line)
  end
  for i = 1, trailing_blanks do
    header[#header+1] = ""
  end
  header[#header+1] = "</file>"
  vim.fn.writefile(header, outfile)
end
return M
