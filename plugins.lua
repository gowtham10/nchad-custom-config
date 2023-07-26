local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "folke/trouble.nvim",
    -- lazy = false,
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh", "TroubleClose" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "custom.configs.trouble"
    end,
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    -- opts = vim.tbl_deep_extend("force", overrides.telescope, M.trouble.telescope),
    opts = overrides.telescope
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Github copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require "custom.configs.copilot"
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    event = { "InsertEnter", "LspAttach" },
    cmd = "Copilot",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix", "TodoLocList" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- { "nvim-telescope/telescope-ui-select.nvim", cmd = { "Telescope" } },
  { "nvim-telescope/telescope-ui-select.nvim" },

  {
    "Shatur/neovim-session-manager",
    cmd = {
      "SessionManager",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- {
  --   "jedrzejboczar/possession.nvim",
  --   cmd = {
  --     "PossessionClose",
  --     "PossessionList",
  --     "PossessionLoad",
  --     "PossessionSave",
  --     "PossessionDelete",
  --     "PossessionRename",
  --     "PossessionShow",
  --   },
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require "custom.configs.possession"
  --   end,
  -- },

  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     require "custom.configs.dap"
  --   end,
  -- },

  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = {
  --     {
  --       "mfussenegger/nvim-dap",
  --       -- config = function()
  --       --   require "custom.configs.dap"
  --       -- end,
  --     },
  --   },
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
