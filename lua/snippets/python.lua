local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local function init_expand(args, _, _)
    local nodes = {}

    for field in args[1][1]:gmatch("([^,]+)") do
        field = field:match("(%a+):?.-$"):match("^%s*(.-)%s*$")
        table.insert(nodes, t("\tself."))
        table.insert(nodes, t(field))
        table.insert(nodes, t(" = "))
        table.insert(nodes, t({ field, "" }))
    end

    local snip = sn(nil, nodes)
    return snip
end

return {
    -- print function
    s("print", {
        t("print("),
        i(1),
        t(")"),
        i(0),
    }),
    -- if statement
    s("if", {
        t("if "),
        i(1),
        t({ ":", "\t" }),
        i(0, "pass"),
    }),
    -- class init generation
    s("definit", {
        t("def __init__(self, "),
        i(1),
        t({ ") -> None:", "" }),
        d(2, init_expand, 1),
    }),
}
