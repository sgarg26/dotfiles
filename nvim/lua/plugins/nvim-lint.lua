return {
    "mfussenegger/nvim-lint",
    ft = { "python", "c", "lua", "java" },
    config = function()
        require('lint').linters_by_ft = {
            python = { "flake8" },
            c = { "cpplint" },
            lua = { "luacheck" },
            javascript = { "eslint_d" }
        }
    end
}
