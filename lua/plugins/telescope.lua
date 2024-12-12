return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})

      local wk = require("which-key")
      wk.add({
        { "<leader>f", group = "Find" },
        { mode = "n",  "<leader>ff",  builtin.find_file, desc = "Files" },
        { mode = "n",  "<leader>fb",  builtin.buffers,   desc = "Buffers" },
        { mode = "n",  "<leader>fg",  builtin.live_grep, desc = "Grep" },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
