-- Editor options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes" -- keep the gutter fixed so text doesn't shift

-- Indentation: 2 spaces
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search: ignore case unless the search has a capital letter
opt.ignorecase = true
opt.smartcase = true

-- Behaviour
opt.mouse = "a"
opt.clipboard = "unnamedplus" -- share clipboard with macOS
opt.undofile = true -- undo history survives restarts
opt.confirm = true -- ask to save instead of failing on :q
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 4
opt.wrap = false
opt.updatetime = 200
opt.timeoutlen = 300
