local search = vim.api.nvim_get_hl_by_name('Search', true)
vim.api.nvim_set_hl(0, 'TransparentSearch', { fg = search.foreground })

local help = vim.api.nvim_get_hl_by_name('IncSearch', true)
vim.api.nvim_set_hl(0, 'TransparentHelp', { fg = help.foreground })

local cmdGroup = 'DevIconLua'
local noice_cmd_types = {
  CmdLine = cmdGroup,
  Input = cmdGroup,
  Lua = cmdGroup,
  Filter = cmdGroup,
  Rename = cmdGroup,
  Substitute = 'Define',
  Help = 'TransparentHelp',
  Search = 'TransparentSearch',
}

for type, hl in pairs(noice_cmd_types) do
  vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder' .. type, { link = hl })
  vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon' .. type, { link = hl })
end

vim.api.nvim_set_hl(0, 'NoiceConfirmBorder', { link = cmdGroup })

require('noice').setup({
  presets = {
    bottom_search = false,
    lsp_doc_border = true,
    command_palette = true,
    long_message_to_split = true,
  },
  lsp = {
    override = {
      ['vim.lsp.util.stylize_markdown'] = true,
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
})
