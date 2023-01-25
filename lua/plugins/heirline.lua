return {
    "rebelot/heirline.nvim",
    event = "UIEnter",
    config = function()
        -- Filetypes where certain elements of the statusline will not be shown
        local filetypes = {
            "^aerial$",
            "^neo--tree$",
            "^neotest--summary$",
            "^neo--tree--popup$",
            "^NvimTree$",
            "^toggleterm$",
        }

        -- Filetypes which force the statusline to be inactive
        local force_inactive_filetypes = {
            "^alpha$",
            "^chatgpt$",
            "^DressingInput$",
            "^frecency$",
            "^lazy$",
            "^netrw$",
            "^TelescopePrompt$",
            "^undotree$",
        }
        local utils = require("heirline.utils")
        local conditions = require("heirline.conditions")
        local FileIcon = {
            init = function(self)
                local filename = self.filename
                local extension = vim.fn.fnamemodify(filename, ":e")
                self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension,
                    { default = true })
            end,
            provider = function(self) return self.icon and (" " .. self.icon .. " ") end,
            hl = { fg = "gray", bg = "black" },
        }

        local Align = { provider = "%=" }
        ---The bufferline
        ---@return table
        local function bufferline()
            -- we redefine the filename component, as we probably only want the tail and not the relative path
            local TablineFileName = {
                provider = function(self)
                    -- self.filename will be defined later, just keep looking at the example!
                    local filename = self.filename
                    filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
                    return filename
                end,
                hl = function(self)
                    return { bold = self.is_active or self.is_visible, italic = true }
                end,
            }

            -- this looks exactly like the FileFlags component that we saw in
            -- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
            -- also, we are adding a nice icon for terminal buffers.
            local TablineFileFlags = {
                {
                    condition = function(self)
                        return vim.api.nvim_buf_get_option(self.bufnr, "modified")
                    end,
                    provider = "[+]",
                    hl = { fg = "green" },
                },
                {
                    condition = function(self)
                        return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
                            or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
                    end,
                    provider = function(self)
                        if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
                            return "  "
                        else
                            return ""
                        end
                    end,
                    hl = { fg = "orange" },
                },
            }

            -- Here the filename block finally comes together
            local TablineFileNameBlock = {
                init = function(self)
                    self.filename = vim.api.nvim_buf_get_name(self.bufnr)
                end,
                hl = "TabLine",
                {
                    provider = function()
                        return "┃"
                    end,
                    hl = { fg = "blue" }
                },
                FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
                TablineFileName,
                TablineFileFlags,
            }

            -- a nice "x" button to close the buffer
            local TablineCloseButton = {
                condition = function(self)
                    return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
                end,
                { provider = " " },
                {
                    provider = "",
                    hl = { fg = "gray" },
                    on_click = {
                        callback = function(_, minwid)
                            vim.api.nvim_buf_delete(minwid, { force = false })
                        end,
                        minwid = function(self)
                            return self.bufnr
                        end,
                        name = "heirline_tabline_close_buffer_callback",
                    },
                },
                { provider = " " },
            }

            -- The final touch!
            local TablineBufferBlock = { TablineFileNameBlock, TablineCloseButton }

            -- and here we go
            local BufferLine = utils.make_buflist(
                TablineBufferBlock,
                { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
                { provider = "", hl = { fg = "gray" } }-- right trunctation, also optional (defaults to ...... yep, ">")
            -- by the way, open a lot of buffers and try clicking them ;)
            )
            local Tabpage = {
                provider = function(self)
                    return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
                end,
                hl = "TabLine",
            }

            local TabpageClose = {
                provider = "%999X  %X",
                hl = "TabLine",
            }

            local TabPages = {
                -- only show this component if there's 2 or more tabpages
                condition = function()
                    return #vim.api.nvim_list_tabpages() >= 2
                end,
                { provider = "%=" },
                utils.make_tablist(Tabpage),
                TabpageClose,
            }
            return { BufferLine, TabPages }
        end

        ---The statusline
        ---@return table
        local function statusline()

            local LeftSlantStart = {
                provider = "",
                hl = { fg = "bg", bg = "black" },
            }
            local LeftSlantEnd = {
                provider = "",
                hl = { fg = "black", bg = "bg" },
            }
            local RightSlantStart = {
                provider = "",
                hl = { fg = "black", bg = "bg" },
            }
            local RightSlantEnd = {
                provider = "",
                hl = { fg = "bg", bg = "black" },
            }

            ---Return the current vim mode
            local VimMode = {
                init = function(self)
                    self.mode = vim.fn.mode(1)
                    self.mode_color = self.mode_colors[self.mode:sub(1, 1)]

                    if not self.once then
                        vim.api.nvim_create_autocmd("ModeChanged", {
                            pattern = "*:*o",
                            command = "redrawstatus",
                        })
                        self.once = true
                    end
                end,
                static = {
                    mode_names = {
                        n = "NORMAL",
                        no = "NORMAL",
                        nov = "NORMAL",
                        noV = "NORMAL",
                        ["no\22"] = "NORMAL",
                        niI = "NORMAL",
                        niR = "NORMAL",
                        niV = "NORMAL",
                        nt = "NORMAL",
                        v = "VISUAL",
                        vs = "VISUAL",
                        V = "VISUAL",
                        Vs = "VISUAL",
                        ["\22"] = "VISUAL",
                        ["\22s"] = "VISUAL",
                        s = "SELECT",
                        S = "SELECT",
                        ["\19"] = "SELECT",
                        i = "INSERT",
                        ic = "INSERT",
                        ix = "INSERT",
                        R = "REPLACE",
                        Rc = "REPLACE",
                        Rx = "REPLACE",
                        Rv = "REPLACE",
                        Rvc = "REPLACE",
                        Rvx = "REPLACE",
                        c = "COMMAND",
                        cv = "Ex",
                        r = "...",
                        rm = "M",
                        ["r?"] = "?",
                        ["!"] = "!",
                        t = "TERM",
                    },
                    mode_colors = {
                        n = "blue",
                        i = "green",
                        v = "orange",
                        V = "orange",
                        ["\22"] = "orange",
                        c = "orange",
                        s = "yellow",
                        S = "yellow",
                        ["\19"] = "yellow",
                        r = "green",
                        R = "green",
                        ["!"] = "red",
                        t = "red",
                    },
                },
                {
                    provider = function(self) return " %2(" .. self.mode_names[self.mode] .. "%) " end,
                    hl = function(self) return { fg = self.mode_color, bg = "bg_statusline" } end,
                    update = {
                        "ModeChanged",
                    },
                },
                {
                    provider = "",
                    hl = { fg = "bg_statusline", bg = "black" },
                },
            }

            ---Return the current git branch in the cwd
            local GitBranch = {
                condition = conditions.is_git_repo,
                init = function(self) self.status_dict = vim.b.gitsigns_status_dict end,
                {
                    condition = function()
                        return not conditions.buffer_matches({
                            filetype = filetypes,
                        })
                    end,
                    LeftSlantStart,
                    {
                        provider = function(self) return "  " .. self.status_dict.head .. " " end,
                        hl = { fg = "gray", bg = "black" },
                    },
                    {
                        condition = function() return (
                                _G.GitStatus ~= nil and (_G.GitStatus.ahead ~= 0 or _G.GitStatus.behind ~= 0))
                        end,
                        {
                            condition = function() return _G.GitStatus.status == "pending" end,
                            provider = " ",
                            hl = { fg = "gray", bg = "black" },
                        },
                        {
                            provider = function() return _G.GitStatus.behind .. " " end,
                            hl = function() return { fg = _G.GitStatus.behind == 0 and "gray" or "red", bg = "black" } end,
                        },
                        {
                            provider = function() return _G.GitStatus.ahead .. " " end,
                            hl = function() return { fg = _G.GitStatus.ahead == 0 and "gray" or "green", bg = "black" } end,
                        },
                    },
                    LeftSlantEnd,
                },
            }

            ---Return the filename of the current buffer
            local FileBlock = {
                init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
                condition = function()
                    return not conditions.buffer_matches({
                        filetype = filetypes,
                    })
                end,
            }

            local FileName = {
                provider = function(self)
                    local filename = vim.fn.fnamemodify(self.filename, ":t")
                    if filename == "" then return "[No Name]" end
                    return " " .. filename .. " "
                end,
                on_click = {
                    callback = function() vim.cmd("Telescope find_files") end,
                    name = "find_files",
                },
                hl = { fg = "gray", bg = "black" },
            }

            local FileFlags = {
                {
                    condition = function() return vim.bo.modified end,
                    provider = " ",
                    hl = { fg = "gray" },
                },
                {
                    condition = function() return not vim.bo.modifiable or vim.bo.readonly end,
                    provider = " ",
                    hl = { fg = "gray" },
                },
            }

            local FileNameBlock = utils.insert(FileBlock, LeftSlantStart, utils.insert(FileName, FileFlags), LeftSlantEnd)

            ---Return the LspDiagnostics from the LSP servers
            local LspDiagnostics = {
                condition = conditions.has_diagnostics,
                init = function(self)
                    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
                end,
                on_click = {
                    callback = function() vim.cmd("normal gf") end,
                    name = "heirline_diagnostics",
                },
                update = { "DiagnosticChanged", "BufEnter" },
                -- Errors
                {
                    condition = function(self) return self.errors > 0 end,
                    hl = { fg = "bg", bg = "red" },
                    {
                        {
                            provider = "",
                        },
                        {
                            provider = function(self) return "E " .. self.errors end,
                        },
                        {
                            provider = "",
                            hl = { bg = "bg", fg = "red" },
                        },
                    },
                },
                -- Warnings
                {
                    condition = function(self) return self.warnings > 0 end,
                    hl = { fg = "bg", bg = "yellow" },
                    {
                        {
                            provider = "",
                        },
                        {
                            provider = function(self) return "W " ..
                                    self.warnings
                            end,
                        },
                        {
                            provider = "",
                            hl = { bg = "bg", fg = "yellow" },
                        },
                    },
                },
                -- Hints
                {
                    condition = function(self) return self.hints > 0 end,
                    hl = { fg = "gray", bg = "bg" },
                    {
                        {
                            provider = function(self)
                                local spacer = (self.errors > 0 or self.warnings > 0) and " " or ""
                                return spacer .. "H " .. self.hints
                            end,
                        },
                    },
                },
                -- Info
                {
                    condition = function(self) return self.info > 0 end,
                    hl = { fg = "gray", bg = "bg" },
                    {
                        {
                            provider = function(self)
                                local spacer = (self.errors > 0 or self.warnings > 0 or self.hints) and " " or ""
                                return spacer .. "I " .. self.info
                            end,
                        },
                    },
                },
            }

            ---Return the current line number as a % of total lines and the total lines in the file
            local Ruler = {
                condition = function()
                    return not conditions.buffer_matches({
                        filetype = filetypes,
                    })
                end,
                {
                    provider = "",
                    hl = { fg = "gray", bg = "bg" },
                },
                {
                    -- %L = number of lines in the buffer
                    -- %P = percentage through file of displayed window
                    provider = " %l/%2L ",
                    hl = { fg = "bg", bg = "gray" },
                    on_click = {
                        callback = function()
                            local line = vim.api.nvim_win_get_cursor(0)[1]
                            local total_lines = vim.api.nvim_buf_line_count(0)

                            if math.floor((line / total_lines)) > 0.5 then
                                vim.cmd("normal! gg")
                            else
                                vim.cmd("normal! G")
                            end
                        end,
                        name = "heirline_ruler",
                    },
                },
            }

            local SearchResults = {
                condition = function(self)
                    local lines = vim.api.nvim_buf_line_count(0)
                    if lines > 50000 then return end

                    local query = vim.fn.getreg("/")
                    if query == "" then return end

                    if query:find("@") then return end

                    local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
                    local active = false
                    if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then active = true end
                    if not active then return end

                    query = query:gsub([[^\V]], "")
                    query = query:gsub([[\<]], ""):gsub([[\>]], "")

                    self.query = query
                    self.count = search_count
                    return true
                end,
                {
                    provider = "",
                    hl = function() return { fg = utils.get_highlight("Substitute").bg, bg = "bg" } end,
                },
                {
                    provider = function(self)
                        return table.concat({
                            " ",
                            self.count.current,
                            "/",
                            self.count.total,
                            " ",
                        })
                    end,
                    hl = function() return { bg = utils.get_highlight("Substitute").bg, fg = "bg" } end,
                },
                {
                    provider = "",
                    hl = function() return { bg = utils.get_highlight("Substitute").bg, fg = "bg" } end,
                },
            }

            -- Show plugin updates available from lazy.nvim
            local Lazy = {
                condition = function()
                    return not conditions.buffer_matches({
                        filetype = filetypes,
                    }) and require("lazy.status").has_updates()
                end,
                update = { "User", pattern = "LazyUpdate" },
                provider = function() return "  " .. require("lazy.status").updates() .. " " end,
                on_click = {
                    callback = function() require("lazy").update() end,
                    name = "update_plugins",
                },
                hl = { fg = "gray" },
            }

            local FileType = {
                provider = function() return string.lower(vim.bo.filetype) .. " " end,
                hl = { fg = "gray", bg = "black" },
            }

            FileType = utils.insert(FileBlock, RightSlantStart, FileIcon, FileType, RightSlantEnd)

            --- Return information on the current file's encoding
            local FileEncoding = {
                condition = function()
                    return not conditions.buffer_matches({
                        filetype = filetypes,
                    })
                end,
                RightSlantStart,
                {
                    provider = function()
                        local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
                        return " " .. enc .. " "
                    end,
                    hl = {
                        fg = "gray",
                        bg = "black",
                    },
                },
                RightSlantEnd,
            }

            ---The statusline component
            return {
                condition = function()
                    return not conditions.buffer_matches({
                        filetype = force_inactive_filetypes,
                    })
                end,

                -- Left
                VimMode,
                FileNameBlock,
                LspDiagnostics,

                -- Right
                Align,
                Lazy,
                FileType,
                FileEncoding,
                GitBranch,
                SearchResults,
                Ruler,
            }
        end

        local heirline = require("heirline")
        heirline.load_colors(require("onedarkpro.helpers").get_colors())
        heirline.setup({
            statusline = statusline(),
            tabline = bufferline()
        })

        vim.o.showtabline = 2
        vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "olimorris/onedarkpro.nvim"
    }
}
