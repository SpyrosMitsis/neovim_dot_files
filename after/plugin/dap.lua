local dap, dapui = require("dap"), require("dapui")

vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', 'Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

-- dapui_config 
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


-- DAP configurations 
dap.adapters.python = {
    type = 'executable',
    command = vim.fn.expand("$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python"),
    args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}", -- This will run the current file
        pythonPath = function()
            -- This will try to find the Python path. Modify as needed.
            return '/usr/bin/python3'
        end,
    },
}

