vim.opt.hidden = true
vim.opt.grepprg = "rg --vimgrep --smart-case --follow"

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

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
vim.call('plug#end')

vim.cmd('silent! colorscheme tokyonight')

-- Key bindings
-- Telescope
vim.keymap.set('n', '<leader>p', function() vim.cmd 'Telescope find_files' end, { silent = true, desc = "Find files" })
-- nnoremap <leader>f <cmd>Telescope find_files<cr>
-- nnoremap <leader>g <cmd>Telescope live_grep<cr>
-- nnoremap <leader>b <cmd>Telescope buffers<cr>
-- nnoremap <leader>h <cmd>Telescope help_tags<cr>
