local cmd = vim.cmd

-- Create Directories
cmd('command! -nargs=* Mkdir call mkdir(<q-args>, "p")')
-- Create Directories
cmd('command! -nargs=* Mkdir call mkdir(<q-args>, "p")')
-- LSP Commands
cmd('command! LspHover lua vim.lsp.buf.hover()')
cmd('command! LspDef lua vim.lsp.buf.definition()')
cmd('command! LspRefs lua vim.lsp.buf.references()')
cmd('command! LspRename lua vim.lsp.buf.rename()')
cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev({ float = { source = "always", width = 55 }})')
cmd('command! LspDiagNext lua vim.diagnostic.goto_next({ float = { source = "always", width = 55 }})')
cmd('command! LspDiagLine lua vim.diagnostic.open_float(0, { source = "always", scope = "line", header = false, width = 55 })')
cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
