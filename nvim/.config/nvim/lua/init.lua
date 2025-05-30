vim.opt.hidden = true

-- Space as mapleader
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

vim.keymap.set("n", "<Up>", "<Nop>", { silent = True, remap = false })
vim.keymap.set("n", "<Down>", "<Nop>", { silent = True, remap = false })
vim.keymap.set("n", "<Right>", "<Nop>", { silent = True, remap = false })
vim.keymap.set("n", "<Left>", "<Nop>", { silent = True, remap = false })

-- Cancel search highlighting
vim.keymap.set("n", "<esc><esc>", ":noh<CR><esc>", { noremap = true, silent = true })

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

vim.g.rustfmt_autosave = 1

-- Trim trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end
})

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

-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'Isrothy/neominimap.nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ibhagwan/fzf-lua'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'windwp/nvim-autopairs'
Plug 'RRethy/vim-illuminate'
Plug 'numToStr/Comment.nvim'
Plug 'danilamihailov/beacon.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'nordtheme/vim'
Plug 'f-person/git-blame.nvim'
Plug 'LazyVim/LazyVim'
vim.call('plug#end')

require('fzf-lua-config')
require('lualine-config')
require('lsp-config')
require('ibl').setup()
require('gitsigns').setup()
require("nvim-autopairs").setup {}
require('Comment').setup()
require('beacon').setup()

vim.cmd('silent! colorscheme onedark')

-- Key bindings

-- fzf-lua
local fzf_lua = require('fzf-lua')

vim.keymap.set('n', '<leader>p', fzf_lua.files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', fzf_lua.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', fzf_lua.lines, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', fzf_lua.live_grep, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ss", fzf_lua.grep_cword, { noremap = true, silent = true })

-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

-- Zenmode
local zen = require('zen-mode')
vim.keymap.set('n', '<leader>z', zen.toggle, { silent = true, desc = "Toggle Zen mode" })
