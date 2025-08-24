return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			ensure_installed = { "delve" }, -- optional
			automatic_installation = true,
		})

		--  DAP UI setup
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		--  LLDB for C/C++
		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/lib/llvm-14/bin/lldb-vscode", -- adjust if needed
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.c = dap.configurations.cpp

		--  Go (Delve)
		dap.adapters.go = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
			},
		}
		dap.configurations.go = {
			{
				type = "go",
				name = "Debug (main)",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug Test (file)",
				request = "launch",
				mode = "test",
				program = "${file}",
			},
		}

		--  JavaScript/TypeScript (vscode-js-debug)
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					vim.fn.stdpath("data") .. "/dap-js-debug/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
		}

		for _, lang in ipairs({ "typescript", "javascript" }) do
			dap.configurations[lang] = {
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
					name = "Attach to process",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		--  Signs
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped" })

		--  Keybindings (Leader + 1–5)
		local map = vim.keymap.set
		map("n", "<Leader>1", function()
			dap.continue()
		end, { desc = "Debug: Continue" })
		map("n", "<Leader>2", function()
			dap.step_over()
		end, { desc = "Debug: Step Over" })
		map("n", "<Leader>3", function()
			dap.step_into()
		end, { desc = "Debug: Step Into" })
		map("n", "<Leader>4", function()
			dap.step_out()
		end, { desc = "Debug: Step Out" })
		map("n", "<Leader>5", function()
			dap.toggle_breakpoint()
		end, { desc = "Debug: Toggle Breakpoint" })
	end,
}
