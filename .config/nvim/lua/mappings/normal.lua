local map = require("utils/utils").map

-- Quiet
map("n", "<leader>q", "<Cmd>q<CR>")

-- Save
map("n", "<leader>w", "<Cmd>w<CR>")

-- Disable Highligth
map("n", "<Leader>n", "<Cmd>nohlsearch<CR>", { silent = true })

-- Close buffer
map("n", "<leader>c", "<Cmd>bd!<CR>", { silent = true })

-- Close buffer
map("n", "<leader>t", "yslt", { silent = true })

-- Search under cursor word
map("n", "<leader>u", 'yiw/\\<<C-R>"\\><CR>')

-- Search yanked text
map("n", "<leader>y", '/<C-R>"<CR>')

-- Search and replace under cursor word
map("n", "<leader>ru", 'yiw:%s/<C-R>"/<C-R>"/<left>')

-- Search and replace yanked text
map("n", "<leader>ry", ':%s/<C-R>"/<C-R>"/<left>')

-- Pane nagivation.
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Add [count] blank lines above or below the cursor.
map("n", "[<Space>", "<Cmd>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<CR>", { silent = true })
map("n", "]<Space>", "<Cmd>put =repeat(nr2char(10), v:count1) <Bar> '[-1<CR>", { silent = true })
