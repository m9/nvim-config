return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim'
  },
  config = function ()
    local wk = require("which-key")
    wk.add({
      { "<leader>n", group = "NeoTree" },
      { mode = 'n', '<leader>nf', ':Neotree filesystem toggle reveal float<CR>', desc = 'Toggle floating NeoTree panel' },
      { mode = 'n', '<leader>nl', ':Neotree filesystem toggle reveal left<CR>', desc = 'Toggle left NeoTree panel' },
      { mode = 'n', '<C-n>', ':Neotree filesystem toggle reveal float<CR>', desc = 'Toggle floating NeoTree panel' }
    })
  end,
}
