-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffer jumping
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, ":LualineBuffersJump " .. i .. "<CR>", { silent = true, desc = "Jump to buffer " .. i })
end
vim.keymap.set("n", "<leader>h", ":bprev<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { silent = true, desc = "Next buffer" })

-- Zen Mode
local zen = require('zen-mode')
vim.keymap.set('n', '<leader>z', zen.toggle, { silent = true, desc = "Toggle Zen mode" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    local keymap = vim.keymap.set
    local lsp = vim.lsp.buf
    local diag = vim.diagnostic

    keymap("n", "gD", lsp.declaration, opts)
    keymap("n", "gd", lsp.definition, opts)
    keymap("n", "K", lsp.hover, opts)
    keymap("n", "gi", lsp.implementation, opts)
    keymap("n", "<C-k>", lsp.signature_help, opts)
    keymap("n", "<space>wa", lsp.add_workspace_folder, opts)
    keymap("n", "<space>wr", lsp.remove_workspace_folder, opts)
    keymap("n", "<space>wl", function() print(vim.inspect(lsp.list_workspace_folders())) end, opts)
    keymap("n", "<space>D", lsp.type_definition, opts)
    keymap("n", "<space>rn", lsp.rename, opts)
    keymap("n", "gr", lsp.references, opts)
    keymap("n", "<space>e", diag.open_float, opts)
    keymap("n", "[d", diag.goto_prev, opts)
    keymap("n", "]d", diag.goto_next, opts)
    keymap("n", "<space>q", diag.setloclist, opts)
  end,
})
