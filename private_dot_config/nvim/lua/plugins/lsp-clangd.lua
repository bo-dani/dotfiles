return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--pretty",
          "--header-insertion=never",
          "-j=2",
          "--query-driver=/home/dama/repos/mozart/sdk/**/*-mozart-linux-g++,/home/dama/repos/mozart/sdk/**/*-mozart-linux-gcc",
          "--clang-tidy",
          "--compile-commands-dir=.",
        },
        filetypes = { "c", "cpp", "proto" },
        on_attach = function(client, bufnr)
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, nil)
          end
        end,
      },
    },
  },
}
