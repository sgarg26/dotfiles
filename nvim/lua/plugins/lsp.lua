return {
    {
        "williamboman/mason.nvim", -- Nice UI for installing lsps, linters, dap etc. 
        cmd = "Mason",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "folke/neodev.nvim",
        event = "LspAttach",
        config = function()
            require("neodev").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim", -- Bridges the gap between lsp-config and Mason. 
        event = "LspAttach",
        opts = {
            ensure_installed = { "pyright", "clangd", "lua_ls", "debugpy" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            -- local servers = { "pyright", "clangd", "lua_ls", "debugpy" }
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            lspconfig.pyright.setup({})
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })
        end
    },
    {
        'hrsh7th/nvim-cmp', -- Autocompletion
        event = "LspAttach",
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
            'onsails/lspkind.nvim'
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        maxwidth = 50,
                        ellipsis_char = '...',
                    })},
                experimental = { ghost_text = true },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = "menu,menuone,noinsert"
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }),
            })
        end
    },
}
