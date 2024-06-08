return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")
        local loader = require("luasnip.loaders.from_lua")

        ls.setup({
            update_events = { "TextChanged", "TextChangedI" },
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
        })

        loader.load({ paths = "~/dotfiles/vim/lua/configs/snippets" })

        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            ls.expand()
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-f>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-b>", function() ls.jump(-1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })
    end
}
