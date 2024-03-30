local init_startuptime = function()
  vim.g.startuptime_tries = 10
end

local init_lazy = function()
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)
end

local set_schema = function(name)
  vim.cmd('colorscheme ' .. name)
end

local init_treesitter = function(plugin)
  require('lazy.core.loader').add_to_rtp(plugin)
  require('nvim-treesitter.query_predicates')
end

return {
  init_lazy = init_lazy,
  set_schema = set_schema,
  init_treesitter = init_treesitter,
  init_startuptime = init_startuptime,
}
