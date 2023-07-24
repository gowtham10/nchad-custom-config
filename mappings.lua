---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
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
