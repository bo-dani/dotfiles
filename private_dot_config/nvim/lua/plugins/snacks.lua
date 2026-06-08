return {
  "folke/snacks.nvim",
  --- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  ---@type snacks.Config
  opts = {
    picker = {
      mappings = {
        ["<C-n>"] = "next",
        ["<C-p>"] = "prev",
        ["<CR>"]  = "confirm",
      },
      sources = {
        grep = {
          wo = {
            wrap = true,
          },
          hidden = true,
          exclude = { 
            ".git",
            ".build",
            ".pytest_cache",
            "__pycache__",
            "venv",
            "sdk",
            "images",
          },
        },
        files = {
          hidden = true,
          exclude = { 
            ".git",
            ".build",
            ".pytest_cache",
            "__pycache__",
            "venv",
            "sdk",
            "images",
          },
        },
        explorer = {
          hidden = true,
          exclude = { 
            ".git",
            ".build",
            ".pytest_cache",
            "__pycache__",
            "venv",
            "sdk",
            "images",
          },
        },
      },
      layout = {
        preset = "vertical",
        width = 0.8
      },
    },
  },
}
