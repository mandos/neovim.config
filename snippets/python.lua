local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local fmt = require("luasnip.extras.fmt").fmt

return {
    -- Function
    s(
        "f",
        fmt(
            [[
            def {}({}) -> {}:
                """{}"""
                {}
            ]],
            {
                i(1, "name"),
                i(2),
                i(3, "None"),
                i(4, "Description"),
                i(0),
            }
        )
    ),
    s("if", fmt("if {}:\n\t{}", { i(1, "condition"), i(0) })),
    s(
        "ife",
        fmt(
            [[
    if {}:
        {}
    else:
        {}
    ]]       ,
            { i(1, "condition"), i(2), i(0) }
        )
    ),
}
