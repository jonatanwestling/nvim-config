return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "auto"
      opts.options.globalstatus = true
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }

      opts.sections.lualine_a = { "mode" }

      opts.sections.lualine_b = {
        { "branch", icon = "" },
        { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
        "diagnostics",
      }

      opts.sections.lualine_c = {
        {
          "filename",
          path = 0,
          symbols = { modified = "●", readonly = "🔒", unnamed = "[No Name]" },
        },
      }

      local macro_component = {
        "macro",
        fmt = function()
          local reg = vim.fn.reg_recording()
          if reg ~= "" then
            return "⏺ @" .. reg
          end
          return ""
        end,
        color = { fg = "#f2cc60", gui = "bold" },
        draw_empty = false,
      }

      opts.sections.lualine_x = {
        macro_component,
        "encoding",
        { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
        "filetype",
      }

      opts.sections.lualine_y = { "progress" }
      opts.sections.lualine_z = { "location" }
    end,
  },
}
