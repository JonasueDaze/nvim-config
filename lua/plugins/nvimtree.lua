return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- set custom mappings
		local api = require "nvim-tree.api"
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		vim.keymap.set({ "n", "v", "i" }, "<C-b>", api.tree.toggle, opts("Toggle explorer"))

		local function my_on_attach(bufnr)
			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set({ "n", "v", "i" }, "<C-b>", api.tree.toggle, opts("Toggle explorer"))
		end

		-- empty setup using defaults
		require("nvim-tree").setup({
			sort_by = "extension",
			view = {
				width = 30,
			},
			on_attach = my_on_attach,
		})
	end
}
