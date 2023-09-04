-- require("tokyonight").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   light_style = "day", -- The theme is used when the background is set to light
--   transparent = false, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {italic = true},
--     variables = {italic = true},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "dark", -- style for sidebars, see below
--     floats = "dark", -- style for floating windows
--   },
--   sidebars = { "qf", "help", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = true, -- dims inactive windows
--   lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
-- })

-- vim.cmd[[colorscheme tokyonight]]

require("catppuccin").setup({
   flavour = "mocha", -- latte, frappe, macchiato, mocha
   background = { -- :h background
      light = "latte",
      dark = "mocha",
   },
   transparent_background = false, -- disables setting the background color.
   show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
   term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
   dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
   },
   no_italic = false, -- Force no italic
   no_bold = false, -- Force no bold
   no_underline = false, -- Force no underline
   styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      keywords = {"italic"},
      loops = {},
      functions = {},
         strings = {},
         variables = {},
         numbers = {},
         booleans = {},
         properties = {},
         types = {},
         operators = {},
      },
      custom_highlights = {},
      integrations = {
         nvimtree = true,
         gitsigns = true,
         cmp = true,
         treesitter = true,
         indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
         },
         native_lsp = {
            enabled = true,
            virtual_text = {
               errors = { 'italic' },
               hints = { 'italic' },
               warnings = { 'italic' },
               information = { 'italic' },
            },
            underlines = {
               errors = { 'underline' },
               hints = { 'underline' },
               warnings = { 'underline' },
               information = { 'underline' },
            },
         },
      },
   })

   -- setup must be called before loading
   vim.cmd.colorscheme "catppuccin"
