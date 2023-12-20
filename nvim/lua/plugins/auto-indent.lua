return {
    'vidocqh/auto-indent.nvim',
    event = "LspAttach",
    config = function ()
        require('auto-indent').setup()
    end
}
