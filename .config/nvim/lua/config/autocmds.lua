-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Auto save file
local function augroup(name)
  return vim.api.nvim_create_augroup("autoload_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = augroup("savebuffer"),
  callback = function()
    if vim.bo.buftype == "" and vim.fn.empty(vim.fn.bufname("")) ~= 1 and vim.bo.filetype ~= "gitcommit" then
      local save = {
        marks = {
          ["'["] = vim.fn.getpos("'["),
          ["']"] = vim.fn.getpos("']"),
        },
      }
      vim.cmd("silent! update")
      for key, value in pairs(save.marks) do
        vim.fn.setpos(key, value)
      end
    end
  end,
})
