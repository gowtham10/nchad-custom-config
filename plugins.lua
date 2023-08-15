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
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
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

  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh", "TroubleClose" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
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
    -- event = { "InsertEnter", "LspAttach" },
    event = "InsertEnter",
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

  -- Session Manager
  {
    "Shatur/neovim-session-manager",
    cmd = {
      "SessionManager",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Project Manager
  {
    "nvim-telescope/telescope-project.nvim",
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

  {
    "mfussenegger/nvim-dap",
    event = "InsertEnter",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "theHamsta/nvim-dap-virtual-text",
      -- build debugger from source
      -- {
      --   "microsoft/vscode-js-debug",
      --   version = "1.x",
      --   build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      -- },
    },
    config = function()
      require "custom.configs.dap"
    end,
  },

  {
    "nvim-orgmode/orgmode",
    -- enabled = false,
    lazy = false,
    config = function()
      require "custom.configs.orgmode"
    end,
  },

  {
    "vimwiki/vimwiki",
    enabled = false,
    event = "InsertEnter",
  },

  {

    "rest-nvim/rest.nvim",
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.rest"
    end,
  },

  {
    "mg979/vim-visual-multi",
    enabled = false,
    event = "InsertEnter",
  },

  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --   },
  --   config = function()
  --     require "custom.configs.dapui"
  --   end,
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
