---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.gitsigns = {
  n = {
    ["<leader>tb"] = {
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      "Toggle current line blame",
    },
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
    ["<leader>hu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Undo stage hunk",
    },
    ["<leader>hd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "Diff this",
    },
    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      "Preview hunk inline",
    },
    ["<leader>hS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Stage buffer",
    },
    ["<leader>hR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset buffer",
    },
  },
  v = {
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "Stage hunk",
    },
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "Reset hunk",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>gc"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },
    ["<leader>gh"] = { "<cmd> Telescope git_stash <CR>", "Git stash list" },
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Symbol search" },
    ["<leader>fg"] = { "<cmd> Telescope grep_string <CR>", "String search" },
    ["<leader>fh"] = { "<cmd> Telescope search_history <CR>", "Search history"},
  },
}

M.todo = {
  n = {
    ["<leader>te"] = { "<cmd> TodoTelescope <CR>", "Todo Telescope" },
    ["<leader>tt"] = { "<cmd> TodoTrouble <CR>", "Todo Trouble" },
    ["<leader>tq"] = { "<cmd> TodoQuickFix <CR>", "Todo QuickFix" },
    ["<leader>tl"] = { "<cmd> TodoLocList <CR>", "Todo LocList" },
    ["]t"] = {
      function()
        require("todo-comments").jump_next()
      end,
      "Next todo",
    },
    ["[t"] = {
      function()
        require("todo-comments").jump_prev()
      end,
      "Previous todo",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>tx"] = { "<cmd> TroubleToggle <CR>", "Toggle trouble" },
    ["<leader>tr"] = { "<cmd> TroubleRefresh <CR>", "Trouble refresh" },
    ["<leader>tc"] = { "<cmd> TroubleClose <CR>", "Trouble close" },
    ["<leader>tk"] = { "<cmd> TroubleToggle quickfix <CR>", "Trouble quickfix" },
    ["<leader>ts"] = { "<cmd> TroubleToggle loclist <CR>", "Trouble loclist" },
    ["<leader>tw"] = { "<cmd> TroubleToggle workspace_diagnostics <CR>", "Trouble lsp workspace diagnostics" },
    ["<leader>tg"] = { "<cmd> TroubleToggle document_diagnostics <CR>", "Trouble lsp document diagnostics" },
  },
}

-- M.copilot = {
--   i = {
--     ["<C-y>"] = {"<C-y>", "Accept suggetion", opts = { nowait = true } },
--     ["<A-[>"] = {"<M-[>", "Previous suggestion", opts = { nowait = true } },
--     ["<A-]>"] = {"<M-]>", "Next suggestion", opts = { nowait = true } },
--     ["<C-x>"] = {"<C-[>", "Dismiss suggestion", opts = { nowait = true } },
--   }
-- }

-- more keybinds!

return M
