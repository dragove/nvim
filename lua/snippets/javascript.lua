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

return {
    -- console.log
    s("cl", {
        t("console.log("),
        i(1),
        t(")"),
    }),
    -- define a function
    s("fn", {
        t("function "),
        i(1, "myFun"),
        t("("),
        i(2),
        t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
}
