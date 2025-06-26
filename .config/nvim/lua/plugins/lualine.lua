require("battery").setup({})

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_z = {
        function()
          return require("battery").get_status_line()
        end,
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
}
