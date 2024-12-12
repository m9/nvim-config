return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		lazy = false,
		config = function()
			require("lazydev").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "terraformls", "ruby_lsp" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.ruby_lsp.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

			local wk = require("which-key")
			wk.add({
				{ "<leader>c", group = "Code" },
				-- { mode = 'n', '<leader>cd', vim.lsp.buf.definition, desc = 'Definition'},
				-- { mode = 'n', '<leader>cf', vim.lsp.buf.references, desc = 'References'},
				{ mode = "n", "<leader>cd", ":Telescope lsp_definitions<CR>", desc = "Definition" },
				{ mode = "n", "<leader>cf", ":Telescope lsp_references<CR>", desc = "References" },
				{ mode = { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
				{ mode = "n", "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.rubocop,
					null_ls.builtins.diagnostics.rubocop,
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "jq", "tflint", "rubocop" },
				automatic_installation = true,
			})
			local wk = require("which-key")
			wk.add({
				{ mode = "n", "<leader>cl", vim.lsp.buf.format, desc = "Lint/Format" },
			})
		end,
	},
}
