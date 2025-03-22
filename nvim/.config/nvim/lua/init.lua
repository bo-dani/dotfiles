vim.opt.hidden = true
vim.opt.grepprg = "rg --vimgrep --smart-case --follow"

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

vim.keymap.set("n", "<Up>", "<Nop>", { silent = True, remap = false })
vim.keymap.set("n", "<Down>", "<Nop>", { silent = True, remap = false })
vim.keymap.set("n", "<Right>", "<Nop>", { silent = True, remap = false })
vim.keymap.set("n", "<Left>", "<Nop>", { silent = True, remap = false })

-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' })
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
vim.call('plug#end')

require('telescope').load_extension('fzf')
require('lualine-config')
require('ibl').setup()
require('lspconfig').clangd.setup{}

vim.cmd('silent! colorscheme tokyonight')

-- Key bindings
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, { silent = true, desc = "Find files" })
vim.keymap.set('n', '<leader>f', builtin.live_grep, { silent = true, desc = "Search for a string in working directory" })
vim.keymap.set('n', '<leader>ff', builtin.grep_string, { silent = true, desc = "Search for the string under the cursor in working directory" })
vim.keymap.set('n', '<leader>b', builtin.buffers, { silent = true, })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { silent = true })
