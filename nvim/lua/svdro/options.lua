local opt = vim.opt -- alias vim.opt


-- TODO: maybe find a better way to manage options that require plugins
-- colorscheme (assuming colorschemes are installed)
local status, err = pcall(vim.cmd, "colorscheme tokyonight") -- or gruvbox
if not status then
    print("Failed to set colorscheme: " .. err)
end

-- general
--opt.updatetime = 50 -- ms nothing is typed before swap file is written to disk
opt.relativenumber = true -- turn on relative numbers
opt.number = true         -- show current line number
opt.scrolloff = 8         -- start scrolling when getting to this much lines from bottom/top
-- opt.cmdheight = 1         -- number of lines to use for the command line

-- tabs and indentation
opt.tabstop = 2         -- 2 spaces for tabs
opt.shiftwidth = 2      -- 2 spaces for indent width
opt.expandtab = true    -- replace tab with corresponding spaces
opt.autoindent = true   -- copy indent from current line
opt.smartindent = true  -- automatically inserts indents in logical places (e.g. if statement)
opt.wrap = false

-- search settings
opt.ignorecase = true   -- can search for upper-case characters with lower case characters
opt.smartcase = true    -- if mixed-case is included in search, turns off ignorecase
opt.cursorline = true   -- highlight the line of the cursor (useful for searching)
opt.cursorlineopt = "number,line" -- how to show cursorline

-- colors
opt.termguicolors = true  -- required for some colorschemes to work
opt.background = "dark"   -- colorschemes will default to "dark" mode
opt.signcolumn = "yes"    -- "yes" -> always draw sign column
opt.colorcolumn = "78"

-- split windows
opt.splitright = true -- split vertical windows to the right
opt.splitbelow = true -- split horizontal windows to the bottom (e.g. when :h splitbelow)

-- other
--vim.cmd("let g:netrw_liststyle = 3")    -- setup nvim file explorer to use tree style
--opt.clipboard:append("unnamedplus")   -- use the system clipboard as the default register
opt.backspace ="indent,eol,start"       -- allow backspace on indent, eol, and start (not sure this does anything)
