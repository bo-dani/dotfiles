vim.keymap.set('n', '<leader>1', ':LualineBuffersJump 1<CR>')
vim.keymap.set('n', '<leader>2', ':LualineBuffersJump 2<CR>')
vim.keymap.set('n', '<leader>3', ':LualineBuffersJump 3<CR>')
vim.keymap.set('n', '<leader>4', ':LualineBuffersJump 4<CR>')
vim.keymap.set('n', '<leader>5', ':LualineBuffersJump 5<CR>')
vim.keymap.set('n', '<leader>6', ':LualineBuffersJump 6<CR>')
vim.keymap.set('n', '<leader>7', ':LualineBuffersJump 7<CR>')
vim.keymap.set('n', '<leader>8', ':LualineBuffersJump 8<CR>')
vim.keymap.set('n', '<leader>9', ':LualineBuffersJump 9<CR>')
vim.keymap.set('n', '<leader>h', ':bprev<CR>')
vim.keymap.set('n', '<leader>l', ':bnext<CR>')

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'nord', -- 'auto'
        -- Seperators below are for the statusline, for the tabline see "tabline" section
        component_separators = { left = '', right = ''}, --        
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch', 
            {
                'diff',
                colored = true,
                -- diff_color = {
                --     added    = 'LuaLineDiffAdd',
                --     modified = 'LuaLineDiffChange',
                --     removed  = 'LuaLineDiffDelete',
                -- },
                symbols = {added = '+', modified = '~', removed = '-'},
                source = nil,
            },
        },
        lualine_c = {
            -- {
            --     'filename', 
            --     path = 0, -- :h lualine-filename-component-options
            -- },
        },
        lualine_x = {
            'searchcount',
            {
                'diagnostics', 
                sources = { 'nvim_diagnostic', 'coc' },
                sections = { 'error', 'warn', 'info', 'hint' },
                -- diagnostics_color = {
                --     error = 'DiagnosticError',
                --     warn  = 'DiagnosticWarn',
                --     info  = 'DiagnosticInfo',
                --     hint  = 'DiagnosticHint',
                -- },
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                colored = true,
                update_in_insert = false,
                always_visible = false,
            }, 
            'filetype',
            'encoding',
            'fileformat',
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                show_modified_status = true,
                mode = 2, -- 0 buf name, 1 buf index, 2 name + index, 3 buf number, 4 name + number
                max_length = vim.o.columns * 2 / 3,
                symbols = {
                    modified = ' ⚠', -- ' 💾', -- ' ●',
                    alternate_file = '', -- '#'
                    directory = '',
                },
                component_separators = { left = '', right = ''}, --        
                section_separators = { left = '', right = ''},
            }
        },
        lualine_b = {''}, -- {'branch'},
        lualine_c = {''}, -- {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    },
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {}, -- {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {},
    extensions = {}
}
