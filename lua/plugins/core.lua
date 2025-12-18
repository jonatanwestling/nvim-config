-- return {
--   "projekt0n/github-nvim-theme",
--   name = "github-theme",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require("github-theme").setup({
--       -- ...
--     })
--
--     vim.cmd("colorscheme github_dark_dimmed")
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("rose-pine").setup({
--       variant = "moon", -- main | moon | dawn
--       dark_variant = "moon",
--       styles = {
--         transparency = false,
--       },
--     })
--
--     vim.cmd.colorscheme("rose-pine")
--   end,
-- }

return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "soft", -- soft | medium | hard
      transparent_mode = true,
      dim_inactive = false,
    })

    vim.cmd.colorscheme("gruvbox")
  end,
}
