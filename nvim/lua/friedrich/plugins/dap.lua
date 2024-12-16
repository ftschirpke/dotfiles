return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            dap.adapters.lldb = {
                type = 'executable',
                command = '/usr/bin/lldb',
                name = 'lldb'
            }
            dap.configurations.cpp = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}/build',
                    stopOnEntry = false,
                    args = {},
                }
            }


            ui.setup()

            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                ui.eval(nil, { enter = true })
            end, { desc = "DAP: evaluate variable under cursor" })

            vim.keymap.set("n", "<F1>", dap.continue, { desc = "DAP: Continue" })
            vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP: Step into" })
            vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP: Step over" })
            vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP: Step out" })
            vim.keymap.set("n", "<F5>", dap.step_back, { desc = "DAP: Step back" })
            vim.keymap.set("n", "<F9>", dap.restart, { desc = "DAP: Restart" })

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}
