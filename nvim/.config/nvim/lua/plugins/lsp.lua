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
          "--background-index=false",
          "--suggest-missing-includes",
          "--query-driver=/usr/share/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-gcc,/usr/share/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-g++",
          "-j=1",
          "--clang-tidy",
          "--compile-commands-dir=.build",
        },
        filetypes = { "c", "cpp", "hpp" },
        on_attach = function(client, bufnr)
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, nil)
          end
        end,
      },
    },
  },
}
