return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "mfussenegger/nvim-dap-python" },
		{ "theHamsta/nvim-dap-virtual-text" },
		{ "rcarriga/nvim-dap-ui" },
		{ "nvim-neotest/nvim-nio" },
		{ "leoluz/nvim-dap-go" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local widgets = require("dap.ui.widgets")

		dapui.setup()
		require("dap-python").setup("python")
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup({})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end, {})

		vim.keymap.set("n", "<leader>dt", function()
			dap.terminate()
		end, {})

		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, {})

		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, {})

		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end, {})

		vim.keymap.set("n", "<leader>b", function()
			dap.toggle_breakpoint()
		end, {})

		vim.keymap.set("n", "<leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, {})

		vim.keymap.set("n", "<leader>dr", function()
			dap.repl.open()
		end, {})

		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			widgets.hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			widgets.preview()
		end)
		vim.keymap.set("n", "<Leader>df", function()
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			widgets.centered_float(widgets.scopes)
		end)
	end,
}
