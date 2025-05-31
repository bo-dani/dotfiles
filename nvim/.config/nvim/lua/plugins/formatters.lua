return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Set formatters for C and C++
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      c = { "clang_format" },
      cpp = { "clang_format" },
    })
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      rust = { "rustfmt" },
    })
  end,
  keys = {
    {
      "<leader>F",
      function()
        require("conform").format({ async = true, lsp_fallback = false })
      end,
      desc = "Format file with conform.nvim",
    },
  },
}
