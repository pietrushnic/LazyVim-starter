-- Markdown wrap preservation: keep indentation on wrapped lines
local o = vim.opt_local
o.wrap = true
o.linebreak = true
o.breakindent = true
o.breakindentopt = "shift:2,min:20"
o.showbreak = "↪ "
o.textwidth = 80
