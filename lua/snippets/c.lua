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

local function printf_expand(args, _, old_state)
    local nodes = {}
    if not old_state then
        old_state = {}
    end

    -- count placeholders in string
    local _, count = args[1][1]:gsub("%%", "")
    if count == 0 then
        return sn(nil, nodes)
    end

    for j = 1, count do
        local iNode
        if old_state and old_state[j] then
            iNode = i(j, old_state[j].old_text)
        else
            iNode = i(j, "arg")
        end
        nodes[j * 2 - 1] = t(", ")
        nodes[j * 2] = iNode
        old_state[j] = iNode
    end

    local snip = sn(nil, nodes)
    snip.old_state = old_state
    return snip
end

return {
    -- start template
    s("libsst", {
        t({ "#include <stdio.h>", "#include <stdlib.h>", "", "int main() {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
    -- printf with auto-expand args
    s("printf", {
        t('printf("'),
        i(1),
        t('"'),
        d(2, printf_expand, 1),
        t(")"),
    }),
}
