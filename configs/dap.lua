local present, dap = pcall(require, "dap")

if not present then
  return
end

local textPresent, virtualText = pcall(require, "nvim-dap-virtual-text")

if not textPresent then
  return
end

virtualText.setup()

-- dapui
local uipresent, dapui = pcall(require, "dapui")

if not uipresent then
  return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open {}
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close {}
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close {}
end

vim.fn.sign_define("DapBreakpoint", { text = "🍄", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define('DapBreakpoint',{ text ='🎈', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })

-- Javascript debug adapter configurations

local vsCodePresent, dapVscodeJs = pcall(require, "dap-vscode-js")

if not vsCodePresent then
  return
end

dapVscodeJs.setup {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = {
    "chrome",
    "pwa-node",
    "pwa-chrome",
    "pwa-msedge",
    "node-terminal",
    "pwa-extensionHost",
    "node",
    "chrome",
  }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
}

-- custom adapter for running tasks before starting debug

local custom_adapter = 'pwa-node-custom'
dap.adapters[custom_adapter] = function(cb, config)
    if config.prelaunchtask then
        local async = require('plenary.async')
        local notify = require('notify').async

        async.run(function()
            ---@diagnostic disable-next-line: missing-parameter
            notify('running [' .. config.prelaunchtask .. ']').events.close()
        end, function()
            vim.fn.system(config.prelaunchtask)
            config.type = 'pwa-node'
            dap.run(config)
        end)
    end
end

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = 'Start Chrome with "localhost"',
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
    },
  }
end
