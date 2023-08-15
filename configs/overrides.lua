local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "json",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "org",
    "http",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { "org" },
    additional_vim_regex_highlighting = { "org" },
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- bash stuff
    "bash-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "vendor/",
      "dist/",
      "build/",
      "target/",
      "out/",
      ".next/",
      "next/",
      ".git/",
    },
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ["<C-j>"] = function()
          -- require("telescope.actions").smart_send_to_qflist()
          require("trouble.providers.telescope").open_with_trouble(vim.api.nvim_get_current_buf())
        end,
      },
      i = {
        ["<C-j>"] = function()
          -- require("telescope.actions").smart_send_to_qflist()
          require("trouble.providers.telescope").open_with_trouble(vim.api.nvim_get_current_buf())
        end,
      },
    },
  },
  extensions_list = { "themes", "terms", "ui-select", "project" },
}

M.cmp = {
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "orgmode" },
  },
}

return M
