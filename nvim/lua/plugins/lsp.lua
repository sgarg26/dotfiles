local float = {
    --nvim_open_win() options
    relative = "cursor",
    -- "single": A single line box.
    -- "double": A double line box.
    -- "rounded": Like "single", but with rounded corners "╭"
    -- "solid": Adds padding by a single whitespace cell.
    -- "shadow": A drop shadow effect by blending with the
    -- "none": No border (default).
    border = "shadow",
    -- vim.lsp.util.open_floating_preview()
    max_width = math.floor(vim.o.columns * 0.84),
    max_height = math.floor(vim.o.lines * 0.6),
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    focusable = false,
    zindex = 3,
    focus = false,
    -- vim.diagnostic.open_float()
    source = "if_many",
    severity_sort = true,
}

return {
    {
        "williamboman/mason.nvim", -- Nice UI for installing lsps, linters, dap etc. 
        lazy = false,
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
            ensure_installed = { "pyright", "clangd", "lua_ls", "tsserver", "html", "cssls" }
        }
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "ray-x/lsp_signature.nvim",
            opts = {
                bind = true,
                max_height = float.max_height,
                max_width = float.max_width,
                handler_opts = {
                    border = float.border,
                },
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.cssls.setup({})
            lspconfig.tsserver.setup({})
            -- lspconfig.html.setup({})
            lspconfig.emmet_language_server.setup({})
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
            'onsails/lspkind.nvim',
            'windwp/nvim-autopairs'
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                cmp.event:on(
                    'confirm_done',
                    cmp_autopairs.on_confirm_done()
                ),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'text_symbol', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
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
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        event = "LspAttach",
        config = function()
            local saga = require("lspsaga")
            saga.setup ({
                lightbulb = { virtual_text = false },
                ui = {
                },
                symbol_in_winbar = {
                    enable = false
                }
            })
        end
    }
}
