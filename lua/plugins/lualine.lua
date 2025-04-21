return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      -- Custom theme with uniform background
      local custom_theme = {
        normal = {
          a = { fg = "#ffffff", bg = "#484c5c", gui = "bold" }, -- Mode
          b = { fg = "#ffffff", bg = "#484c5c" }, -- Branch/diff/diagnostics
          c = { fg = "#ffffff", bg = "#484c5c" }, -- Filename
        },
        insert = {
          a = { fg = "#ffffff", bg = "#484c5c", gui = "bold" },
          b = { fg = "#ffffff", bg = "#484c5c" },
          c = { fg = "#ffffff", bg = "#484c5c" },
        },
        visual = {
          a = { fg = "#ffffff", bg = "#484c5c", gui = "bold" },
          b = { fg = "#ffffff", bg = "#484c5c" },
          c = { fg = "#ffffff", bg = "#484c5c" },
        },
        replace = {
          a = { fg = "#ffffff", bg = "#484c5c", gui = "bold" },
          b = { fg = "#ffffff", bg = "#484c5c" },
          c = { fg = "#ffffff", bg = "#484c5c" },
        },
        inactive = {
          a = { fg = "#ffffff", bg = "#484c5c" },
          b = { fg = "#ffffff", bg = "#484c5c" },
          c = { fg = "#ffffff", bg = "#484c5c" },
        },
      }

      return {
        options = {
          theme = custom_theme, -- Apply custom theme
          globalstatus = true,
          section_separators = { left = "", right = "" }, -- Optional: keep or remove
          component_separators = { left = "│", right = "│" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
