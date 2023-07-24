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
