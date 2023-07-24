local present, copilot = pcall(require, "copilot")

if not present then
  return
end

copilot.setup {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 50,
    keymap = {
      accept = "<C-y>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-[>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = "node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
}
