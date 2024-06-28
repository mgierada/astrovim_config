return {
	-- nvim worktree
	{
		"mgierada/git-worktree.nvim",
		-- dir = "/Users/maciejgierada/01_PRACA_IT/02_side_projects/git-worktree.nvim",
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("git_worktree")
		end,
		-- branch = "handle_changes_in_telescope_api",
	},
}
