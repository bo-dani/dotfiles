-- See vimrc for hotkeys and custom "Rgu" commands

require('fzf-lua').setup({
    winopts = {
        height         = 0.90,
        width          = 0.90,
        row            = 0.35,
        col            = 0.50,
        border         = "single", -- none/single/double/rounded/solid/shadow
        treesitter     = {
            enabled    = true,
            fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
        },
        preview = {
            -- hidden         = false, -- uncomment to start with the preview hidden
            border     = "single", -- none/single/double/rounded/solid/shadow
            wrap       = false,
            vertical   = "up:55%",
            horizontal = "right:60%",
            layout     = "vertical",
        },
    },
    keymap = {
        builtin = {
            true, -- inherit defaults, aside from what is set here
            ["<F4>"] = "toggle-preview",
        },
    },
    -- actions: has good default keymaps such as ctrl-v for vertical split the file from a search
    -- previewers: options for builtin
    files = {
        prompt      = 'Files❯ ',
        git_icons   = true,
        file_icons  = true,
        color_icons = true,
        rg_opts     = [[--color=never --hidden --files -g "!.git" --]],
        hidden      = true, -- enable hidden files by default
        no_ignore   = false, -- respect ".gitignore"  by default
    },
    grep = {
        prompt            = 'Search❯ ',
        input_prompt      = 'Search For❯ ',
        formatter         = "path.filename_first",
        git_icons         = true,
        file_icons        = true,
        color_icons       = true,
        rg_opts           = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob '!*.html' --glob '!*.js' -e",
        hidden            = false,
        no_ignore         = false,
    },
    buffers = {
        prompt            = 'Buffers❯ ',
        file_icons        = true,
        color_icons       = true,
        sort_lastused     = true,
        show_unloaded     = true,
        cwd_only          = false,
        cwd               = nil,
    },
})
