require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight'
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                symbols = { alternate_file = '' },
            }
        }
    }
}
