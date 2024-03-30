require('noice').setup({
  presets = {
    bottom_search = true,
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
