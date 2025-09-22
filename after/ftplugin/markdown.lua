-- Markdown wrap preservation: keep indentation on wrapped lines
local o = vim.opt_local
o.wrap = true
o.linebreak = true
o.breakindent = true
o.breakindentopt = "shift:2,min:20,sbr"
o.showbreak = "↪ "
o.textwidth = 80
o.formatexpr = ""
-- Basic list wrapping guards for consistency
o.formatoptions:remove("a")
o.formatoptions:remove("t")
o.formatoptions:append("cqjnro2")
-- Removed: o.formatlistpat due to complexity in Lua long bracket; will reintroduce later with a safe delim
o.comments:append("b:*")
o.comments:append("b:-")
o.comments:append("b:+")
o.comments:append("n:>")
