vim.opt.hidden = true
vim.opt.grepprg = "rg --vimgrep --smart-case --follow"

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
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h" },
  callback = function()
    vim.bo.tabstop = 4 -- Number of spaces a <Tab> counts for
    vim.bo.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
    vim.bo.expandtab = true -- Use spaces instead of tabs
  end,
})

-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'Isrothy/neominimap.nvim'
Plug 'tpope/vim-sensible'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' })
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
vim.call('plug#end')

require('telescope').load_extension('fzf')
require('lualine-config')
require('lsp-config')
require('ibl').setup()
require('gitsigns').setup()
require("nvim-autopairs").setup {}
require('Comment').setup()
require('beacon').setup()

vim.cmd('silent! colorscheme onedark')

-- Key bindings
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, { silent = true, desc = "Find files" })
vim.keymap.set('n', '<leader>s', builtin.live_grep, { silent = true, desc = "Search for a string in working directory" })
vim.keymap.set('n', '<leader>ss', builtin.grep_string, { silent = true, desc = "Search for the string under the cursor in working directory" })
vim.keymap.set('n', '<leader>b', builtin.buffers, { silent = true, })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { silent = true })

local telescope = require('telescope')
telescope.setup({
  pickers = {
    find_files = {
      hidden = true,
      find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    }
  }
})

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
