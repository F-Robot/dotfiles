local colorizer = require('colorizer')

colorizer.setup({
  'html',
  'conf',
  'lua',
  'vue',
  'typescript',
  'javascript',
  css = {
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    mode = 'background', -- Set the display mode.
  },
  -- javascript = {
  --   css = true, -- enable all css features: rgb_fn, hsl_fn, names, rgb, rrggbb
  --   css_fn = true, -- enable all css *functions*: rgb_fn, hsl_fn
  --   mode = 'background', -- set the display mode.
  -- },
  -- typescript = {
  --   css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --   css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --   mode = 'background', -- Set the display mode.
  -- },
  -- vue = {
  --   css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --   css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --   mode = 'background', -- Set the display mode.
  -- },
})
