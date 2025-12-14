return {
  "folke/snacks.nvim",
  --- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  ---@type snacks.Config
  opts = {
    picker = {
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

