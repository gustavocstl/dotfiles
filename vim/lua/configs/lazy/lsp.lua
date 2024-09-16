return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"nvim-dap-ui",
			},
		},
	},

	-- Signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			bind = true,
			hint_enable = true,
			hint_prefix = "> ",
			toggle_key = "<C-l>",
			transparency = 5,
			timer_interval = 10,
		},
		config = function(_, opts)
			local lsp_signature = require("lsp_signature")

			lsp_signature.setup(opts)

			vim.keymap.set({ "n" }, "<C-k>", function()
				lsp_signature.toggle_float_win()
			end, { silent = true, noremap = true, desc = "toggle signature" })
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			local cmp = require("cmp")

			cmp.setup({
				formatting = lsp_zero.cmp_format({ details = true }),
				mapping = cmp.mapping.preset.insert({
					["<C-e>"] = cmp.mapping.abort(),
					["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })

				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { buffer = bufnr })
				vim.keymap.set("n", "gD", "<cmd>Telescope lsp_implementations<cr>", { buffer = bufnr })
				vim.keymap.set("n", "gl", "<cmd>Telescope diagnostics<cr>", { buffer = bufnr })
				vim.keymap.set("n", "gL", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = bufnr })
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, {})
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tsserver",
					"rust_analyzer",
					"gopls",
					"clangd",
					"bashls",
					"docker_compose_language_service",
					"dockerls",
					"markdown_oxide",
					"tailwindcss",
					"terraformls",
					"yamlls",
					"jsonls",
					"sqlls",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
}
