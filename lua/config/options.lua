-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Performance optimizations for smooth scrolling
vim.opt.lazyredraw = false -- Keep false, true can cause issues with modern plugins
vim.opt.redrawtime = 10000 -- Increase time for syntax highlighting
vim.opt.updatetime = 250 -- Faster completion and git signs
vim.opt.timeoutlen = 300 -- Faster key sequence completion

-- Scrolling optimizations
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true -- Enable cursor line (if disabled, enable it back)

-- Reduce syntax sync for better performance
vim.opt.synmaxcol = 300 -- Only highlight first 300 columns

-- Show vertical line at column 120
vim.opt.colorcolumn = "120"
