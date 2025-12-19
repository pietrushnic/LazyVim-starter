-- Minimal init for running plenary tests
-- This ensures the after/ftplugin files are loaded

-- Set runtime path to include our config
local config_path = vim.fn.expand("~/.config/nvim")
vim.opt.runtimepath:prepend(config_path)
vim.opt.runtimepath:append(config_path .. "/after")

-- Add plenary to runtime path (LazyVim stores it in lazy directory)
local plenary_path = vim.fn.stdpath("data") .. "/lazy/plenary.nvim"
vim.opt.runtimepath:prepend(plenary_path)

-- Enable filetype detection
vim.cmd("filetype plugin on")
vim.cmd("syntax on")

-- Disable swap files for tests
vim.opt.swapfile = false

-- Load plenary
require("plenary")
