----------------------------------------------------------------------
-- Timing
----------------------------------------------------------------------

vim.opt.timeoutlen = my.timeoutlen
vim.opt.updatetime = my.updatetime
vim.opt.ttimeoutlen = 10


----------------------------------------------------------------------
-- Color scheme
----------------------------------------------------------------------

vim.opt.background = my.color_theme
pcall(vim.cmd, [[ colorscheme ]] .. my.color_scheme)


----------------------------------------------------------------------
-- Window splitting and buffers
----------------------------------------------------------------------

vim.opt.hidden = true
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


----------------------------------------------------------------------
-- Diff
----------------------------------------------------------------------

-- vim.opt.diffopt:append {
    -- "vertical",
    -- "iwhite",
    -- "hiddenoff",
    -- "foldcolumn:0",
    -- "context:4",
    -- "algorithm:histogram",
    -- "indent-heuristic",
-- }


----------------------------------------------------------------------
-- Grep program
----------------------------------------------------------------------
-- if vim.fn.executable "rg" == 1 then
    -- vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
-- end

----------------------------------------------------------------------
-- Display
----------------------------------------------------------------------
if my.showColorColumn then
    vim.opt.colorcolumn = { my.colorColumn }
else
    vim.opt.colorcolumn = { 0 }
end
vim.opt.cmdheight = my.cmdheight
vim.opt.scrolloff = my.scrolloff
vim.opt.conceallevel = 0
vim.opt.signcolumn = "yes:1"
vim.opt.showbreak = "↪ " -- Options include -> '…', '↳ ', '→','↪ '
vim.opt.showtabline = 2
vim.opt.termguicolors = true
-- vim.opt.guifont = "JetBrainsMono Nerd Font:h14"
vim.opt.relativenumber = my.relative_number
vim.opt.cursorline = my.cursor_line
vim.opt.title = true
vim.opt.number = true
vim.opt.numberwidth = 1
-- Prompt user before doing destructive things
vim.opt.confirm = true
vim.opt.fileencoding = "utf-8"
vim.opt.showmode = false

----------------------------------------------------------------------
-- List Chars
----------------------------------------------------------------------
if my.list_chars then
    vim.opt.list = true
    vim.opt.listchars = {
        trail = "•",
        -- eol = "↴",
        tab = "» ",
        extends = "❯",
        precedes = "❮",
        nbsp = "_",
        -- space = " ",
    }
end


----------------------------------------------------------------------
-- Indentation
----------------------------------------------------------------------
vim.opt.wrap = my.word_wrap
vim.opt.expandtab = my.insert_spaces
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = my.indent_size
vim.opt.softtabstop = my.tab_size
vim.opt.tabstop = my.tab_size


----------------------------------------------------------------------
-- Search and Complete
----------------------------------------------------------------------
-- vim.cmd([[ set autochdir ]])
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.opt.pumheight = my.compe_items
vim.opt.completeopt = "menuone,noinsert,noselect"


----------------------------------------------------------------------
-- Utils
----------------------------------------------------------------------
-- vim.opt.shortmess:append "c"
-- vim.opt.iskeyword:append "-"
-- vim.opt.path:append ".,**"

-- vim.lsp.set_log_level("info")

vim.opt.clipboard = "unnamedplus"

if my.enable_mouse then
    vim.opt.mouse = "a"
end


----------------------------------------------------------------------
-- Folds
----------------------------------------------------------------------
-- vim.opt.foldlevelstart = 3
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldmethod = "marker"
-- vim.opt.foldmethod = "expr" -- This is kinda buggy

----------------------------------------------------------------------
-- Disable some builtin plugins
----------------------------------------------------------------------
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

----------------------------------------------------------------------
-- BACKUP AND SWAP
----------------------------------------------------------------------
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = my.remember_undo_history
vim.opt.swapfile = my.use_swapfile

----------------------------------------------------------------------
-- Wild and file globbing stuff in command mode
----------------------------------------------------------------------
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

----------------------------------------------------------------------
-- Autocommands
----------------------------------------------------------------------
-- TODO: refactor when autocmd API is merged:
-- https://github.com/neovim/neovim/pull/12378
-- https://github.com/neovim/neovim/pull/14661

-- as.check_and_set(vim.g.code_trim_trailing_space, "BufWritePre", "*", [[%s/\s\+$//e]])
-- as.check_and_set(vim.g.code_trim_trailing_space, "BufWritePre", "*", [[%s/\n\+\%$//e]])

-- as.check_and_set(
--     vim.g.code_highlight_yank,
--     "TextYankPost",
--     "*",
--     'lua require"vim.highlight".on_yank{timeout = 250}'
-- )
-- as.check_and_set(
--     vim.g.code_preserve_cursor,
--     "BufReadPost",
--     "*",
--     [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
-- )
-- as.check_and_set(vim.g.code_format_on_save, "BufWritePost", "*", "silent FormatWrite")
