return {
  "folke/snacks.nvim",
  --- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        grep = {
          hidden = true,
          ignored = true,
          exclude = { ".git", ".build", ".pytest_cache", "__pycache__", "venv" },
        },
        files = {
          hidden = true,
          ignored = true,
          exclude = { ".git", ".build", ".pytest_cache", "__pycache__", "venv" },
        },
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { ".git", ".build", ".pytest_cache", "__pycache__", "venv" },
        },
      },
      layout = {
        preset = "vertical",
      },
      formatters = {
        file = {
          truncate = 120, -- truncate the file path to (roughly) this length
        },
      },
    },
  },
}
