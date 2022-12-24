local map = require("utils/utils").map

-- Normal Mode
map("t", "<C-n>", "<C-\\><C-n>", { silent = true })

-- Toggle floating terminal or create new one if there is none.
map("t", "<C-t>", "<Cmd>lua require('utils/mappings/normal/terminal').toggle()<CR>", { silent = true })
map("n", "<C-t>", "<Cmd>lua require('utils/mappings/normal/terminal').toggle()<CR>", { silent = true })
map("i", "<C-t>", "<Esc><Cmd>lua require('utils/mappings/normal/terminal').toggle()<CR>", { silent = true })
