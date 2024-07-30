return {
	-- tokyonight colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- kangawa colorscheme
	{
		"rebelot/kanagawa.nvim",
	},

	-- everforest colorscheme
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "medium"
		end,
		event = "VimEnter",
	},

	-- nightfly colorscheme
	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

	-- moonflight colorscheme
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

	-- catppuccin colorscheme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- onedarkpro colorscheme
	{
		"olimorris/onedarkpro.nvim",
		-- priority = 1000 -- Ensure it loads first
	},
	{ "rose-pine/neovim", name = "rose-pine", event = "VimEnter" },

	-- gruvbox
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, event = "VimEnter" },

	--papercolor
	{ "NLKNguyen/papercolor-theme", event = "VimEnter" },

	-- nordic
	{
		"AlexvZyl/nordic.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	require("nordic").load()
		-- end,
	},

	--flow.nvim
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("flow").setup({
				transparent = true,
				fluo_color = "orange",
				mode = "desaturate",
				aggressive_spell = true,
			})
		end,
	},
}
