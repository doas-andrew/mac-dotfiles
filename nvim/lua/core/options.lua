--------------------------------------------------------------------------------
-- Display

vim.opt.termguicolors = true
vim.opt.background = my.color_theme
--  vim.opt.cmdheight = my.cmd_height
vim.opt.scrolloff = my.scroll_off

if my.showColorColumn then
    vim.opt.colorcolumn = { my.colorColumn }
else
    vim.opt.colorcolumn = { 0 }
end

-- ???
--  vim.opt.conceallevel = 0

-- Leader must be set before Lazy loads?
vim.g.mapleader = " "

vim.opt.signcolumn = "yes"
--  vim.opt.signcolumn = "yes:1"
--  vim.opt.signcolumn = "number"

vim.opt.showbreak = "↪ " -- Options include -> '…', '↳ ', '→','↪ '
--  vim.opt.showtabline = 2

if vim.g.neovide then
    vim.o.guifont = "MesloLGS NF:h11:#h-full"
    --  vim.g.neovide_cursor_animation_length = 0.08
    vim.g.neovide_cursor_animation_length = 0
end

-- Prompt user before doing destructive things
vim.opt.confirm = true

vim.opt.title = true
vim.opt.numberwidth = 1

vim.opt.fileencoding = "utf-8"
--  vim.opt.showmode = false


--------------------------------------------------------------------------------
-- Line display

vim.opt.cursorcolumn = my.highlight_cursor_column
vim.opt.linespace = 0

if my.line_numbers == "absolute" then
    vim.opt.number = true
elseif my.line_numbers == "relative" then
    vim.opt.relativenumber = true
elseif my.line_numbers == "hybrid" then
    vim.opt.number = true
    vim.opt.relativenumber = true
end

if my.highlight_cursor_line_number and
    my.highlight_cursor_line
then
    vim.opt.cursorline = true
elseif my.highlight_cursor_line_number then
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "number"
elseif my.highlight_cursor_line then
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "line"
end


--------------------------------------------------------------------------------
-- List Chars

vim.opt.list = true
vim.opt.listchars = {
    trail = "•",
    --  space = "•",
    --  tab = "» ",
    --  eol = "↴",
    extends = "❯",
    precedes = "❮",
    nbsp = "_",
}


--------------------------------------------------------------------------------
-- Indentation

vim.opt.wrap = my.word_wrap
vim.opt.expandtab = my.insert_spaces
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = my.indent_size
vim.opt.softtabstop = my.tab_size
vim.opt.tabstop = my.tab_size


--------------------------------------------------------------------------------
-- Search and Complete

-- vim.cmd([[ set autochdir ]])
vim.opt.hlsearch = my.highlight_search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.opt.pumheight = my.compe_items
vim.opt.completeopt = "menuone,noinsert,noselect"


--------------------------------------------------------------------------------
-- Utils

-- vim.opt.shortmess:append "c"
-- vim.opt.iskeyword:append "-"
-- vim.opt.path:append ".,**"

-- vim.lsp.set_log_level("info")

vim.opt.clipboard = "unnamedplus"

if my.enable_mouse then
    vim.opt.mouse = "a"
end


--------------------------------------------------------------------------------
-- Folds

vim.opt.foldenable = my.enable_folding

--  if vim.opt.foldenable then
    --  vim.opt.foldlevelstart = 3
    --  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    --  vim.opt.foldmethod = "marker"
    --  vim.opt.foldmethod = "expr" -- This is kinda buggy
--  end


--------------------------------------------------------------------------------
-- Window splitting and buffers

--  vim.opt.hidden = true
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true
-- vim.opt.switchbuf = "useopen,uselast"
-- vim.opt.fillchars = {
    -- vert = "▕", -- alternatives │
    -- fold = " ",
    -- eob = " ", -- suppress ~ at EndOfBuffer
    -- diff = "╱", -- alternatives = ⣿ ░ ─
    -- msgsep = "‾",
    -- foldopen = "▾",
    -- foldsep = "│",
    -- foldclose = "▸",
-- }


--------------------------------------------------------------------------------
-- Diff

-- vim.opt.diffopt:append {
    -- "vertical",
    -- "iwhite",
    -- "hiddenoff",
    -- "foldcolumn:0",
    -- "context:4",
    -- "algorithm:histogram",
    -- "indent-heuristic",
-- }


--------------------------------------------------------------------------------
-- Grep program

-- if vim.fn.executable "rg" == 1 then
    -- vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
-- end


--------------------------------------------------------------------------------
-- Disable some builtin plugins

-- vim.g.loaded_gzip = 1
-- vim.g.loaded_tar = 1
-- vim.g.loaded_tarPlugin = 1
-- vim.g.loaded_zip = 1
-- vim.g.loaded_zipPlugin = 1
-- vim.g.loaded_getscript = 1
-- vim.g.loaded_getscriptPlugin = 1
-- vim.g.loaded_vimball = 1
-- vim.g.loaded_vimballPlugin = 1
-- vim.g.loaded_2html_plugin = 1
-- vim.g.loaded_logiPat = 1
-- vim.g.loaded_rrhelper = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- vim.g.loaded_man = 1
-- vim.g.loaded_remote_plugins = 1

-- vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1

--------------------------------------------------------------------------------
-- BACKUP AND SWAP

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = my.remember_undo_history

vim.opt.timeoutlen = my.timeoutlen
--  vim.opt.ttimeoutlen = 10

--  vim.opt.swapfile = my.use_swapfile
--  vim.opt.updatetime = my.updatetime

vim.opt.swapfile = my.use_swapfile and my.updatetime > 999
vim.opt.updatetime = my.updatetime > 99 and my.updatetime or 2000


--------------------------------------------------------------------------------
-- Wild and file globbing stuff in command mode

-- vim.opt.wildmode = "full"
-- Ignore case when completing file names and directories
-- vim.opt.wildignorecase = true 
-- vim.opt.wildignore = {
    -- "*.aux",
    -- "*.out",
    -- "*.toc",
    -- "*.o",
    -- "*.obj",
    -- "*.dll",
    -- "*.jar",
    -- "*.pyc",
    -- "*.rbc",
    -- "*.class",
    -- "*.gif",
    -- "*.ico",
    -- "*.jpg",
    -- "*.jpeg",
    -- "*.png",
    -- "*.avi",
    -- "*.wav",
    -- "*.webm",
    -- "*.eot",
    -- "*.otf",
    -- "*.ttf",
    -- "*.woff",
    -- "*.doc",
    -- "*.pdf",
    -- "*.zip",
    -- "*.tar.gz",
    -- "*.tar.bz2",
    -- "*.rar",
    -- "*.tar.xz",
    -- -- Cache
    -- ".sass-cache",
    -- "*/vendor/gems/*",
    -- "*/vendor/cache/*",
    -- "*/.bundle/*",
    -- "*.gem",
    -- -- Temp/System
    -- "*.*~",
    -- "*~ ",
    -- "*.swp",
    -- ".lock",
    -- ".DS_Store",
    -- "._*",
    -- "tags.lock",
-- }
