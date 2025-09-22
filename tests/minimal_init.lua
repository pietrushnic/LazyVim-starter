-- Minimal Neovim init to isolate markdown ftplugin
vim.cmd([[set runtimepath^=~/.config/nvim/lua/plugins]])
vim.cmd([[filetype on]])
vim.cmd([[filetype plugin on]])
vim.cmd([[syntax on]])
vim.o.textwidth = 80
vim.o.swapfile = false
vim.bo[0].filetype = 'markdown'
vim.o.hidden = true
