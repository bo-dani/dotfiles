-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 4-space tabs
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- When opening a new line and no filetype-specific indenting is enabled, keep
-- the same indent as the line you're currently on. Useful for READMEs, etc.
-- Autoindent (keeps the same indent on new lines)
-- Smartindent (reacts to syntax of the code you're editing)
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ruler = true
vim.opt.confirm = true
vim.opt.visualbell = true

-- Add EOL when saving a buffer
vim.opt.fixendofline = true
