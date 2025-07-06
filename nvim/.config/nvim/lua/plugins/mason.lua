return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "pyright",  -- LSP
      "black",    -- Formatter
      "flake8",   -- Linter
      "mypy",     -- Type checker
      "isort",
      "pylint",
    })
  end,
}
