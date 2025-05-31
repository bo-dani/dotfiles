return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    -- Setup
    fzf.setup({
      winopts = {
        height = 0.90,
        width = 0.90,
        row = 0.35,
        col = 0.50,
        border = "single",
        preview = {
          border = "single",
          wrap = false,
          vertical = "up:55%",
          horizontal = "right:60%",
          layout = "vertical",
        },
        treesitter = {
          enabled = true,
          fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
        },
      },
      keymap = {
        builtin = {
          ["<F4>"] = "toggle-preview",
        },
      },
      files = {
        prompt = "Files❯ ",
        git_icons = true,
        file_icons = true,
        color_icons = true,
        rg_opts = [[--color=never --hidden --files -g "!.git" --]],
        hidden = true,
        no_ignore = false,
      },
      grep = {
        prompt = "Search❯ ",
        input_prompt = "Search For❯ ",
        formatter = "path.filename_first",
        git_icons = true,
        file_icons = true,
        color_icons = true,
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob '!*.html' --glob '!*.js' -e",
        hidden = false,
        no_ignore = false,
      },
      buffers = {
        prompt = "Buffers❯ ",
        file_icons = true,
        color_icons = true,
        sort_lastused = true,
        show_unloaded = true,
        cwd_only = false,
        cwd = nil,
      },
    })
  end,
}
