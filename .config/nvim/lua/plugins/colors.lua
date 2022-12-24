local map = require("utils/utils").map
local saga = require("lspsaga")

saga.init_lsp_saga()
-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
-- Code action
map("n", "ga", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- Show line diagnostics
map("n", "J", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
-- Show cursor diagnostic
map("n", "J", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
-- Rename
map("n", "ge", "<cmd>Lspsaga rename<CR>", { silent = true })
-- Peek Definition
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
-- Lsp finder find the symbol definition implement reference
map("n", "gi", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
