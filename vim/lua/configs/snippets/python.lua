local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
    s(
        { trig = "cls" },
        fmt(
            [[
                class {}:
                    def __init__(self) -> None:
                        {}
            ]],
            {
                i(1, "ClassName"),
                i(2, "pass"),
            }
        )
    ),
    s(
        { trig = "def" },
        fmt(
            [[
                def {}({}) -> {}:
                    {}
            ]],
            {
                i(1, "method_name"),
                i(2, "args"),
                i(3, "None"),
                i(4, "pass")
            }
        )
    )
}
