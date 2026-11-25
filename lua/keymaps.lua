-- Keymaps
local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Save with Ctrl-s (insert mode keeps Neovim's Ctrl-s signature help)
map({ "n", "x" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Move between windows with Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Split windows
map("n", "<leader>-", "<C-w>s", { desc = "Split below" })
map("n", "<leader>|", "<C-w>v", { desc = "Split right" })

-- Resize splits with Ctrl + arrows (macOS: turn off the Mission Control
-- Ctrl + arrow shortcuts in System Settings > Keyboard > Keyboard Shortcuts)
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Taller" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Shorter" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Narrower" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Wider" })

-- Quit / restart (restart reloads the whole config)
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "<leader>qr", "<cmd>restart<cr>", { desc = "Restart Neovim" })

-- Move line / selection down and up with Alt-j / Alt-k
-- (iTerm2: Profiles > Keys > Left Option key = Esc+ for Alt to work)
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
map("x", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move selection down" })
map("x", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move selection up" })

-- Indent in visual mode without losing the selection
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Toggles (Space u)
local function toggle(option, label)
  return function()
    vim.wo[option] = not vim.wo[option]
    vim.notify(label .. " " .. (vim.wo[option] and "on" or "off"))
  end
end
map("n", "<leader>uw", toggle("wrap", "Line wrap"), { desc = "Toggle line wrap" })
map("n", "<leader>ul", toggle("relativenumber", "Relative numbers"), { desc = "Toggle relative numbers" })
map("n", "<leader>us", toggle("spell", "Spell check"), { desc = "Toggle spell check" })
