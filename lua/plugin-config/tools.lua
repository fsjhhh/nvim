local fts = {
    'c',
    'cpp',
    'lua',
    'python',
    'javascript',
    'json',
}

return {
    {
        "xeluxee/competitest.nvim",
        ft = { "cpp" },
        dependencies = {
            "MunifTanjim/nui.nvim",
        },

        config = function()
            require('competitest').setup({
                -- runner_ui = {
                --     interface = "split",
                -- },
            })
            vim.keymap.set("n", "rr", "<cmd>CompetiTest run<CR>", { noremap = true })
            vim.keymap.set("n", "ra", "<cmd>CompetiTest add_testcase<CR>", { noremap = true })
            vim.keymap.set("n", "re", "<cmd>CompetiTest edit_testcase<CR>", { noremap = true })
            vim.keymap.set("n", "ri", "<cmd>CompetiTest receive testcases<CR>", { noremap = true })
            vim.keymap.set("n", "rd", "<cmd>CompetiTest delete_testcase<CR>", { noremap = true })
        end
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")
            vim.notify = notify
            notify.setup({
                background_colour = "#202020",
                fps = 60,
                level = 2,
                minimum_width = 50,
                render = "compact",
                stages = "slide",
                timeout = 3000,
                top_down = true
            })
        end
    },
    {
        {
            "nvimdev/guard.nvim",
            ft = fts,
            dependencies = {
                "nvimdev/guard-collection",
            },
            config = function()
                local ft = require("guard.filetype")
                ft("c"):fmt("clang-format")
                ft("cpp"):fmt("clang-format")
                ft("lua"):fmt("lsp")
                ft("python"):fmt("black")
                ft("sh"):fmt("lsp")
                require("guard").setup({
                    fmt_on_save = false,
                    lsp_as_default_formatter = true,
                    vim.keymap.set({ "n", "v" }, "<leader>fm", "<cmd>GuardFmt<CR>", { noremap = true }),
                })
            end
        },
    },
    {
        "voldikss/vim-floaterm",
        -- config = true,
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },
}
