
local dap = {
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "BufAdd",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        }
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        event = "BufAdd",
        opts = {}
    },
    {
        'rcarriga/nvim-dap-ui',
        event = "BufAdd",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        'mfussenegger/nvim-dap',
        ft = { 'python', 'cpp', 'c' },
        config = function(_, opts)
            local dap = require("dap")
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "-i", "dap" }
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}"
                }
            }
            dap.configurations.c = dap.configurations.cpp
            vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>")
            vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>")
            vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<cr>")
            vim.keymap.set("n", "<leader>dr", "<cmd>DapRestartFrame<cr>")
            vim.keymap.set("n", "<A-s>", "<cmd>DapStepInto<cr>")
            vim.keymap.set("n", "<A-o>", "<cmd>DapStepOut<cr>")
            vim.keymap.set("n", "<A-n>", "<cmd>DapStepOver<cr>")
        end
    },
    {
        'mfussenegger/nvim-dap-python',
        ft = { 'python' },
        dependencies = { 'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui', },
        config = function(_, opts)
            local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
            require('dap-python').setup(path)
            vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>")
            vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>")
            vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<cr>")
            vim.keymap.set("n", "<leader>dr", "<cmd>DapRestartFrame<cr>")
            vim.keymap.set("n", "<A-s>", "<cmd>DapStepInto<cr>")
            vim.keymap.set("n", "<A-o>", "<cmd>DapStepOut<cr>")
            vim.keymap.set("n", "<A-n>", "<cmd>DapStepOver<cr>")
        end,
    },
}

return dap

