return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()
    -- Telescope UI for Harpoon
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    -- Mark current file
    vim.keymap.set("n", "<leader>h", function()
      if harpoon:list():length() >= 4 then
        local first_item = harpoon:list():get(1)
        harpoon:list():remove(first_item)
      end
      harpoon:list():add()
    end, { desc = "Harpoon file" })

    -- Toggle the quick menu
    vim.keymap.set("n", "<leader>H", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Harpoon menu" })

    -- Quick navigation
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to 1" })
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon to 2" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon to 3" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon to 4" })
    vim.keymap.set("n", "<leader>z", function()
      harpoon:list():clear()
    end, { desc = "Harpoon clear" })
  end,
}
