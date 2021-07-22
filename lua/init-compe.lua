vim.o.completeopt = "menuone,noselect"

require('compe').setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };
  source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = true,
      spell = true,
      luasnip = true,
      tags = true
  }
}

local luasnip = require('luasnip')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif luasnip.expand_or_jumpable() then
    return t "<Plug>luasnip-expand-or-jump"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif luasnip.jumpable(-1) then
    return t "<Plug>luasnip-jump-prev"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

--  mappings
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
npairs.setup()

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

-- init surround
require('surround').setup {}

-- init comment
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

