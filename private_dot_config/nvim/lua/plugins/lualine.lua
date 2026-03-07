return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "navarasu/onedark.nvim" },
  config = function()
    -- Load onedark theme colors
    require("onedark").setup()
    local colors = require("onedark.colors")

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "nord",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = {}, winbar = {} },
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          {
            "diff",
            colored = true,
            symbols = { added = "+", modified = "~", removed = "-" },
          },
        },
        lualine_c = {},
        lualine_x = {
          "searchcount",
          {
            "diagnostics",
            sources = { "nvim_diagnostic", "coc" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          "filetype",
          "encoding",
          "fileformat",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            show_modified_status = true,
            mode = 2,
            max_length = vim.o.columns * 2 / 3,
            symbols = {
              modified = " ●",
              alternate_file = "",
              directory = "",
            },
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            buffers_color = {
              active = { bg = colors.bg, fg = colors.white },
              inactive = { bg = colors.light_grey, fg = colors.bg },
            },
          },
        },
        lualine_b = { "" },
        lualine_c = { "" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
