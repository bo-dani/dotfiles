return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "simrat39/rust-tools.nvim",
  },
  opts = {
    setup = {
      rust_analyzer = function(_, opts)
        require("rust-tools").setup({
          server = opts,
          tools = {
            inlay_hints = {
              auto = true,
              only_current_line = false,
              show_parameter_hints = true,
              parameter_hints_prefix = "<- ",
              other_hints_prefix = "=> ",
            },
          },
        })
      end,
    },
  },
}
