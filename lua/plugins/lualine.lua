return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local custom_theme = {
        normal = {
          a = { fg = "#ffffff", bg = "#30343c", gui = "bold" },
          b = { fg = "#ffffff", bg = "#30343c" },
          c = { fg = "#ffffff", bg = "#30343c" },
        },
        insert = {
          a = { fg = "#ffffff", bg = "#30343c", gui = "bold" },
          b = { fg = "#ffffff", bg = "#30343c" },
          c = { fg = "#ffffff", bg = "#30343c" },
        },
        visual = {
          a = { fg = "#ffffff", bg = "#30343c", gui = "bold" },
          b = { fg = "#ffffff", bg = "#30343c" },
          c = { fg = "#ffffff", bg = "#30343c" },
        },
        replace = {
          a = { fg = "#ffffff", bg = "#30343c", gui = "bold" },
          b = { fg = "#ffffff", bg = "#30343c" },
          c = { fg = "#ffffff", bg = "#30343c" },
        },
        inactive = {
          a = { fg = "#ffffff", bg = "#30343c" },
          b = { fg = "#ffffff", bg = "#30343c" },
          c = { fg = "#ffffff", bg = "#30343c" },
        },
      }

      -- Modify just the theme while preserving the rest
      opts.options.theme = custom_theme

      opts.options.globalstatus = true
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "│", right = "│" }

      opts.sections.lualine_a = { "mode" }
      opts.sections.lualine_b = { "branch", "diff", "diagnostics" }
      opts.sections.lualine_c = { "filename" }
      opts.sections.lualine_x = { "encoding", "filetype" }

      -- added costum macro_component, lualine dont support it
      local macro_component = {
        "macro",
        fmt = function()
          local reg = vim.fn.reg_recording()
          if reg ~= "" then
            return "Recording @" .. reg
          end
          return ""
        end,
        color = { fg = "#ff9e64" },
        draw_empty = false,
      }

      -- ⬅️ Insert it at the start of lualine_x (or wherever you prefer)
      table.insert(opts.sections.lualine_x, 1, macro_component)
      opts.sections.lualine_y = { "progress" }
      opts.sections.lualine_z = { "location" }
    end,
  },
}
