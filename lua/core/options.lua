local set = vim.opt

-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Options
set.backup = false -- creates a backup file
set.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
-- set.cmdheight = 1 -- space for displaying messages/commands
-- set.conceallevel = 0 -- so that `` is visible in markdown files
-- set.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
set.cursorline = true -- highlight the current line
-- set.dir = vim.fn.stdpath("data") .. "/swp" -- swap file directory
set.expandtab = true -- convert tabs to spaces
set.exrc = true
set.fileencoding = "utf-8" -- the encoding written to a file
-- set.foldenable = false -- disable folding; enable with zi
set.foldlevel = 2 -- folds with a higher ievel will be closed
-- set.foldcolumn = "1"
set.foldlevelstart = 99
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
-- set.grepprg = "rg --hidden --vimgrep --smart-case --" -- use rg instead of grep
-- set.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode
-- set.history = 500 -- Use the 'history' option to set the number of lines from command mode that are remembered.
-- set.hlsearch = false -- highlight all matches on previous search pattern
set.ignorecase = true -- ignore case in search patterns
-- set.inccommand = "split"
-- set.laststatus = 2 --  The value of this option influences when the last window will have a status line (2 always)
-- set.lazyredraw = true -- do not redraw screen while running macros
set.list = false -- show white characters
set.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
set.number = true -- set numbered lines
-- set.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
-- set.timeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
-- set.signcolumn = "auto"
-- set.updatetime = 300 -- faster completion
-- set.undofile = false -- enable/disable undo file creation
-- set.undodir = vim.fn.stdpath("data") .. "/undodir" -- set undo directory
set.relativenumber = true -- set relative numbered lines
-- set.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor
set.shiftwidth = 4 -- the number of spaces inserted for each indentation
-- set.sidescrolloff = 5 -- The minimal number of columns to scroll horizontally
-- set.shortmess = o.shortmess + "c" -- prevent "pattern not found" messages
-- set.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- set.showtabline = 2 -- always show tabs
set.smartcase = true -- smart case
set.smartindent = true -- make indenting smarter again
set.smarttab = true -- make insert tabs smarter again
set.softtabstop = 2 -- the numer of spaces that a <Tab> counts for while performing editing
set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true -- force all vertical splits to go to the right of current window
-- set.swapfile = false -- enable/disable swap file creation
set.tabstop = 4 -- how many columns a tab counts for
-- set.termguicolors = true -- set term gui colors (most terminals support this)
-- set.wildignore = [[
-- .git,.hg,.svn
-- *.aux,*.out,*.toc
-- *.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
-- *.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
-- *.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
-- *.mp3,*.oga,*.ogg,*.wav,*.flac
-- *.eot,*.otf,*.ttf,*.woff
-- *.doc,*.pdf,*.cbr,*.cbz
-- *.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
-- *.swp,.lock,.DS_Store,._*
-- */tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
-- ]]
-- set.wildignorecase = true -- When set case is ignored when completing file names and directories
-- set.wildmode = "full"
