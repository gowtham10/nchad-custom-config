local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- autocmd({"BufReadPost, zileReadPost"}, {
--   pattern = "*",
--   command = "normal zR",
-- })

local vim = vim
local opt = vim.opt

-------------------------------------- options ------------------------------------------
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
