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
-- LSP integration
-- Make sure to also have the snippet with the common helper functions in your config!

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
 local client_id = ctx.client_id

 local val = result.value

 if not val.kind then
   return
 end

 local notif_data = get_notif_data(client_id, result.token)

 if val.kind == "begin" then
   local message = format_message(val.message, val.percentage)

   notif_data.notification = vim.notify(message, "info", {
     title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
     icon = spinner_frames[1],
     timeout = false,
     hide_from_history = false,
   })

   notif_data.spinner = 1
   update_spinner(client_id, result.token)
 elseif val.kind == "report" and notif_data then
   notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
     replace = notif_data.notification,
     hide_from_history = false,
   })
 elseif val.kind == "end" and notif_data then
   notif_data.notification =
     vim.notify(val.message and format_message(val.message) or "Complete", "info", {
       icon = "",
       replace = notif_data.notification,
       timeout = 3000,
     })

   notif_data.spinner = nil
 end
end

local severity = {
  "error",
  "warn",
  "info",
  "info", -- map both hint and info to info?
}

vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
  vim.notify(method.message, severity[params.type])
end
