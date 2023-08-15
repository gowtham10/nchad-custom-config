local present, orgmode = pcall(require, "orgmode")

if not present then
  return
end

orgmode.setup_ts_grammar()

orgmode.setup {
  org_agenda_files = { "~/Dropbox/org/**/*" },
  org_default_notes_file = "~/Dropbox/org/refile.org",
  org_todo_keywords = { "TODO", "IN_PROGRESS", "DELEGATED", "|", "DONE", "DROPPED" },
  -- win_split_mode = { "float", 0.9 },
  -- win_border = "solid",
  org_todo_keyword_faces = {
    -- WAITING = ":foreground blue :weight bold",
    DELEGATED = ":foreground yellow :slant italic",
    TODO = ":foreground orange :weight bold", -- overrides builtin color for `TODO` keyword
    IN_PROGRESS = ":foreground blue :weight bold",
    DROPPED = ":foreground grey :weight bold",
  },
  org_capture_templates = {
    t = { description = "Task", template = "* TODO %?\n  %U\n" },
    n = { description = "Note", template = "* %?\n  %U\n" },
    c = { description = "Clipboard", template = "* %x %?\n  %U\n" },
  },
  mappings = {
    agends = {
      org_agenda_set_tags = "<leader>ost",
    },
    org = {
      org_timestamp_up = "<leader>ozu",
      org_timestamp_down = "<leader>ozd",
      org_toggle_checkbox = "<leader>otc",
      org_open_at_point = "<leader>ool",
      org_cycle = "<leader>ocf",
      org_global_cycle = "<leader>ocg",
      org_set_tags_command = "<leader>ost",
    },
  },
}
