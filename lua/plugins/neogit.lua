return {
	"NeogitOrg/neogit",
	-- branch = "nightly", -- provides support for nvim v.10
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = true,
	event = "VeryLazy",
}
