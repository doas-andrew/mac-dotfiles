--------------------------------------------------------------------------------
-- Maps
--------------------------------------------------------------------------------

local opts = { silent = true }
local map  = fn.make_map("",  opts)
local cmap = fn.make_map("c", { silent = false })
local imap = fn.make_map("i", opts)
local nmap = fn.make_map("n", opts)
local vmap = fn.make_map("v", opts)

--------------------------------------------------------------------------------
-- Environment
--------------------------------------------------------------------------------

if vim.g.neovide then
    -- Half-page up
    nmap("<C-i>", "<C-u>")
    vmap("<C-i>", "<C-u>")

    -- Delete from line start to cursor
    cmap("<C-BS>", "<C-u>")
    imap("<C-BS>", "<C-u>")
else
    nmap("<C-b>i", "<C-u>")
    vmap("<C-b>i", "<C-u>")

    cmap("<C-h>", "<C-u>")
    imap("<C-h>", "<C-u>")
end

if fn.is_wezterm() then
    nmap("<M-i>", [[:lua fn.if_window_to_the('up',    'wincmd k', 'silent !wezterm cli activate-pane-direction up')<CR>]])
    nmap("<M-k>", [[:lua fn.if_window_to_the('down',  'wincmd j', 'silent !wezterm cli activate-pane-direction down')<CR>]])
    nmap("<M-j>", [[:lua fn.if_window_to_the('left',  'wincmd h', 'silent !wezterm cli activate-pane-direction left')<CR>]])
    nmap("<M-l>", [[:lua fn.if_window_to_the('right', 'wincmd l', 'silent !wezterm cli activate-pane-direction right')<CR>]])

    nmap("<C-j>", [[:lua fn.if_only_buffer('silent !wezterm cli activate-tab --tab-relative -1', 'BufferPrevious')<CR>]])
    nmap("<C-l>", [[:lua fn.if_only_buffer('silent !wezterm cli activate-tab --tab-relative  1', 'BufferNext')<CR>]])

    nmap("<M-J>", [[:BufferMovePrevious<CR>]])
    nmap("<M-L>", [[:BufferMoveNext<CR>]])
elseif fn.is_tmux() then
    nmap("<M-i>", [[:lua fn.if_window_to_the('up',    'wincmd k', 'silent !tmux select-pane -U')<CR>]])
    nmap("<M-k>", [[:lua fn.if_window_to_the('down',  'wincmd j', 'silent !tmux select-pane -D')<CR>]])
    nmap("<M-j>", [[:lua fn.if_window_to_the('left',  'wincmd h', 'silent !tmux select-pane -L')<CR>]])
    nmap("<M-l>", [[:lua fn.if_window_to_the('right', 'wincmd l', 'silent !tmux select-pane -R')<CR>]])

    nmap("<C-j>", [[:lua fn.if_only_buffer('silent !tmux select-window -p', 'BufferPrevious')<CR>]])
    nmap("<C-l>", [[:lua fn.if_only_buffer('silent !tmux select-window -n', 'BufferNext')<CR>]])

    nmap("<M-J>", [[:lua fn.if_only_buffer('silent !tmux swap-window -dt -1', 'BufferMovePrevious')<CR>]])
    nmap("<M-L>", [[:lua fn.if_only_buffer('silent !tmux swap-window -dt +1', 'BufferMoveNext')<CR>]])
else
    nmap("<M-i>", [[:wincmd k<CR>]])
    nmap("<M-k>", [[:wincmd j<CR>]])
    nmap("<M-j>", [[:wincmd h<CR>]])
    nmap("<M-l>", [[:wincmd l<CR>]])

    nmap("<C-j>", [[:BufferPrevious<CR>]])
    nmap("<C-l>", [[:BufferNext<CR>]])

    nmap("<M-J>", [[:BufferMovePrevious<CR>]])
    nmap("<M-L>", [[:BufferMoveNext<CR>]])
end


--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

nmap(";", ":", { silent = false })
nmap("s", ":HopWord<CR>")            -- EasyMotion
imap("jk", "<ESC>")                  -- Exit insert mode

-- Delete preceeding word
cmap("<M-BS>", "<C-w>")
imap("<M-BS>", "<C-w>")

cmap("<M-J>", "<S-Left>")
cmap("<M-L>", "<S-Right>")

nmap("Y", "y$")                      -- Yank to end of line
vmap("Y", "ygv")                     -- Yank without exiting visual mode
nmap("<leader>y", "mY0v$<left>y`Y")  -- Yank line without newline char

-- Open terminal
nmap("<leader>ot", ":terminal<CR>i")

-- Delete without overwriting clipboard
nmap("x", [["_x]])
nmap("X", [["_dd]])
nmap("<leader>d", [["_d]])

-- Append line below/above
nmap("<M-I>", "m1kJ`1")
nmap("<M-K>", "m1J`1")

-- Move selected line / block of text in visual mode
nmap("I", "v:move '<-2<CR>")
nmap("K", "v:move '>+1<CR>")
vmap("I", ":move '<-2<CR>gv=gv")
vmap("K", ":move '>+1<CR>gv=gv")

-- Search [word]
nmap("f.", "/<C-r><C-w><CR>")

-- Replace all instances of [word] in current file
nmap("ca", [[:%s/<C-r><C-w>//g<Left><Left>]])

-- Change inner word
nmap("c.", "ciw")

-- Append current clipboard to the end of the current line
nmap("<leader>p", "mY$a <ESC>p`Y")

-- Move to the end of yanked and pasted text
vmap("y", "y`]")
vmap("p", "p`]")
nmap("p", "p`]")

-- Paste from system clipboard
imap("<C-v>", "<C-r>+")
cmap("<C-v>", "<C-r>+")

-- Open line above without insert
nmap("<leader>O", "mYO<ESC>`Y")
nmap("<leader>o", "mYo<ESC>`Y")


--------------------------------------------------------------------------------
-- Comments
--------------------------------------------------------------------------------

if Comment then
    nmap("<M-/>", [[:lua Comment.toggle.linewise()<CR><Down>]])
    vmap("<M-/>", [[:lua Comment.locked("toggle.linewise")(vim.fn.visualmode())<CR>]])
elseif MiniComment then
    nmap("<M-/>", [[:lua MiniComment.toggle_lines(vim.fn.line("."), vim.fn.line("."))<CR><Down>]])
    vmap("<M-/>", [[:lua MiniComment.toggle_lines(vim.fn.line("'<"), vim.fn.line("'>"))<CR>]])
end


--------------------------------------------------------------------------------
-- Surround
--------------------------------------------------------------------------------

if NvimSurround then
    -- nmap("Sd", [[:lua NvimSurround.delete_surround()<CR>]])
    -- vmap("Sd", [[:lua NvimSurround.delete_surround()<CR>]])
elseif MiniSurround then
    nmap("Sa", [[:lua MiniSurround.add("normal")<CR>]])
    nmap("Sd", [[:lua MiniSurround.delete()<CR>]])
    nmap("Sr", [[:lua MiniSurround.replace()<CR>]])
    vmap("Sa", [[:lua MiniSurround.add("visual")<CR>]])
    vmap("Sd", [[:lua MiniSurround.delete()<CR>]])
end


--------------------------------------------------------------------------------
-- Toggles
--------------------------------------------------------------------------------

nmap("<leader>tc", ":ColorizerToggle<CR>")       -- Toggle Colorizer
nmap("<leader>tf", "za")                         -- Toggle fold under cursor
nmap("<leader>tF", "zA")                         -- Toggle all folds under cursor

-- File explorer
nmap("<M-e>", ":Neotree toggle<CR>")

-- Search highlighting
--  nmap("<leader>th", ":set hlsearch!<CR>")
nmap("<leader>th", ":noh<CR>")

nmap("<leader>ti", ":IndentBlanklineToggle<CR>") -- Toggle indent guides
--  nmap("<leader>tt", ":Twilight<CR>")              -- Toggle Twilight
nmap("<leader>tw", ":set wrap!<CR>")             -- Toggle word-wrap

-- Relative line number
nmap("<leader>tnr", ":set relativenumber!<CR>")

-- Show vertical bar at column 80
nmap("<leader>|", [[:execute "set colorcolumn=" . (&colorcolumn == "0" ? "]].. my.color_column ..[[" : "0")<CR>]])

--  nmap("M-e", ":NvimTreeToggle<CR>")
--  nmap("<leader>rq", ":cwindow<CR>")
--  nmap("<leader>rl", ":lwindow<CR>")


--------------------------------------------------------------------------------
-- Command mode
--------------------------------------------------------------------------------

cmap("<C-j>", "<home>")
cmap("<C-l>", "<end>")

cmap("<M-I>", "<Up>")
cmap("<M-K>", "<Down>")
cmap("<M-j>", "<Left>")
cmap("<M-l>", "<Right>")


--------------------------------------------------------------------------------
-- Navigation
--------------------------------------------------------------------------------

map("j", "h")
map("h", "i")

nmap("q", "b")
nmap("Q", "B")

nmap("H", "^i")
vmap("H", "^i")

-- Traverse word-wrapped lines as separate lines
map("i", "gk")
map("k", "gj")
-- map("i", [[v:count == 0 ? "gk" : "k"]], { expr = true })
-- map("k", [[v:count == 0 ? "gj" : "j"]], { expr = true })

imap("<M-i>", "<Up>")
imap("<M-k>", "<Down>")
imap("<M-j>", "<Left>")
imap("<M-l>", "<Right>")

nmap("<", "<C-o>") -- Jump back
nmap(">", "<C-i>") -- Jump forward

nmap("<C-k>",  "<C-d>") -- Half-page down
vmap("<C-k>",  "<C-d>") -- Half-page down


--------------------------------------------------------------------------------
-- Vim Visual Multi
--------------------------------------------------------------------------------

vim.g.VM_maps = {
    ["Find Under"] = "<C-d>"
}


--------------------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------------------

nmap("tt", ":TroubleToggle<CR>")

nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("gD", ":lua vim.lsp.buf.declaration()<CR>")
nmap("gt", ":lua vim.lsp.buf.type_definition()<CR>")
nmap("gi", ":lua vim.lsp.buf.implementation()<CR>")
nmap("gw", ":lua vim.lsp.buf.document_symbol()<CR>")
-- nmap("gw", ":lua vim.lsp.buf.workspace_symbol()<CR>")
nmap("<leader>af", ":lua vim.lsp.buf.code_action()<CR>")
nmap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>ho", ":lua vim.lsp.buf.hover()<CR>")
nmap("<leader>he", ":lua vim.lsp.buf.signature_help()<CR>")


--------------------------------------------------------------------------------
-- barbar.nvim
--------------------------------------------------------------------------------

nmap("<leader>bca", ":BufferCloseAllButCurrent<CR>")
nmap("<leader>bcr", ":BufferCloseBuffersRight<CR>")
nmap("<leader>bs",  ":BufferPick<CR>")
nmap("<leader>bp",  ":BufferPin<CR>")


--------------------------------------------------------------------------------
-- buffers
--------------------------------------------------------------------------------

nmap("<M-w>", ":exit<CR>")
nmap("<C-w>", ":bdel<CR>")

-- nmap("ZQ", ":lua fn.closeBufferOrWindow()<CR>")
-- nmap("ZZ", ":w<CR>:lua fn.closeBufferOrWindow()<CR>")

-- Previous buffer
nmap("<BS>", "<C-^>")
-- Can open temp buffers (like help docs) in a new tab
nmap("<leader>bt", ":lua require('core.util').buf_to_tab()<CR>")
-- Create new, unsaved file at current directory
nmap("<leader>bf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]],   { silent = false })
-- Open file from current directory in vertical split
nmap("<leader>bv", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false })

-- nmap("<leader>bq", ":lua require'core.util'.delete_buffer()<CR>") -- quit buffer
-- nmap("<leader>bQ", [[:w <bar> %bd <bar> e#<CR>]])             -- quit all buffers but current
-- nmap("<leader>b%", ":luafile %<CR>", { silent = false })          -- source buffer
-- nmap("<leader>bn", [[:enew<CR>]], { silent = false })             -- new buffer


--------------------------------------------------------------------------------
-- File manager
--------------------------------------------------------------------------------

-- Change working directory to current directory
nmap("<leader>cd", ":lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>", { silent = false })


--------------------------------------------------------------------------------
-- Indentation
--------------------------------------------------------------------------------

--  imap("<Tab>",   "<Nop>")
--  imap("<S-Tab>", "<Nop>")

nmap("<Tab>",   ">>")  -- Indent
nmap("<S-Tab>", "<<")  -- Dedent
vmap("<Tab>",   ">gv") -- Indent without exiting visual mode
vmap("<S-Tab>", "<gv") -- Dedent without exiting visual mode

-- vmap("\x1b[105;5u", "<C-u>") -- Insert tab literal


--------------------------------------------------------------------------------
-- Windows
--------------------------------------------------------------------------------

nmap("<M-s>", ":vsplit<CR>:wincmd l<CR>")
nmap("<M-u>", ":split<CR>:wincmd j<CR>")

nmap("<S-Up>",    ":resize -10<CR>")
nmap("<S-Down>",  ":resize +10<CR>")
nmap("<S-Left>",  ":vertical resize +10<CR>")
nmap("<S-Right>", ":vertical resize -10<CR>")

nmap("<M-W>", ":resize -10<CR>")
nmap("<M-A>", ":vertical resize -10<CR>")
nmap("<M-S>", ":resize +10<CR>")
nmap("<M-D>", ":vertical resize +10<CR>")

--  nmap("<S-Up>", ":lua require'core.util'.resize(false, -2)<CR>")
--  nmap("<S-Down>", ":lua require'core.util'.resize(false, 2)<CR>")
--  nmap("<S-Left>", ":lua require'core.util'.resize(true, -2)<CR>")
--  nmap("<S-Right>", ":lua require'core.util'.resize(true, 2)<CR>")

-- nmap("<C-h>", "<C-w>h")
-- nmap("<C-j>", "<C-w>j")
-- nmap("<C-k>", "<C-w>k")
-- nmap("<C-l>", "<C-w>l")
-- nmap("<leader>wq", "<C-w>q") -- quit window
-- nmap("<leader>ws", "<C-w>s") -- split window
-- nmap("<leader>wv", "<C-w>v") -- vertical split
-- nmap("<leader>wh", "<C-w>h") -- jump to left window
-- nmap("<leader>wj", "<C-w>j") -- jump to the down window
-- nmap("<leader>wk", "<C-w>k") -- jump to the up window
-- nmap("<leader>wl", "<C-w>l") -- jump to right window
-- nmap("<leader>wm", "<C-w>|") -- max out to fullscreen
-- nmap("<leader>w=", "<C-w>=") -- equally high and width
-- nmap("<leader>wT", "<C-w>T") -- break out into a new tab
-- nmap("<leader>wr", "<C-w>x") -- replace current with next

--------------------------------------------------------------------------------
-- Quickfix list mappings
--------------------------------------------------------------------------------

-- nmap("[q", ":cprevious<CR>")
-- nmap("]q", ":cnext<CR>")
-- nmap("[Q", ":cfirst<CR>")
-- nmap("]Q", ":clast<CR>")
-- nmap("[l", ":lprevious<CR>")
-- nmap("]l", ":lnext<CR>")
-- nmap("[L", ":lfirst<CR>")
-- nmap("]L", ":llast<CR>")


--------------------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------------------

local telescope = require('telescope.builtin')
map("<M-d>", ":Telescope file_browser path=%:p:h<CR>")
map("<M-F>", ":ProjectRoot<CR>:Telescope live_grep<CR>")
map("<M-p>", ":ProjectRoot<CR>:Telescope find_files<CR>")
map("<M-b>",      telescope.buffers, { silent = false })
map("<leader>bb", telescope.buffers, { silent = false })
nmap("<M-O>",     telescope.lsp_document_symbols)

--  map("<M-O>", ":Telescope aerial<CR>")

-- nmap("<leader>fq", ":Telescope quickfix<CR>")
-- nmap("<leader>fR", ":Telescope registers<CR>")
-- nmap("<leader>fr", ":Telescope oldfiles<CR>")
-- nmap("<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
-- nmap("<leader>fC", ":Telescope command_history<CR>")
-- nmap("<leader>fc", ":Telescope commands<CR>")
-- nmap("<leader>fs", ":Telescope search_history<CR>")
-- nmap("<leader>fl", ":Telescope loclist<CR>")


--------------------------------------------------------------------------------
-- Git
--------------------------------------------------------------------------------

nmap("<leader>gl", ":Gitsigns toggle_current_line_blame<CR>") -- toggle line blame
nmap("<leader>gb", ":Gitsigns blame_line<CR>")                -- git blame
nmap("<leader>gd", ":DiffviewOpen<CR>")                       -- show diff
nmap("<leader>gr", ":Gitsigns refresh<CR>")

-- nmap("<leader>gn", ":Neogit<CR>")                   -- git
-- nmap("<leader>gL", ":Neogit log<CR>")               -- git log

-- nmap("<leader>gB", ":Telescope git_branches<CR>")   -- git branches
-- nmap("<leader>gf", ":Telescope git_files<CR>")      -- git files
-- nmap("<leader>gc", ":Telescope git_commits<CR>")    -- git commits

-- nmap("<leader>gp", ":Gitsigns preview_hunk<CR>")    -- preview hunk
-- nmap("<leader>gr", ":Gitsigns reset_hunk<CR>")      -- reset hunk
-- nmap("<leader>gR", ":Gitsigns reset_buffer<CR>")    -- reset buffer
-- nmap("<leader>gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
-- nmap("<leader>gs", ":Gitsigns stage_hunk<CR>")      -- git stage hunk
-- nmap("<leader>gS", ":Gitsigns stage_buffer<CR>")    -- git stage buffer
-- nmap("<leader>g[", ":Gitsigns prev_hunk<CR>")       -- previous hunk
-- nmap("<leader>g]", ":Gitsigns next_hunk<CR>")       -- next hunk


--------------------------------------------------------------------------------
-- Zen Mode
--------------------------------------------------------------------------------

-- nmap("<leader>zf", [[:lua require("plugins.zen").focus()<CR>]])
-- nmap("<leader>zc", [[:lua require("plugins.zen").centered()<CR>]])
-- nmap("<leader>zm", [[:lua require('plugins.zen').minimal()<CR>]])
nmap("<leader>za", [[:lua require('plugins.zen').ataraxis()<CR>]])


--------------------------------------------------------------------------------
-- Session
--------------------------------------------------------------------------------

nmap("<leader>sm",  [[:lua MiniStarter.open()<CR>]])
nmap("<leader>sl",  [[:lua MiniSessions.select()<CR>]])
nmap("<leader>ss",  [[:lua MiniSessions.write(vim.fn.input("Session name: "))<CR>]])
nmap("<leader>sd",  [[:lua MiniSessions.delete(vim.fn.input("Session name: "))<CR>]])

-- nmap("<leader>sm",  ":Startify<CR>") -- Open Startify menu
--  nmap("<leader>sm", ":Dashboard<CR>") -- Open dashboard
--  nmap("<leader>ss", ":SSave<CR>")    -- Save session by name
--  nmap("<leader>sl", ":SLoad<CR>")    -- Load session by name
--  nmap("<leader>sd", ":SDelete<CR>")  -- Delete session by name
--  nmap("<leader>sc", ":SClose<CR>")   -- Close session and return to Startify menu
--  nmap("<leader>sq", ":quitall<CR>")  -- Quit session (it just exits neovim?)


--------------------------------------------------------------------------------
-- help
--------------------------------------------------------------------------------

-- nmap("<leader>hh",  ":Telescope help_tags<CR>")
-- nmap("<leader>hm",  ":Telescope man_pages<CR>")
-- nmap("<leader>ht",  ":Telescope colorscheme<CR>")
-- nmap("<leader>ho",  ":Telescope vim_options<CR>")
