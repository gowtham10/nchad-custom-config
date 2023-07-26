local present, possession = pcall(require, "possession")

if not present then
  return
end

possession.setup {
  -- telescope = {
  --   list = {
  --     default_action = "load",
  --     mappings = {
  --       save = { n = "<c-u>", i = "<c-u>" },
  --       load = { n = "<c-o>", i = "<c-o>" },
  --       delete = { n = "<c-x>", i = "<c-x>" },
  --       rename = { n = "<c-m>", i = "<c-m>" },
  --     },
  --   },
  -- },
}
