--------------------------------------------------------------------------------
--[[
  <C-BS> is also read as <C-h>

  In telescope use <C-q> to send all results to quickfix and <M-q> or
  <A-q> to send selected items

  You can use a regex pattern as part of a range in command mode, E.g.
  :3,/stop/s/hello/world/g
]]

-- TODO: Refactor whenever https://github.com/neovim/neovim/pull/13823 gets merged
--------------------------------------------------------------------------------

vim.g.mapleader = " "


--------------------------------------------------------------------------------
-- Basics
--------------------------------------------------------------------------------
as.map("n", ";", ":", { silent = false })       -- Enter command mode with ;
as.map("n", "<M-x>", ":", { silent = false })   -- Enter command mode with ;
as.map("n", "s", ":HopWord<CR>")           -- Easy motion
as.map("", "<M-/>", ":Comment<CR><Down>")   -- Comment line(s)
as.map("n", "<leader>fs", ":w<CR>")         -- Save current buffer
as.map("n", "<leader>fS", ":wa<CR>")        -- Save all buffers

as.map("i", "<C-h>", "<C-u>")               -- Delete from line start to cursor
as.map("i", "<M-BS>", "<C-w>")              -- Delete preceeding word
as.map("i", "jk", "<ESC>")                  -- Exit insert mode

as.map("n", "Y", "y$")                      -- Yank to end of line
as.map("v", "Y", "<ESC>y$gv")               -- Yank without exiting visual mode
as.map("n", "<leader>y", "mY0v$<left>y`Y")  -- Yank line without newline character at the end

-- as.map("n", "<BS>", "<C-^>")             -- Previous buffer


-- Move selected line / block of text in visual mode
as.map("n", "I", "v:move '<-2<CR>")
as.map("n", "K", "v:move '>+1<CR>")
as.map("v", "I", ":move '<-2<CR>gv=gv")
as.map("v", "K", ":move '>+1<CR>gv=gv")

-- Search and replace word in current file
as.map("n", "c.", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])

-- Append current clipboard to the end of the current line
as.map("n", "<leader>p", "mY$a <ESC>p`Y")

-- Move to the end of yanked and pasted text
as.map("v", "y", "y`]")
as.map("v", "p", "p`]")
as.map("n", "p", "p`]")

as.map("n", "<leader>tc", ":ColorizerToggle<CR>")       -- Toggle Colorizer
as.map("n", "<leader>tf", "za")                         -- Toggle fold under cursor
as.map("n", "<leader>tF", "zA")                         -- Toggle all folds under cursor
as.map("n", "<leader>th", ":noh<CR>")                   -- Disable highlighting from search
as.map("n", "<leader>ti", ":IndentBlanklineToggle<CR>") -- Toggle indent guides
as.map("n", "<leader>tt", ":Twilight<CR>")              -- Toggle Twilight
as.map("n", "<leader>tw", ":set wrap!<CR>")             -- Toggle word-wrap

-- as.map("n", "<leader>e", ":NvimTreeToggle<CR>")

as.map("n", "<leader>|", [[:execute "set colorcolumn=" . (&colorcolumn == "0" ? "81" : "")<CR>]]) -- Show vertical bar at column 80
as.map("n", "<leader>rg", ":Gitsigns refresh<CR>")
as.map("n", "<leader>rq", ":cwindow<CR>")
as.map("n", "<leader>rl", ":lwindow<CR>")

as.map("n", "<leader>O", "mYO<ESC>`Y")    -- Open line above without insert
as.map("n", "<leader>o", "mYo<ESC>`Y")    -- Open line below without insert


--------------------------------------------------------------------------------
-- Command mode
--------------------------------------------------------------------------------
as.map("c", "<C-j>", "<home>")
as.map("c", "<C-l>", "<end>")
as.map("c", "<M-j>", "<Left>")
as.map("c", "<M-l>", "<Right>")
as.map("c", "<M-I>", "<Up>")
as.map("c", "<M-K>", "<Down>")

--------------------------------------------------------------------------------
-- Navigation
--------------------------------------------------------------------------------
as.map("", "j", "h")
as.map("", "h", "i")
as.map("", "k", "gj") -- Traverse wrapped rows as separate rows
as.map("", "i", "gk") -- Traverse wrapped rows as separate rows

-- Traverse word-wrapped lines as separate lines
-- as.map("", "k", 'v:count == 0 ? "gj" : "j"', { expr = true })
-- as.map("", "i", 'v:count == 0 ? "gk" : "k"', { expr = true })

as.map("i", "<M-k>", "<Down>")
as.map("i", "<M-i>", "<Up>")
as.map("i", "<M-j>", "<Left>")
as.map("i", "<M-l>", "<Right>")

as.map("n", "<C-b>i", "<C-u>") -- Half-page up
as.map("v", "<C-b>i", "<C-u>") -- Half-page up
as.map("n", "<C-k>",  "<C-d>") -- Half-page down
as.map("v", "<C-k>",  "<C-d>") -- Half-page down

as.map("n", "<M-i>", ":TmuxNavigateUp<CR>")
as.map("n", "<M-k>", ":TmuxNavigateDown<CR>")
as.map("n", "<M-j>", ":TmuxNavigateLeft<CR>")
as.map("n", "<M-l>", ":TmuxNavigateRight<CR>")

as.map("n", "<", "<C-o>") -- Jump back
as.map("n", ">", "<C-i>") -- Jump forward

--------------------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------------------
as.map("n", "gr", ":lua vim.lsp.buf.references()<CR>")
as.map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
as.map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
as.map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>")
as.map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
as.map("n", "gw", ":lua vim.lsp.buf.document_symbol()<CR>")
-- as.map("n", "gw", ":lua vim.lsp.buf.workspace_symbol()<CR>")
as.map("n", "<leader>af", ":lua vim.lsp.buf.code_action()<CR>")
as.map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
as.map("n", "<leader>ho", ":lua vim.lsp.buf.hover()<CR>")
as.map("n", "<leader>he", ":lua vim.lsp.buf.signature_help()<CR>")


--------------------------------------------------------------------------------
-- barbar.nvim
--------------------------------------------------------------------------------
as.map("n", "<C-j>", ":BufferPrevious<CR>")
as.map("n", "<C-l>", ":BufferNext<CR>")

as.map("n", "<M-J>", ":BufferMovePrevious<CR>")
as.map("n", "<M-L>", ":BufferMoveNext<CR>")

as.map("n", "<leader>bs",  ":BufferPick<CR>")
as.map("n", "<leader>bca", ":BufferCloseAllButCurrent<CR>")
as.map("n", "<leader>bcr", ":BufferCloseBuffersRight<CR>")

as.map("n", "<M-w>", ":exit<CR>")
as.map("n", "<C-w>", ":BufferClose<CR>")
as.map("n", "ZZ", ":w<CR>:BufferClose<CR>")
as.map("n", "ZQ", ":BufferClose<CR>")

-- Pinned buffers are grouped together before other buffers;
-- They are not protected from being closed.
as.map("n", "<leader>bp", ":BufferPin<CR>")


--------------------------------------------------------------------------------
-- buffers
--------------------------------------------------------------------------------

-- Can open temp buffers (like help docs) in a new tab
as.map("n", "<leader>bt", ":lua require('core.util').buf_to_tab()<CR>")
-- Create new, unsaved file at current directory
as.map("n", "<leader>bf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]],   { silent = false })
-- Open file from current directory in vertical split
as.map("n", "<leader>bv", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false })


-- as.map("n", "<leader>bq", ":lua require'core.util'.delete_buffer()<CR>") -- quit buffer
-- as.map("n", "<leader>bQ", [[<cmd>w <bar> %bd <bar> e#<CR>]])             -- quit all buffers but current
-- as.map("n", "<leader>b%", ":luafile %<CR>", { silent = false })          -- source buffer
-- as.map("n", "<leader>bn", [[:enew<CR>]], { silent = false })             -- new buffer


--------------------------------------------------------------------------------
-- File manager
--------------------------------------------------------------------------------
-- Change working directory to current directory
as.map("n", "cd", ":lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>", { silent = false })


--------------------------------------------------------------------------------
-- Indentation
--------------------------------------------------------------------------------
as.map("i", "<Tab>",   "<Nop>")
as.map("i", "<S-Tab>", "<Nop>")

as.map("n", "<Tab>",   ">>")  -- Indent
as.map("n", "<S-Tab>", "<<")  -- Dedent
as.map("v", "<Tab>",   ">gv") -- Indent without exiting visual mode
as.map("v", "<S-Tab>", "<gv") -- Indent without exiting visual mode

-- as.map("v", "\x1b[105;5u", "<C-u>") -- Insert tab literal


--------------------------------------------------------------------------------
-- windows
--------------------------------------------------------------------------------
as.map("n", "<S-Up>", ":lua require'core.util'.resize(false, -2)<CR>")
as.map("n", "<S-Down>", ":lua require'core.util'.resize(false, 2)<CR>")
as.map("n", "<S-Left>", ":lua require'core.util'.resize(true, -2)<CR>")
as.map("n", "<S-Right>", ":lua require'core.util'.resize(true, 2)<CR>")

-- as.map("n", "<C-h>", "<C-w>h")
-- as.map("n", "<C-j>", "<C-w>j")
-- as.map("n", "<C-k>", "<C-w>k")
-- as.map("n", "<C-l>", "<C-w>l")
-- as.map("n", "<leader>wq", "<C-w>q") -- quit window
-- as.map("n", "<leader>ws", "<C-w>s") -- split window
-- as.map("n", "<leader>wv", "<C-w>v") -- vertical split
-- as.map("n", "<leader>wh", "<C-w>h") -- jump to left window
-- as.map("n", "<leader>wj", "<C-w>j") -- jump to the down window
-- as.map("n", "<leader>wk", "<C-w>k") -- jump to the up window
-- as.map("n", "<leader>wl", "<C-w>l") -- jump to right window
-- as.map("n", "<leader>wm", "<C-w>|") -- max out to fullscreen
-- as.map("n", "<leader>w=", "<C-w>=") -- equally high and width
-- as.map("n", "<leader>wT", "<C-w>T") -- break out into a new tab
-- as.map("n", "<leader>wr", "<C-w>x") -- replace current with next
-- as.map("n", "<leader>w<", ":vertical resize -10<CR>") -- decrease width
-- as.map("n", "<leader>w>", ":vertical resize +10<CR>") -- increase width
-- as.map("n", "<leader>w-", ":resize -15<CR>") -- decrease height
-- as.map("n", "<leader>w+", ":resize +15<CR>") -- increase height

--------------------------------------------------------------------------------
-- Quickfix list mappings
--------------------------------------------------------------------------------
-- as.map("n", "[q", ":cprevious<CR>")
-- as.map("n", "]q", ":cnext<CR>")
-- as.map("n", "[Q", ":cfirst<CR>")
-- as.map("n", "]Q", ":clast<CR>")
-- as.map("n", "[l", ":lprevious<CR>")
-- as.map("n", "]l", ":lnext<CR>")
-- as.map("n", "[L", ":lfirst<CR>")
-- as.map("n", "]L", ":llast<CR>")

--------------------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------------------
as.map("", "<M-m>", ":Telescope media_files<CR>")
as.map("", "<M-d>", ":cd %:p:h<CR>:Telescope file_browser<CR>")
as.map("", "<M-F>", ":ProjectRoot<CR>:Telescope live_grep<CR>")
as.map("", "<M-p>", ":ProjectRoot<CR>:Telescope find_files<CR>")

as.map("", "<M-b>",      ":Telescope buffers<CR>", { silent = false })
as.map("", "<leader>bb", ":Telescope buffers<CR>", { silent = false })

-- as.map("n", "<leader>fq", ":Telescope quickfix<CR>")
-- as.map("n", "<leader>fR", ":Telescope registers<CR>")
-- as.map("n", "<leader>fr", ":Telescope oldfiles<CR>")
-- as.map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
-- as.map("n", "<leader>fC", ":Telescope command_history<CR>")
-- as.map("n", "<leader>fc", ":Telescope commands<CR>")
-- as.map("n", "<leader>fs", ":Telescope search_history<CR>")
-- as.map("n", "<leader>fl", ":Telescope loclist<CR>")

--------------------------------------------------------------------------------
-- Git
--------------------------------------------------------------------------------
as.map("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>") -- toggle line blame
as.map("n", "<leader>gb", ":Gitsigns blame_line<CR>")                -- git blame
as.map("n", "<leader>gd", ":DiffviewOpen<CR>")                       -- show diff

-- as.map("n", "<leader>gn", ":Neogit<CR>")                   -- git
-- as.map("n", "<leader>gL", ":Neogit log<CR>")               -- git log

-- as.map("n", "<leader>gB", ":Telescope git_branches<CR>")   -- git branches
-- as.map("n", "<leader>gf", ":Telescope git_files<CR>")      -- git files
-- as.map("n", "<leader>gc", ":Telescope git_commits<CR>")    -- git commits

-- as.map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")    -- preview hunk
-- as.map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")      -- reset hunk
-- as.map("n", "<leader>gR", ":Gitsigns reset_buffer<CR>")    -- reset buffer
-- as.map("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
-- as.map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")      -- git stage hunk
-- as.map("n", "<leader>gS", ":Gitsigns stage_buffer<CR>")    -- git stage buffer
-- as.map("n", "<leader>g[", ":Gitsigns prev_hunk<CR>")       -- previous hunk
-- as.map("n", "<leader>g]", ":Gitsigns next_hunk<CR>")       -- next hunk

--------------------------------------------------------------------------------
-- Zen Mode
--------------------------------------------------------------------------------
-- as.map("n", "<leader>zf", [[:lua require("plugins.zen").focus()<CR>]])
-- as.map("n", "<leader>zc", [[:lua require("plugins.zen").centered()<CR>]])
-- as.map("n", "<leader>zm", [[:lua require('plugins.zen').minimal()<CR>]])
as.map("n", "<leader>za", [[:lua require('plugins.zen').ataraxis()<CR>]])

--------------------------------------------------------------------------------
-- Session
--------------------------------------------------------------------------------
as.map("n", "<leader>s",  ":Startify<CR>")                          -- Open Startify menu
as.map("n", "<leader>sm", ":Startify<CR>")                          -- Open Startify menu
as.map("n", "<leader>ss", ":SSave<CR>")                             -- Save session by name
as.map("n", "<leader>sl", ":SLoad<CR>")                             -- Load session by name
as.map("n", "<leader>sd", ":SDelete<CR>")                           -- Delete session by name
as.map("n", "<leader>sc", ":SClose<CR>")                            -- Close session and return to Startify menu
as.map("n", "<leader>sq", ":quitall<CR>")                           -- Quit session (it just exits neovim?)
as.map("n", "<leader>sr", ":lua require('core.util').Reload()<CR>") -- Reload neovim config

--------------------------------------------------------------------------------
-- help
--------------------------------------------------------------------------------
-- as.map("n", "<leader>hh",  ":Telescope help_tags<CR>")
-- as.map("n", "<leader>hm",  ":Telescope man_pages<CR>")
-- as.map("n", "<leader>ht",  ":Telescope colorscheme<CR>")
-- as.map("n", "<leader>ho",  ":Telescope vim_options<CR>")
-- as.map("n", "<leader>hpi", ":PackerInstall<CR>")
-- as.map("n", "<leader>hpu", ":PackerUpdate<CR>")
-- as.map("n", "<leader>hps", ":PackerStatus<CR>")
-- as.map("n", "<leader>hpS", ":PackerSync<CR>")
-- as.map("n", "<leader>hpc", ":PackerCompile<CR>")
-- as.map("n", "<leader>hpC", ":PackerClean<CR>")
-- as.map("n", "<leader>hph", ":help packer.txt<CR>")
