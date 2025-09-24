-- Markdown wrap preservation: keep indentation on wrapped lines
local o = vim.opt_local
o.wrap = true
o.linebreak = true
o.breakindent = true
o.breakindentopt = "shift:2,min:20,sbr"
o.showbreak = "↪ "
o.textwidth = 80
o.formatexpr = ""
-- Restore robust format list recognition (bullets, numbers, checkboxes)
-- and preserve hanging indentation across wrapped lines
o.formatoptions:remove("a")
o.formatoptions:remove("t")
o.formatoptions:append("cqjnro2")
-- a best-effort, safe delimiter for the regex to avoid Lua string issues
-- This helps Markdown lists wrap without swallowing content
o.formatlistpat = [[^\s*\%([0-9]\+\.[^ ]*\)\|\%([ivxlIVXL]+\)\|[-*+]\)\s\+\%([\[][^[\]]*\]\s\+)\?]]
o.comments:append("b:*")
o.comments:append("b:-")
o.comments:append("b:+")
o.comments:append("n:>")
