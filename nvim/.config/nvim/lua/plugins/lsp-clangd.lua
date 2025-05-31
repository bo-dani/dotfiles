return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--pretty",
          "--background-index=false",
          "--suggest-missing-includes",
          "--query-driver=/usr/gcc-13.3/bin",
          "-j=1",
          "--clang-tidy",
          "--compile-commands-dir=.build",
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
